## Contributing to Open Source

Ask not what your community can do for but what you can do for your community!



## Who?

Nic Roland

Twitter: [@nicr9\_](https://twitter.com/nicr9_)

Github: [github.com/nicr9](https://github.com/nicr9)

Note:
* I'm on a lot of other things too but I didn't want to clutter the slide
* This isn't a talk about me, it's a talk about contributing to the OS community



### Open Source vs. Community

Note:
* OS is about the code, community is about the people
* Your focus/contributions should ultimately be aimed at the community
* They're the ones that contribute back!
* Not telling you to not contribute code
* N.B. You can't have the code w/o the people
* If the people didn't have the code, they'd just write more code!



## Why?

* Building confidence
* Developer experience
* Professional opportunities
<li class="fragment">Community provides all this and more</li>

Note:
* Just to ilustrate benifits of both OS and community
* Craftsmenship; Software is more and more relevant; change the code, change the world
* Reading someone elses code is very instructive; unraveling it feels like a murder mystery
* Prospective interns Github profiles; GH is my CV;


<blockquote cite="http://programmers.stackexchange.com/questions/294/how-can-i-find-a-good-open-source-project-to-join">
    "It is really hard to describe the satisfaction of using something, finding a bug, grabbing the source and fixing it" -- Tim Post (src:StackExchange)
</blockquote>


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


## Looking for ideas?

* [julython.com/projects](http://www.julython.org/projects/)
* [openhatch.org](https://openhatch.org/)
* [pypi.python.org](http://pypi.python.org/)
* [python3wos.appspot.com](https://python3wos.appspot.com/)
* [bountysource.com](https://www.bountysource.com/)
* [contribhub.org](http://contribhub.org/)
* [codetriage.com](https://www.codetriage.com/)
* [github.com/donnemartin/viz](https://github.com/donnemartin/viz)

Note:
* If you can't think of a project you already use, think about the general topic that interests you.
* Here's some sites you can search for related projects.
* When you find an interesting project, try it out first!


## Github growing the community

* [guides.github.com/activities/contributing-to-open-source/](https://guides.github.com/activities/contributing-to-open-source/)
* [github.com/blog/2195-the-shape-of-open-source](https://github.com/blog/2195-the-shape-of-open-source)

* [yourfirstpr.github.io](https://yourfirstpr.github.io/)

Note:
* They're really invested becaues their business model depends on OSS
* Offer a guide (not as good as this talk)
* Really interesting blog post talking about effect scaling contributors has on OS projects
* yourfirstpr showcases low hanging fruit issues on github
* viz is interactive github repo stat visualizations



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
* If your project doesn't have test cases, contribute some



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
* Squash commits
* Backporting
* Contributor license agreement
* Context in PR description


<img src="http://i.imgur.com/b4wrVer.png"/>



## Getting Your Change Accepted

<ol>
    <li>Make it as little work as possible for the maintainer to accept it</li>
    <li class="fragment">Expect scrutiny</li>
    <li class="fragment">Getting constructive feedback</li>
    <li class="fragment">Polite persistence is the key</li>
</ol>

Note:
    Make it clear what your change is about,
    Make sure your code is clean and easy to validate,
    After that they shouldn't have a problem merging it
    Remember that you're trying to build a rapport here



## Dealing With Rejection

<ul>
    <li>Maintainer too busy?</li>
    <li>Is your feature considered out of scope?</li>
    <li>Did you misunderstand the project's target use case?</li>
    <li>Toxic community?</li>
</ul>

Note:
* Linux is a great example but there's plenty of others


<img src="http://www.findmysoft.com/img/news/No-Love-Lost-Between-Linus-Torvalds-and-NVIDIA.jpg"/>


<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
<blockquote class="twitter-tweet" data-lang="en">
    <p lang="en" dir="ltr">
        <a href="https://twitter.com/steveklabnik">@steveklabnik</a>
        <a href="https://twitter.com/ag_dubs">@ag_dubs</a>
        “thanks” vs. “actually”<br><br>hmmmmmmmm. 🤔
        <a href="https://t.co/GEa0O1Z7qy">pic.twitter.com/GEa0O1Z7qy</a>
    </p>
    Samuel Fine (@samuelfine)
    <a href="https://twitter.com/samuelfine/status/765968743872749568">August 17, 2016</a>
</blockquote>


<img src="http://i.imgur.com/LvTCTJY.png"/>
<a href="http://arstechnica.com/information-technology/2016/02/data-analysis-of-github-contributions-reveals-unexpected-gender-bias/">src:arstechnica</a>



## What Next?

Make a habit of contributing
What can you learn from a project?
What can you bring to a project?



## Tackling larger projects
<ul>
    <li>Project mailing lists and forums</li>
    <li>Bug trackers</li>
    <li>Slack / IRC / Gitter</li>
</ul>

Note:
* First off, this make take some time
* It's as much about reputation than good code
* Subscribe to some issues and follow the conversation


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
* Big projects try to attract/support new contributors with guides


## Support Programs

* [gnome.org/opw](https://www.gnome.org/opw/)
* [railsgirlssummerofcode.org](http://railsgirlssummerofcode.org/)
* [developers.google.com/open-source/gsoc/](https://developers.google.com/open-source/gsoc/)



## Become a part of the community

* Meetup.com and Eventbrite
* Conferences
* Sprints and hackathons

Note:
* Meet people in person if possible


## Don't forget to work on your own projects too!

* [producingoss.com](http://producingoss.com/)
* [tldrlegal.com](https://tldrlegal.com/)



<h2>Contributions Welcome</h2>

<a href="https://github.com/nicr9/presentations">github.com/nicr9/presentations</a>

<a href="https://twitter.com/nicr9_">@nicr9_</a>
