## Contributing to Open Source

Ask not what your community can do for you, but what you can do for your community!



## Who?

Nic Roland

Twitter: [@nicr9\_](https://twitter.com/nicr9_)

Github: [github.com/nicr9](https://github.com/nicr9)

Note:
* I'm on a lot of other things too but I didn't want to clutter the slide
* This isn't a talk about me, it's a talk about contributing to the OS community



### Code vs. Community

Note:
* People talk about code, people talk about community
* If you only take one thing away from this talk...
* Your focus/contributions should ultimately be aimed at the community
* They're the ones that contribute back!
* Not telling you to not contribute code
* The code would not exist were it not for the community



## Why?

* Developer experience
* Professional opportunities
* Building confidence

Note:
* Just to ilustrate benifits of both OS and community
* Reading someone elses code is very instructive; unraveling it feels like a murder mystery
* Prospective interns Github profiles; GitHub is my CV;
* Craftsmenship; Software is more and more relevant; change the code, change the world
* First time your PR is merged is great


<blockquote cite="https://blog.jessfraz.com/post/blurred-lines/">
    "If you have contributed to an open source project before, you know that feeling when your first pull request to a project is merged. It is magical. In that moment you have become a part of something so much bigger than yourself." -- Jessie Frazelle
</blockquote>


### Community provides all this and more!

Note:
* Talks just like this one; Blog posts; advice from colleagues
* Survey: referals
* Story about finding a new job


<img src="https://i.imgflip.com/18y7e9.jpg"/>

Note:
* Hopefully you're all psyched up now!


## Types of Contributions

<ul>
    <li>Features</li>
    <li>Bug fixes</li>
    <span class="fragment">
        <li>Grooming issues</li>
        <li>Tests/Repros</li>
        <li>Documentation</li>
    </span>
    <span class="fragment">
        <li>Blog posts</li>
        <li>Conference talks</li>
    </span>
</ul>

Note:
* I would argue this is all part of "the contribution life cycle"
* Just because you groom an issue, doesn't mean you can't contribute a fix later.
* Merge two bug reports; reliable steps to reproduce; write some tests; bug fix; clean up docs



## Tips for Finding a Project

<ol>
    <li class="fragment">Find a project you already use</li>
    <li class="fragment">Don't tackle BIG projects on your first try</li>
    <li class="fragment">Find supporting projects to start off with</li>
</ol>

Note:
* You stand to benifit from any changes
* Familiarity with external workings of a project gives you an intuition for the internal workings
* High profile projects have lots of developers and activity
* You'll have a hard time establishing a reputation
* Think plugins; anything that uses the project's API
* With time and experience you'll become comfortable with tackling larger projects


## Still Looking for Ideas?

* [openhatch.org](https://openhatch.org/)
* [github.com/sindresorhus/awesome](https://github.com/sindresorhus/awesome)
* [pypi.python.org](http://pypi.python.org/)
* [python3wos.appspot.com](https://python3wos.appspot.com/)
* [codetriage.com](https://www.codetriage.com/)
* [bountysource.com](https://www.bountysource.com/)
* [yourfirstpr.github.io](https://yourfirstpr.github.io/)
* [github.com/donnemartin/viz](https://github.com/donnemartin/viz)

Note:
* If you can't think of a project you already use, think about the general topic that interests you.
* Here's some sites you can search for related projects.
* When you find an interesting project, try it out first!
* yourfirstpr showcases low hanging fruit issues on github
* viz provides interactive visualizations of github repo stat


## Online Hackathons

* [julython.com/projects](http://www.julython.org/projects/)
* [hacktoberfest.digitalocean.com](https://hacktoberfest.digitalocean.com/)

Notes:
* Also a great place to find projects to contribute to
* There aren't enough hackathons these days IMHO


## Github & Community

* [guides.github.com/activities/contributing-to-open-source/](https://guides.github.com/activities/contributing-to-open-source/)
* [help.github.com/articles/where-can-i-find-open-source-projects-to-work-on/](https://help.github.com/articles/where-can-i-find-open-source-projects-to-work-on/)
* [github.com/explore](https://github.com/explore)
* [github.com/github](https://github.com/github)
* [github.com/blog/2195-the-shape-of-open-source](https://github.com/blog/2195-the-shape-of-open-source)

Note:
* They're really invested becaues their business model depends on OSS
* Offer a guide (not as good as this talk)
* Really interesting blog post talking about effect scaling contributors has on OS projects


<img src="https://cloud.githubusercontent.com/assets/4483/11511691/2b11c3fa-9830-11e5-8721-91d1ef644940.png"/>

Note:
* The post also discusses/graphs the effect of open sourcing a project
* Bottom line: Open Source is a community effort



## Reading Code

Reading someone else's code can seem daunting
<p class="fragment">Most of a developer's life will be spent reading code</p>

Note:
* It's a skill like any other, practice makes perfect


<blockquote cite="https://www.goodreads.com/work/quotes/3779106-clean-code-a-handbook-of-agile-software-craftsmanship-robert-c-martin">
    "Indeed, the ratio of time spent reading versus writing is well over 10 to 1. We are constantly reading old code as part of the effort to write new code. ...[Therefore,] making it easy to read makes it easier to write."<br> -- Robert C. Martin
</blockquote>


<img src="http://ecx.images-amazon.com/images/I/51oXyW8WQwL._SX387_BO1,204,203,200_.jpg"/>


## Code Reading Tips

<ul>
    <li class="fragment">Search for the error messages in the code</li>
    <li class="fragment">Learn to use grep/IDE's advanced search features</li>
    <li class="fragment">Take "stream of conciousness" notes</li>
    <li class="fragment">Rewind the git history</li>
    <li class="fragment">git log -- file.txt</li>
    <li class="fragment">Read test cases, they offer a lot of context</li>
</ul>

Note:
* I advise learning grep anyway because you can pipe it
* "Read the source" isn't always enough, sometime you need the data too
* If your project doesn't have test cases, contribute some



## First PR suggestions

* Include an open source licence
* Update a project's dependancies
* Fix a broken CI build

Note:
* A lot of projects on GitHub don't already have licences
* MITs a nice general purpose licence - Just my opinion...
* Make sure to run the full test suite after updating dependancies
* Anyone have any other suggestions?


## Preparing Your Change

A lot of projects will provide guidance on how they like changes to be submitted

<ul class="fragment">
    <li>CONTRIBUTING(.txt)</li>
    <li>README(.txt)</li>
    <li>Project wiki/docs</li>
</ul>

Note:
* Finding/reading/implementing these suggestions before submitting is REALLY important, don't waste the maintainers time


## Specific Prep Steps

* Tests
* Documentation
* Linting
* Semantic commit messages
* Squash commits
* Backporting
* Contributor license agreements
* Context in PR description

Note:
* You might be asked to do some of these things


### Semantic Commit Messages

<img src="http://i.imgur.com/wSrS9Vo.png"/>
<a href="http://karma-runner.github.io/0.13/dev/git-commit-msg.html">karma-runner.github.io/0.13/dev/git-commit-msg.html</a>

Note:
* feat, fix, docs, style, refactor, tests, chore
* Automatic generating of the changelog
* Simple navigation through git history


### PR Description

<img src="http://i.imgur.com/b4wrVer.png"/>

Note:
* Who, what, why, where, when, how
* Why would you go to all of the trouble?



## Getting Your Change Accepted

<ol>
    <li>Make it as little work as possible for the maintainer to accept it</li>
    <li class="fragment">Expect scrutiny</li>
    <li class="fragment">Getting constructive feedback</li>
    <li class="fragment">Polite persistence is the key</li>
</ol>

Note:
* Make it clear what your change is about
* Make sure your code is clean and easy to validate
* After that they shouldn't have a problem merging it
* Remember that you're trying to build a rapport here


## Dealing With Rejection

* Maintainer too busy?
* Is your feature considered out of scope?
* Did you misunderstand the project's target use case?
* Toxic community?

Note:
* Linux is a great example but there's plenty of others


<img src="http://www.findmysoft.com/img/news/No-Love-Lost-Between-Linus-Torvalds-and-NVIDIA.jpg"/>


<img src="http://i.imgur.com/Jc7tnpB.png"/>
<a href="https://twitter.com/samuelfine/status/765968743872749568">src:twitter.com/samuelfine/status/765968743872749568</a>


<img src="http://i.imgur.com/LvTCTJY.png"/>
<a href="http://arstechnica.com/information-technology/2016/02/data-analysis-of-github-contributions-reveals-unexpected-gender-bias/">src:arstechnica</a>



## What Next?

<ul>
    <li>Make a habit of contributing</li>
    <li>What can you learn from a project?</li>
    <li>What can you bring to a project?</li>
    <li class="fragment">Tackle a larger project</li>
</ul>

Note:
* Don't be in a rush to move on
* Eventually, you'll find you're ready to...


## Engaging the Community

* Project mailing lists and forums
* Bug trackers
* Slack / IRC / Gitter
* Meetup.com and Eventbrite
* Conferences
* Sprints and hackathons

Note:
* It's as much about reputation than good code
* Subscribe to some issues and follow the conversation
* Meet people in person if possible


## Contributors Guides

* [wiki.gnome.org/GnomeLove](https://wiki.gnome.org/GnomeLove)
* [kernelnewbies.org](http://kernelnewbies.org/)
* [whatcanidoformozilla.org](http://www.whatcanidoformozilla.org/)
* [wiki.documentfoundation.org/Development/EasyHacks](https://wiki.documentfoundation.org/Development/EasyHacks)
* [Kibana: ponyfoo.com/articles/art-of-pull-request](https://ponyfoo.com/articles/art-of-pull-request)
* [blog.docker.com/2015/10/how-i-started-contributing-to-the-docker-project/](https://blog.docker.com/2015/10/how-i-started-contributing-to-the-docker-project/)
* [thenewstack.io/contributing-prometheus-history-alertmanager/](http://thenewstack.io/contributing-prometheus-history-alertmanager/)

Note:
* OS projects are generally only hindered by the number of people contributing
* Big projects try to attract new contributors with guides


## Support Programs

* [gnome.org/opw](https://www.gnome.org/opw/)
* [railsgirlssummerofcode.org](http://railsgirlssummerofcode.org/)
* [developers.google.com/open-source/gsoc/](https://developers.google.com/open-source/gsoc/)

Note:
* Encouraging diversity is also a priority for many OS projects



## Taking on a bigger role

* [help.github.com/categories/building-a-strong-community/](https://help.github.com/categories/building-a-strong-community/)
* [producingoss.com](http://producingoss.com/)
* [open-advice.org](http://open-advice.org/)

Note:
* I wish I had more advice here...
* ProducingOSS is about how to run a successful OSS project
* "What would you have liked to know when you started contributing?"; 42 contributors


## Licencing

* [opensource.org/licenses](https://opensource.org/licenses)
* [tldrlegal.com](https://tldrlegal.com/)
* [bswd.com/CNSV-1304-Saper(IP-SIG).pdf](https://goo.gl/1TI6tN)

Note:
* Don't forget to work on your own projects too!
* Take the time to choose an open source licence



## Contributions Welcome

[github.com/nicr9/slides](https://github.com/nicr9/slides)

[@nicr9\_](https://twitter.com/nicr9_)
