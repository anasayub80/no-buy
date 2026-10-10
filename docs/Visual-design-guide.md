# Lessly / Visual edition 02

10 October 2026. Working name. An expressive visual redesign of the complete 82-screen, 14-journey interactive app prototype.

## Creative direction

Make buying less feel like making room for a life, rather than maintaining a restrictive finance spreadsheet. Forest-green editorial surfaces anchor the experience. Warm cream gives the interface space. Pale mint suggests growth; clay makes reflective moments feel human. Sculptural illustrations are part of the composition, not decorative thumbnails appended to a form.

Georgia supplies the expressive display face. A local system sans-serif supplies controls and dense content. The prototype does not load Inter remotely: it uses that font only if it already exists on a device, otherwise the device's native sans-serif. Editorial headlines range from 39 to 61 CSS pixels in the phone interface. Field text is 14px, body text 13px, and small supporting labels are 9–12px. Native implementation must honor font scaling and accessibility settings.

## Key compositions

| Surface | Composition | Why it exists |
| --- | --- | --- |
| Welcome | Large two-line statement, framed garden, one primary action | Establish a recognizable identity and a simple starting point |
| Today | Illustrated forest landscape, paired money figures, check-in, pause and joy | Put the next useful action before administrative tools |
| Challenges | Dark chapter card, circular day progress, illustrated small-start card | Make a challenge feel finite, personal and adaptable |
| Waiting room | Calm object compositions, clear prices and cooldown labels | Capture a want without creating urgency or promoting checkout |
| Pause | Warm hourglass composition and dedicated breathing/time treatment | Give reflection its own visual environment |
| Goals | Sculptural total, individual goal cards and actual contributions | Connect buying less with meaningful personal possibilities |
| Joy menu | Reading-ritual illustration, energy filters and personal activities | Offer an accessible alternative at the moment of temptation |
| Screen index | Actual rendered miniature screens | Let a developer review the full visual system and every journey |

## Original art

The hourglass represents time to reflect. The garden represents gradual progress. The new quiet ritual combines ceramic tea, books, leaves and a warm architectural arch to represent enjoyment of what is already here. These are original generated assets, not competitor screenshots or UI mockups. Full-resolution transparent PNG originals and optimized transparent WebP files are both committed. See asset-manifest.md for paths and exact generation prompts.

The dashboard and goals place the garden inside a forest-green landscape. Welcome and pause use cream/clay circular framing. The joy menu and personal alternatives place the reading ritual in a warm composition. Artwork scales with object-fit containment; labels remain native HTML and can be changed or localized without editing imagery.

## Motion specification

| Interaction | Timing and treatment | Reduced-motion behavior |
| --- | --- | --- |
| Screen entry | 400ms opacity plus 9px upward reveal | Immediate appearance |
| Element entry | 500ms reveal, 40–150ms stagger | Immediate appearance |
| Sculpture | Eight-second ±7px drift with restrained rotation | Static illustration |
| Progress bar | 800ms growth from its left edge | Final value shown immediately |
| Challenge ring | 800ms arrival, value derived from challenge duration | Final ring shown immediately |
| Breathing cue | Six-second scale cycle | Static circle; timer still functional |
| Primary action | 200ms hover lift; immediate small press contraction | Color/state response without movement |
| Completion mark | 700ms arrival | Immediate completion mark |
| Gallery previews | All animation disabled; illustrations lazy-loaded | Same static preview |

Animations never alter financial values, check-ins, cooldown timestamps or timer behavior. Decorative motion does not introduce purchases, rewards or a streak reset. CSS prefers-reduced-motion removes animations and transitions, including smooth scrolling. No animation library or additional runtime dependency is needed.

## Responsive and component details

Desktop presents a 410px review phone, navigable journey rail and design notes. The phone remains vertically scrollable when viewport height is limited. Below 700px, the review chrome becomes compact and the app uses the available mobile width and dynamic viewport height. Below 359px, headline and illustration sizing adjusts to retain the intended hierarchy.

Primary controls use 17px corners, cards 24–29px, and illustrated frames up to 36px. Forms retain explicit labels, validation and preserved browser-local records. Buttons have visible focus and press feedback. The waiting room's gallery objects use the existing editable SVG icon system; accurate text and monetary values remain HTML.

## Implementation and verification

dist/styles.css retains the underlying layout system. dist/visual.css supplies the visual edition, component refinements, screen layouts and motion. dist/app.js defines the redesigned primary compositions; dist/community.js applies matching illustration framing to community-informed tools.

The existing source/state regression checks cover all 82 screens and core interactions. Browser-based pixel inspection, real device layout, assistive technology, keyboard behavior and download viewing still require device/browser review. The design has not received an award; professional design quality is the goal, not an award claim.
