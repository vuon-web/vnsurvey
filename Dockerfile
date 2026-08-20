FROM hugomods/hugo:exts
WORKDIR /src
COPY . .
RUN hugo mod get github.com/adityatelange/hugo-PaperMod
RUN hugo --minify
