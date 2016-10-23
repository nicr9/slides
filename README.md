# Slide Decks by Nic Roland

I thought it would be a cool idea to write my presentations as `reveal.js` powered webpages and keep them in git.

This would mean that it would be easy for me to accept feedback in the form of a pull request or github issue.

## Dependancies

If you want to test these slide decks locally you'll need `make` and `docker` installed.

You should be able to find instructions for installing make regardless of which operating system you use.

If you're a Windows/OS X person and you need to install docker, check out [docker-toolbox](https://www.docker.com/products/docker-toolbox). It'll sort you out. If you prefer Linux, installation instructions will vary from distro to distro but it's usually pretty [straight forward](https://docs.docker.com/engine/installation/).

## Serving slide decks

To host the slides locally with docker:

```bash
make test
```

If all goes well you should a full copy of the slides site at [localhost:8000](http://localhost:8000).

## Using my slides

Do you want to use present of my slide decks for a talk of your own, with or without modification?

I worked hard to research and compile these slides so I would really appriciate attribution. Mentioning this [repo](https://github.com/nicr9/slides) or my [twitter handle](https://twitter.com/nicr9_) is enough.

If you end up making modifications/improvements to any of these decks, consider contributing them back via pull request. A rising tide lifts all boats.
