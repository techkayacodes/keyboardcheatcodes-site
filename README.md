# keyboardcheatcodes.com

The Keyboard Cheat Codes blog. Astro static site, deployed to GitHub Pages by `.github/workflows/deploy.yml` on every push to `main`.

## Write a post
Add a markdown file to `src/content/blog/` with this front matter:

```yaml
---
title: "Every Keyboard Switch Explained"
description: "One or two sentences for Google and social previews."
pubDate: 2026-10-26
youtube: "VIDEO_ID"        # optional, embeds the video
cover: "/images/your-cover.png"  # optional, put the image in public/images/
tags: ["keyboards"]
draft: false               # true = not published
---
```

Then commit and push. The site rebuilds in about a minute.

## Run locally
`npm install` then `npm run dev`. Links to the free sheet, the $7 sheet and socials live in `src/consts.ts`.
