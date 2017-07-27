# OpenShift Authorisation

System and container level permissions models

Note:
* A run down of the various permission restriction features in OpenShift.


## Who?

Nic Roland - Team Shifters

Twitter: [@nicr9\_](https://twitter.com/nicr9_)

Github: [github.com/nicr9](https://github.com/nicr9)



## Overview

* **Identity** - Users, groups and `system:admin`
* **System Access** - ClusterPolicies, Roles and RoleBindings
* **Container Restriction** - SecurityContextConstraints and ServiceAccounts

Note:
* Any RBAC/ACL system relies on a concept of identity
* Two major types of permission;
    - Those controling actions taken against OpenShift system + it's resources
    - Those controling actions container processes can take
* N.B. this talk will only briefly touch on IdentityProviders


### End goal

I want you to understand why you don't have permission to do \*that\*

Note:
* "I don't know or care what it is that you're trying to do on OpenShift"
* Hopefully, with that understanding you'll be able to resolve your own problems



### Prereqs

* Install [Minishift](https://github.com/minishift/minishift/releases)
* Install OpenShift CLI [(called `oc`)](https://github.com/openshift/origin/releases)

Note:
* Minishift is a tool for managing a VM based OpenShift development environment
* download the latest release from github...
* Untar and `cp` the executable to `/usr/local/bin`


Start up the `minishift` cluster

```text
$ minishift start
Starting local OpenShift cluster using 'kvm' hypervisor...
...
OpenShift server started.
   The server is accessible via web console at:
       https://192.168.42.165:8443

   You are logged in as:
       User:     developer
       Password: developer

   To login as administrator:
       oc login -u system:admin
```

Note:
* Takes a few minutes
* Access to web console
* We'll come back to talk about `developer` later...


`oc` is available through `minishift`:

```text
$ eval $(minishift oc-env)
```

Note:
* For those who are too lazy to download `oc`
* `minishift start` installs it outside the path



## Users and groups

Note:
* I shouldn't have to explain the importance of user management
* While on site I've dealt with a number of issues relating to user/permission management
* It can be embarrassing to not have a good grasp on RBAC
* That said dev's don't always have access anyway


`minishift` creates a default user called `developer`

```bash
$ oc whoami
developer
```

`developer` has admin access to `myproject`

```bash
$ oc projects
You have one project on this server: "My Project (myproject)".

Using project "myproject" from context named "minishift" on server "https://192.168.42.165:8443".
```

Note:
* OpenShift creates `myproject` by default!
* `oc whoami`
* `oc projects`
* If you're wondering how to change user, `minishift` makes it really easy...


`AllowAllPasswordIdentityProvider` enabled by default

```bash
$ oc login -u nic
Password:
Login successful.

You dont have any projects. You can try to create a new project, by running

    oc new-project <projectname>
```

Note:
* IdentityProviders are plugable authentication backends
* You can create new users just by signing into them
* `oc login -u nic`
* Note the password prompt; it will accept anything
* You'll obviously want to consider other `IdentityProvider`s for your production clusters


`nic` doesn't get to have any fun

<p class="fragment">
Changing that requires an administrator
</p>

Note:
* Limited visibility into projects
* Limited permissions to change things



### system:admin

The `system:admin` user is a special administrator account

```bash
$ oc login -u system:admin
Logged into "https://192.168.42.222:8443" as "system:admin" using existing credentials.

You have access to the following projects and can switch between them with 'oc project <projectname>':

  * default
    kube-system
    myproject
    openshift
    openshift-infra

Using project "default".
```

Note:
* `oc login -u system:admin`
* Notice we weren't asked for a password; `minishift` configures `oc` with a cert for authentication.
* Password access to `system:admin` is disabled for security reasons
* Also: we've switched to the "default" project



## Roles and ClusterPolicies

A `Role` contains rules tying a list of verbs to a list of resources

A `ClusterPolicy` is a collection of `Role`s

Note:
* These `ClusterPolicies` explain what it means to have a `Role`
* Clusters come with a `clusterpolicy/default` provided
* It's what is used by a lot of the logical internals of OpenShift
* I've seen clients run as an admin to avoid fighting with the permissions system
* Truth be told; It's not that hard, the docs are just boring as hell


Lets review the `ClusterPolicies/default` to find a suitable `Role` for `nic`

```
$ oc describe clusterPolicies | less -S
...
admin       Verbs             ...  Resources
            [get list watch]  ...  [bindings events limitranges...]
            [impersonate]     ...  [serviceaccounts]
...
basic-user  Verbs             ...  Resources
            [get]             ...  [users]
            [list]            ...  [projectrequests]
...
```

Note:
* This command spits out A LOT of info; note the ellipses
* It's best to pipe it to `less` and scroll around


Some interesting `Role`s:

<ul>
    <li>`basic-user` - The lowest of the low</li>
    <li>`view` - You can look but you can't touch</li>
    <li>`edit` - Edit most resources; no access to "top shelf" stuff</li>
    <li>`admin` - Project admin</li>
    <li>`cluster-admin` - Admin for all projects</li>
    <span class="fragment">
      <li>...</li>
      <li>`system:image-builder` - Used to run Image Builds</li>
      <li>`system:image-puller` - Used by ServiceAccounts to run Pods</li>
      <li>`system:deployer` - Used to manage ReplicationControllers</li>
    </span>
</ul>

Note:
* Some of these roles are cluster-wide
* Theres a lot of `system:...` roles that are used internally


### Suggested Roles policy

* Teams are represented by groups
* Each team is provided a project per service
* Team members are granted `edit` roles
* Team leads are granded `admin` roles
* Operations staff are `cluster-admin`

Note:
* This allows team members to affect change on a day to day basis
* Team leads are required for important administrative work like creating a PersistentVolume
* Operations staff can admin user accounts and other cross project resources like SCCs



### Roles Demo

Lets create a new project

```bash
$ oc adm new-project demo
Created project demo
```

and give `nic` view access

```bash
$ oc project demo
Now using project "demo" on server "https://192.168.42.165:8443".
$ oc adm policy add-role-to-user view nic
role "view" added: "nic"
```

Note:
* `oc adm new-project demo`
* Make sure you switch projects first!
* `oc project demo`
* `oc adm policy add-role-to-user view nic`


In the project we'll create a demo application

```bash
$ oc new-app https://github.com/openshift/ruby-hello-world.git
--> Found Docker image d9c9735 (11 days old) from Docker Hub for "centos/ruby-22-centos7"

    ...

--> Creating resources ...
    imagestream "ruby-22-centos7" created
    imagestream "ruby-hello-world" created
    buildconfig "ruby-hello-world" created
    deploymentconfig "ruby-hello-world" created
    service "ruby-hello-world" created
--> Success
    Build scheduled, use 'oc logs -f bc/ruby-hello-world' to track its progress.
    Run 'oc status' to view your app.
```

Note:
* `oc new-app https://github.com/openshift/ruby-hello-world.git`
* Remember that we created this as `system:admin`, not `nic`


Let's pop over to the web console...

```bash
$ minishift console
```

Note:
* `minishift console`
* Sign in as `nic`
* Highlight app health and lack of editing controls


Let's login as `nic` in the CLI...

```bash
$ oc login -u nic
Logged into "https://192.168.42.165:8443" as "nic" using existing credentials.

You have one project on this server: "demo"

Using project "demo".
```

...and try to scale the app there

```bash
$ oc scale --replicas=2 dc/ruby-hello-world
error: Scaling the resource failed with: User "nic" cannot update deploymentconfigs/scale in project "demo"; Current resource version Unknown
```

Note:
* `oc login -u nic`
* `oc scale --replicas=2 dc/ruby-hello-world`
* We get an error saying "User X can't Y Z"


Finally, lets fix this by upgrading `nic`'s Role to edit

```bash
$ oc login -u system:admin
...
$ oc adm policy add-role-to-user edit nic
role "edit" added: "nic"
```

Note:
* `oc login -u system:admin`
* `oc adm policy add-role-to-user edit nic`
* N.B. This doesn't overwrite the `view` role that `nic` already had
* Quick jump back to the webconsole to scale the app



### Security Context Constraints (SCC)

An SCC controls permissions for processes running inside of Pods

Note:
* Frequently you'll be asked to get legacy software running in OpenShift
* This might work in Docker but not in OpenShift
* Reason: it expected to be run as root
* OpenShift has a lot of security restrictions enabled by default
* They're controlled by SCCs


Restrictions enforced by SCCs:

* Mount volumes on the host
* Access host network
* Expose host ports
* Run container with `--privileged`
* File capabilities
* Run as User
* SELinux Contexts

Note:
* `--privileged` access to all devices on host and some additional SELinux settings
* File capabilities will be familiar to people who've used `setcap`


List available SCCs

```text
$ oc get scc
NAME               PRIV      CAPS      SELINUX     RUNASUSER          FSGROUP     SUPGROUP    PRIORITY   READONLYROOTFS   VOLUMES
...
hostaccess         false     []        MustRunAs   MustRunAsRange     MustRunAs   RunAsAny    <none>     false            [configMap downwardAPI emptyDir hostPath persistentVolumeClaim secret]
...
privileged         true      []        RunAsAny    RunAsAny           RunAsAny    RunAsAny    <none>     false            [*]
restricted         false     []        MustRunAs   MustRunAsRange     MustRunAs   RunAsAny    <none>     false            [configMap downwardAPI emptyDir persistentVolumeClaim secret]
```

Interesting SCCs:

* **restricted** - Default SCC when deploying Pods</li>
* **privileged** - Full access; Pods granted all rights</li>
* **hostaccess** - <code>restricted</code> + hostPath</li>

Note:
* If you're wondering why I singled out `hostaccess`, it's gonna show up later


Common usecases for SCCs include:

* To allow processes to run as root (or some other PID)
* To expose application ports directly on the host
* To mount directories from the host inside Pods
* To enforce custom SELinux rules

Note:
* If you're deploying the pods yourself you shouldn't have a problem
* If you're using more advanced OpenShift primitives, you'll need a ServiceAccount



## Service Accounts

A `ServiceAccount` is a special user/identity that performs automated actions

Note:
* While you can sign into a serviceaccount, it's usually used to support automated deployments


What do serviceaccounts have to do with SCCs?

Note:
* Most of the time you won't be deploying Pods yourself; it'll be a serviceaccount
* Granting SCCs to `sa/default` is a bad idea
* You'll need to create a custom serviceaccount!


Each project has a set of default serviceaccounts

```bash
$ oc get serviceaccounts
NAME       SECRETS   AGE
builder    2         1d
default    2         1d
deployer   2         1d
```

Note:
* `oc get serviceaccounts`
* `sa/default` is used by ReplicationControllers and DeploymentConfigs to deploy pods
* `sa/deployer` is used to scale ReplicationControllers up and down
* `sa/builder` is used by BuildConfigs


## SCC Demo

Let's modify our `ruby-hello-world` example so it oversteps it's bounds

```bash
$ oc edit dc/ruby-hello-world
```

Here's an example of the changes:

```text
containers:
  - name: test-container
    volumeMounts:
    - mountPath: /test-pd
      name: test-volume
  volumes:
  - name: test-volume
    hostPath:
      path: /data
```

Note:
* `oc edit dc/ruby-hello-world`
* Add a `hostPath` volume to the Pod template
* Add a `volumeMount` to the container


Eventually this will fail:

```text
$ oc logs po/ruby-hello-world-2-deploy
--> Scaling up ruby-hello-world-2 from 0 to 2, scaling down ruby-hello-world-1 from 2 to 0 (keep 2 pods available, dont exceed 3 pods)
    Scaling ruby-hello-world-2 up to 1
-->  FailedCreate: ruby-hello-world-2 Error creating: pods "ruby-hello-world-2-" is forbidden: unable to validate against any security context constraint: [spec.containers[0].securityContext.volumes[0]: Invalid value: "hostPath": hostPath volumes are not allowed to be used]
error: timed out waiting for "ruby-hello-world-2" to be synced
```

Note:
* `oc logs po/ruby-hello-world-2-deploy`
* You'll notice the new pods don't come up immediately
* "unable to validate against any security context constraint"
* "hostPath volumes are not allowed to be used"


So lets create a serviceaccount and add `scc/hostaccess`:

```
$ oc create serviceaccount demo
serviceaccount "demo" created
$ oc adm policy add-scc-to-user hostaccess -z demo
```

Note:
* `oc create serviceaccount demo`
* `oc adm policy add-scc-to-user hostaccess -z demo`


Next we'll update the DeploymentConfig to take advantage of the new ServiceAccount

```bash
$ oc edit dc/ruby-hello-world
```

The containers need a securityContext:

```text
securityContext:
  hostaccess: true
```

And the Pod need to know the serviceAccountName:

```text
template:
  spec:
    serviceAccountName: demo
```



# Questions?
