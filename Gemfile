source "https://rubygems.org"

# Use the GitHub Pages gem so the local bundle matches what GitHub Pages runs.
# This ensures compatibility with GitHub Pages build environment.
gem "github-pages", group: :jekyll_plugins

# Keep a supported theme (minima is supported by GitHub Pages).
gem "minima", "~> 2.0"

# For local development on newer Ruby versions (Ruby 3+) webrick may be needed
# to run `jekyll serve` locally.
gem "webrick"

# Notes:
# - Removed gems that are not included in GitHub Pages' supported plugins/themes,
#   such as `minimal-mistakes-jekyll`, `jekyll-admin`, and `jekyll-include-cache`.
# - If you rely on Minimal Mistakes specifically, you'll need to build & deploy
#   using a CI pipeline that installs that theme (or keep it and accept it's
#   unsupported on github.io). Using `github-pages` is the safest option for
#   compatibility with GitHub Pages.