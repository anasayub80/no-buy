# Lessly no-buy app

**Working name. Visual edition 03.** Complete community-informed mobile UI/UX with 82 navigable screens, original illustrations, motion and browser-local interactions.

[Open the private review prototype](https://lessly-design.m-anasayub80.chatgpt.site)

## Read first

- [Complete app idea and product requirements](docs/App-product-requirements.md)
- [Product document in Word](docs/App-product-requirements.docx)
- [UI/UX specification and all screen routes](docs/UIUX-specification.md)
- [25-post community research and coverage limits](docs/community-research.md)
- [Original asset manifest and prompts](docs/asset-manifest.md)
- [Visual direction, layouts and motion guide](docs/Visual-design-guide.md)

## Visual redesign

Pet Care’s clearer review layout is adapted to Lessly: persistent screen navigation, journey chips, searchable full-phone previews, and direct access to all 82 screens. The mobile system uses bold, readable headings, restrained italic accents and bottom-aligned onboarding actions. Seven original illustrations cover pauses, recovery, owned belongings, goals, food alternatives and daily enjoyment. Gentle art motion, breathing cues, short completion effects and an explicit persistent motion setting respect the system reduced-motion preference.

[Open the complete screen gallery](https://lessly-design.m-anasayub80.chatgpt.site/?view=screens)

See [the Pet Care-inspired design handoff](docs/Pet-care-inspired-design.md) for screen placement, responsive behavior and implementation notes.

## Core product flow

Save a product link → choose 3 days or 1 week → revisit it when ready → buy thoughtfully, skip or wait longer. Try [Save a product](https://lessly-design.m-anasayub80.chatgpt.site/#add-item). Saved URLs, review dates and reminder preferences persist locally. Edits can preserve or change the review date. Today and Wants surface due items. OS notification delivery is a required native-app integration and is not connected in the web prototype.

## What works

Challenges, wants with timestamp cooldowns, a live 90-second pause, exception reflection, local check-ins, owned inventory and use-up progress, personal no-spend activities, a familiar food plan, manual shopping-friction checklist, sale reflection, purchase/return records, category pockets with manual carry-in, recurring-cost review, payment commitments, multiple goals and actual set-aside contributions, data export and progress-card download.

All records stay in your browser. Seed charts/dates are identified as sample data. Auth, bank services, transfers, retailer operations, reminder delivery, app blocking and buddy sync are not connected. Currency changes relabel demo amounts without converting them.

## Run and verify

No package installation or build is needed. Open dist/index.html or serve dist with a static server. The test harness needs Node.js.

```sh
npm test
npm run check
```

Use Prototype for the app, All screens for the full inventory, and Brand & system for the design board. On mobile, tap Screen index to inspect any flow.

## Files

- dist: hosted HTML/CSS/JS, optimized local artwork and downloadable specifications
- assets/originals: full-resolution transparent PNG artwork
- docs: full product, design, research and asset documentation
- scripts: reproducible Word-document and screen-inventory builders
- tests: source/render/state regression checks
- .openai/hosting.json: identity and configuration for the existing review Site

## Research and validation

Reviewed 25 accessible entries from the cached r/nobuy New feed, including 22 member posts and 3 moderator threads. This is not a verified live latest-25 sample or evidence of product efficacy. Links and concise paraphrases are recorded without copying full posts, usernames or personal financial/medical histories. No community messages or promotions were sent.

Source/state regression checks pass. Browser/device visual and native accessibility QA remain pending. The production roadmap and exact integration boundaries are in the product requirements. The separate pet-care and Kerdova projects were not modified.
