---
title: "Welcome to My Engineering Blog"
date: 2026-08-21
draft: false
categories:
  - Engineering
tags:
  - hugo
  - github-pages
  - docker
summary: "How this Hugo blog is built and deployed without installing Hugo locally."
---

This blog is built with **Hugo**, developed through **Docker Compose**, and deployed automatically to **GitHub Pages**.

## Local development

```bash
docker compose up
```

Then open `http://localhost:1313`.

## Deployment

Push to `main` and GitHub Actions builds the site and deploys it to GitHub Pages.
