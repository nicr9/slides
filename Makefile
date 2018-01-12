REVEALJS_VERSION=3.6.0
.PHONY: gitignore init _update update generate

gitignore:
	grep -q -F '^public$$' .gitignore || echo 'public' >> .gitignore

init: .gitignore
	git checkout --orphan gh-pages
	git reset --hard
	git commit --allow-empty -m "Initialising gh-pages branch"
	git push origin gh-pages
	git checkout master
	git worktree add -B gh-pages public origin/gh-pages

public:
	git worktree add -B gh-pages public origin/gh-pages

_update: public
	rm -rf ./public/*
	wget -qO- https://github.com/hakimel/reveal.js/archive/${REVEALJS_VERSION}.tar.gz | tar -xzC ./public -f - --strip-components=1

update: _update generate

generate:
	cp -r open_source public
	cp -r groupie public
	cp -r openshift-authz public
	cp index.html public
