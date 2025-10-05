# Big Dog Labs — Corporate Website

This repository contains the source for the Big Dog Labs corporate website ([bigdoglabs.com](https://bigdoglabs.com)). Big Dog Labs is a small consulting company specializing in education, documentation, and team upskilling. The site is built with Jekyll and a lightweight front-end toolchain.

## What is in this repository

- Jekyll site source (layouts, includes, posts, pages)
- Sass styles and front-end assets (under `assets/`)
- GitHub Actions workflow for building and deploying to GitHub Pages (`.github/workflows/jekyll.yml`)

## Primary goals

- Present company information, services, and process (Learn → Plan → Implement)
- Host documentation, blog posts, and project showcases
- Provide an easy local development experience for editing and previewing content

## Tech stack

- Jekyll (site generator)
- Ruby / Bundler (gems and Jekyll runtime)
- Sass for styles
- Gulp (optional, used for asset tasks in the original theme)

## Local development

1. Install system dependencies: Ruby + Bundler and Node.js
2. Install Ruby gems and JavaScript dependencies
3. Build and serve the site locally

```bash
# install ruby tools
gem install bundler jekyll      # or use your preferred Ruby manager

# install repo dependencies
bundle install                  # install gems from Gemfile
npm install || yarn             # install JS deps if present

# run dev server with live reload
bundle exec jekyll serve --livereload

# or build static to _site
bundle exec jekyll build
```

If this repository includes Gulp tasks (see `gulpfile.js`), you can also run `gulp` after installing Node dependencies.

## Configuration and customization

- Edit `_config.yml` to change site title, description, author, and other settings. The file already contains values for `title: Big Dog Labs` and other site metadata.
- Place images and static assets under `assets/` and reference them from templates or markdown files.

## Deployment notes

- This site is built and deployed to GitHub Pages using a GitHub Actions workflow. See `.github/workflows/jekyll.yml` for the exact steps.
- If you use a custom domain, add a `CNAME` file at the site root or configure the workflow to write one during build (the workflow may already include an optional CNAME step).

## License

This site and its source are provided under the MIT License (see `LICENSE`).

## Credits

- Based on a Jekyll theme and front-end work inspired by community templates and open source libraries.

## Contact

- For changes to this repository, open a PR or contact the site maintainer listed in the repository metadata.
