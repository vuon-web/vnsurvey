# Personal Engineering Blog — Hugo + Docker + GitHub Pages

A production-ready starting point for a personal technology blog.

## Stack

- Hugo + PaperMod
- Docker Compose for local development
- GitHub Actions for CI/CD
- GitHub Pages for hosting
- Optional custom domain
- Optional Giscus comments
- Built-in RSS, sitemap, robots.txt, OpenGraph support from the theme

## 1. Start locally — no Hugo installation required

Requirements: Docker Desktop only.

```bash
docker compose up
```

Open http://localhost:1313.

Stop:

```bash
docker compose down
```

## 2. Create a post

```bash
make new POST=posts/rust/error-handling/index.md
```

Or use the default archetype directly:

```bash
docker compose run --rm hugo hugo new content posts/rust/error-handling/index.md
```

## 3. Preview drafts

The Docker Compose server includes drafts and future posts.

## 4. Configure the site

Edit `hugo.yaml`:

- `baseURL`
- title / description / author
- GitHub / LinkedIn URLs
- analytics if desired

Replace `YOUR_DOMAIN` in `static/CNAME` with your domain. If you do not use a custom domain, remove `static/CNAME`.

## 5. GitHub Pages

1. Push this repository to GitHub.
2. Go to **Settings → Pages**.
3. Set **Source** to **GitHub Actions**.
4. Push to `main`.
5. The deploy workflow builds Hugo and publishes the `public/` artifact.

## 6. Custom domain

For a domain such as `blog.example.com`:

1. Set `baseURL: "https://blog.example.com/"`.
2. Put `blog.example.com` in `static/CNAME`.
3. In your DNS provider, create a CNAME from `blog` to `YOUR_USERNAME.github.io`.
4. In GitHub Pages settings, configure the custom domain and enable HTTPS after DNS resolves.

For an apex domain such as `example.com`, use the GitHub Pages A/AAAA records recommended by GitHub instead of a CNAME.

## 7. Giscus comments

Giscus uses GitHub Discussions and is configured through PaperMod's comment integration.

After enabling Discussions on the repository:

1. Install/authorize the Giscus GitHub App.
2. Visit https://giscus.app/ and choose the repository.
3. Copy the generated configuration into a `layouts/partials/comments.html` override or your chosen theme configuration.

Do not hard-code secrets in the repository. Giscus public identifiers are safe to publish.

## 8. Production workflow

```text
git push
   ↓
GitHub Actions
   ├── CI on pull requests
   └── Build + deploy on main
            ↓
       GitHub Pages
```

No Hugo, Node.js, Go, Ruby, or package manager needs to be installed on your real machine. Docker Desktop is the only local runtime dependency.

## 9. Recommended repository policy

- Keep `main` deployable.
- Write posts on branches such as `post/rust-error-handling`.
- Open a pull request.
- Let CI validate the Hugo build.
- Merge to `main` to publish.

## 10. Theme

This starter uses PaperMod as a Hugo module. Docker downloads the theme automatically, so you do not need to install Hugo, Go, Node.js, or Git on your machine.
