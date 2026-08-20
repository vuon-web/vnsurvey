.PHONY: dev build clean new check

dev:
	docker compose up

build:
	docker compose run --rm hugo hugo --minify

check:
	docker compose run --rm hugo hugo --minify --panicOnWarning

clean:
	rm -rf public resources .hugo_build.lock

new:
	@test -n "$(POST)" || (echo "Usage: make new POST=posts/rust/error-handling/index.md" && exit 1)
	docker compose run --rm hugo hugo new content $(POST)
