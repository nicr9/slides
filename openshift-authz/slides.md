# OpenShift Authorisation

System and container level permissions models

Note:
* A run down of the various permission restriction features in OpenShift.


## Who?

Nic Roland - Team Shifters

Twitter: [@nicr9\_](https://twitter.com/nicr9_)

Github: [github.com/nicr9](https://github.com/nicr9)



## Overview

* Users, groups, `system:admin` and ServiceAccounts
* ClusterPolicies, Roles and RoleBindings
* SecurityContextConstraints

Note:
* Any RBAC/ACL system relies on a concept of identity
* Two major types of permission;
    - Those controling actions taken against OpenShift resources
    - Those controling actions you can take inside containers
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



## Users


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
* `oc login -u nic`
* IdentityProviders are plugable authentication backends
* You can create new users just by signing into them
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

A `ClusterPolicy` is a collection of `Role`s

A `Role` contains rules, each of which ties a list of verbs to a list of resources

Note:
* These `ClusterPolicies` explain what it means to have a `Role`
* Clusters come with a `clusterpolicy/default` provided
* It's what is used by a lot of the logical internals of OpenShift


Lets review the `ClusterPolicies/default` to find a suitable `Role` for `developer`

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



Lets create a new project...

```bash
$ oc adm new-project demo
Created project demo
```

...and give `nic` view access

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



### Roles Demo

Now lets quickly create a demo application

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
* We get an error saying "User <username> can't <verb> <resource>"


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


Quick jump back to the webconsole to scale the app



## SecurityContextConstraints

Worst title for a slide ever

TODO: finish this!
