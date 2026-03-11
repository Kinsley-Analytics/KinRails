# KinRails

Rails 8 SaaS template with AI-native capabilities. Start from kin.

## Requirements

- Ruby 4.0.1
- Rails 8
- PostgreSQL
- Node.js + Yarn (for esbuild JS bundling)

## Quick Start

```bash
bin/setup
bin/dev
```

Visit `http://localhost:3000`.

## Starting a New Project From This Template

```bash
git clone https://github.com/yourusername/kinrails.git my_new_app
cd my_new_app
rm -rf .git && git init
bin/rename my_new_app
bin/setup
bin/dev
```

## Stack

- **Ruby 3.4.x / Rails 8** — latest stable
- **PostgreSQL** — UUIDv7 primary keys via `SecureRandom.uuid_v7`
- **Hotwire** (Turbo + Stimulus) — server-rendered HTML, no React/HTMX
- **Sass** via dartsass-rails — standalone binary, no Node dependency for CSS
- **ViewComponent** — testable, reusable UI components with sidecar ERB
- **Solid Queue / Cache / Cable** — Rails 8 defaults, DB-backed, no Redis
- **Propshaft** — asset pipeline
- **Kamal 2** — deployment
- **Minitest + Fixtures** — testing

## Architecture

This template follows the 37signals/DHH "vanilla Rails is plenty" philosophy. Business logic lives in models and POROs, never in service objects. See `CLAUDE.md` for the complete architectural guide.

## Design System

Sass design system with BEM naming, located in `app/assets/stylesheets/design_system/`:

- `_tokens.scss` — spacing, type scale, colors, radii, shadows, breakpoints
- `_mixins.scss` — reusable patterns (`@include card`, `@include button-primary`, etc.)
- `_reset.scss` — minimal modern CSS reset

Component styles live in `app/assets/stylesheets/components/`, one file per ViewComponent.

## Database

PostgreSQL with UUIDv7 primary keys on all tables. Create and migrate:

```bash
bin/rails db:prepare
```

## Tests

```bash
bin/rails test              # Unit and integration tests
bin/rails test:system       # System tests (Capybara + Selenium)
```

## Adding Features

Features are added incrementally as needed:

```bash
bundle add ruby_llm          # AI (OpenAI + Anthropic)
bundle add ahoy_matey        # Analytics
bundle add maxminddb geocoder # Geolocation
bundle add madmin             # Admin panel
bundle add pay stripe         # Billing
bundle add lograge            # Structured logging
```

## Key Directories

```
app/components/               # ViewComponent classes + sidecar ERB
app/assets/stylesheets/
  design_system/              # Tokens, mixins, reset
  components/                 # One .scss per component (BEM)
app/models/concerns/          # Concerns as adjectives (Closeable, Billable)
test/components/              # ViewComponent tests
```

## Scripts

- `bin/setup` — install dependencies, create database, run migrations
- `bin/dev` — start Rails server + asset watchers
- `bin/rename <new_name>` — rename the app for a new project
- `bin/recreate` — rebuild the template from a fresh `rails new` (for Rails upgrades)

## License

MIT