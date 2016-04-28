# My Presentations

I thought it would be a cool idea to write my presentations as `reveal.js` powered webpages and keep them in git.

This would mean that it would be easy for me to accept feedback in the form of a pull request or github issue.

## Installing docker

I thought it'd be relatively easy to get docker to do the heavy lifting here. You'll need docker and docker-compose installed.

If you're a Windows/OS X person, check out [docker-toolbox](https://www.docker.com/products/docker-toolbox). It'll sort you out. If you use Linux it will vary from distro to distro but it's usually [straight forward](https://docs.docker.com/engine/installation/).

## Serving slide decks

To build and run a slide deck (such as `contributing_to_open_source`) run the following:

```bash
docker-compose build contributing_to_open_source
docker-compose up -d contributing_to_open_source
```

If all goes well you should find my slides at [localhost:8000](http://localhost:8000).

**N.B.:** Because ports are hard coded you can only run one set of slides at a time. To stop/remove a running set of slides:

```bash
docker-compose rm -f contributing_to_open_source
```

## Using my slides

Do you want to use one of my presentations for a talk of your own, with or without modification?

I worked hard to research and compile these slides so I would really appriciate attribution. Mentioning this [repo](https://github.com/nicr9/presentations) or my [twitter handle](https://twitter.com/nicr9_) is enough.

If you end up making modifications/improvements to any of these decks, consider contributing them back via pull request. A rising tide lifts all boats.
