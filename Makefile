post: 
	@if test -z "$$title" || test -z "$$ext"; then \
		echo "Usage: make post title=TITLE ext=EXT"; \
	else \
		filePath="./pages/posts/`date -u '+%Y%m%d'`_$$title.$$ext"; \
		touch "$$filePath"; \
		echo "Created post $$filePath";\
	fi

build:
	cabal run site -- build

css-watch:
	tailwindcss -i stylesheet.css -o static/stylesheet.css --watch