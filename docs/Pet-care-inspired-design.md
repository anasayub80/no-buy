# Pet Care-inspired Lessly design handoff

Version 1.3 · 11 October 2026 · working name Lessly.

The user preferred Pet Care's complete-screen view, straightforward typography and illustrated scenes. This update adapts that presentation to Lessly while preserving its independent green identity and existing 82-screen product flows. Pet Care source and screenshots were read as references; that repository was not modified and its artwork was not copied.

## Review experience

[Complete screen gallery](https://lessly-design.m-anasayub80.chatgpt.site/?view=screens). Choose a journey chip, combine it with the sidebar search, and select a labeled phone frame to open the interactive screen. Clearing results restores all screens. Existing individual `#screen-id` links still work.

| Reference principle | Lessly implementation |
| --- | --- |
| Complete phone frames | 390×844px mobile layouts at 66% gallery scale |
| Labels above each screen | Numbered, readable screen names outside the frame |
| Persistent navigation | Desktop searchable screen index remains beside the gallery |
| Journey filtering | All 14 journeys, combinable with search |
| Clear hierarchy | Bold system-sans headings, short explanations, restrained italic emphasis |
| Prominent scenes | Seven original illustrations with contextual placement |
| Clear onboarding action | Independent content scroll area and bottom-aligned action buttons |
| Visible accessible motion | Gentle drift, breathing guide, completion effects, persistent motion control |

## New illustration placement

| Original asset | Main uses |
| --- | --- |
| Sprout companion | Welcome, ready, pause studio, check-in completion, letting go of a want, recovery, recovery plan, progress review, buddy, invitation, temptation plan, recoverable error |
| Enough wardrobe | Clarity onboarding, owned collection, use-up overview, declutter, shopping-friction checklist |
| Little escape | Growth onboarding, goals landscape, goal detail, create goal, set-aside completion, payment commitments |
| Simple meal | Food-delivery alternative and personal pantry plan |

The existing hourglass, garden and quiet ritual remain in their useful contexts. The asset board includes all seven downloadable runtime files. Full-resolution originals and exact image-generation prompts are committed alongside the optimized files.

## Implementation

`dist/journeys.css` supplies the shared presentation overrides. `dist/app.js` supplies real phone gallery markup, journey filtering, keyboard routing, scene composition, onboarding action layout and motion settings. `dist/community.js` applies the wardrobe to the use-up journey. UI/UX inventory and hosted documentation are synchronized by `scripts/sync-design-docs.cjs`.

The prototype stays buildless and browser-local. This update adds no backend, bank access, app blocking, automatic reminders, messaging or payments. Turning decorative motion off never pauses the functional timer. System reduced motion takes precedence. Existing records remain compatible.

## Review remaining

Browser/device visual QA is pending: review small-height screens, text scaling, first-viewport balance, VoiceOver/TalkBack, focus order and touch targets before native release. The automated checks cover all screen renders/routes, financial-state separation, gallery filtering/search/reset and motion/timer independence; they do not replace device review.
