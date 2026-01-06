docker run --rm \
  -v "$PWD:/srv/jekyll" \
  -p 4000:4000 \
  -it ghcr.io/actions/jekyll-build-pages:latest \
  jekyll serve --watch --force_polling