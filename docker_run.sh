docker run --rm \
  -v "$PWD:/srv/jekyll" \
  -p 4000:4000 \
  -e LANG=C.UTF-8 \
  -it jekyll/jekyll:latest \
  jekyll serve --watch --force_polling