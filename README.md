# Laburos

A personal job search application for finding opportunities that match my
profile and interests, built in Ruby and intended to run on a Raspberry Pi.

Laburos is also a learning project for exploring minimal Ruby, Raspberry Pi,
and Spinel. Development happens in small, working steps, with correctness on
CRuby first and experimentation with Spinel afterward.

## Current status

The project is in its initial setup stage. No application code is implemented
yet.

## Planned MVP

The first version will follow one small, complete workflow:

```text
fetch jobs → filter matches → detect new jobs → generate HTML → send email
```

It will:

1. Fetch job posts from the latest Hacker News **“Who is hiring?”** monthly
   thread through an API, avoiding HTML scraping where possible.
2. Filter posts for potentially relevant opportunities.
3. Track previously found jobs to avoid duplicates.
4. Generate a simple HTML page showing new matches.
5. Send an email when new jobs are found.

A generic scraping system, scheduling, multiple sources, dashboards, AI, and
automatic applications are outside the initial scope.

## Development principles

- Use plain Ruby with as few dependencies as possible; avoid frameworks such
  as Rails.
- Keep the code small, simple, and easy to understand.
- Add one capability at a time and verify it before moving on.
- Use tests where they add value.
- Make the workflow work correctly on CRuby before trying Spinel.
- Isolate and investigate Spinel incompatibilities as potential learning and
  contribution opportunities.

## Longer-term direction

Once the small workflow works, the application may run continuously on a
Raspberry Pi, periodically searching a configurable set of sources. Additional
features will be considered incrementally.

See [AGENTS.md](AGENTS.md) for the project goals and working guidelines.
