# Lessly Visual edition 04

13 October 2026. The latest 91-screen, 15-journey design adds a playful shopping-detox layer while preserving the forest, cream, mint and clay identity. See [Shopping detox design](Shopping-detox-design.md) for current screens and interactions.

## Previous visual edition 03

11 October 2026. Working name. The complete 82-screen, 14-journey prototype now follows the clearer screen-review concept the user preferred in Pet Care.

## Creative direction

A little more life, a little less checkout. Keep the forest-green brand, warm peach and pale mint illustrations, and a calm canvas. Use a legible, confident mobile interface with occasional editorial accents. The illustrations should explain the purpose of the screen and make the app recognizable. Forms keep enough space for entering and reviewing information.

System sans supplies bold headings, labels and controls. Georgia italic adds a few warm accents. Main phone headings are 32px with 1.14 line height; onboarding headings are 36px, or 34px on small screens. Descriptions are 13px, field text is 14px, and supporting labels are 10–12px. The review prototype uses local fonts and no remote font requests. Native delivery must honor font scaling.

## Key compositions

| Surface | Composition | Purpose |
| --- | --- | --- |
| Welcome | Sprout scene, two-line headline, short explanation, fixed action area | Recognizable, understandable starting point |
| Pause introduction | Hourglass scene and a little floating note | Explain the space between urge and choice |
| Clarity introduction | Wardrobe scene and selective italic accent | Make existing belongings feel useful |
| Growth introduction | Weekend bag scene | Give actual set-aside money a personal purpose |
| Today | Forest landscape, distinct money figures, check-in and pause | Make the next useful action obvious |
| Challenges | Finite chapter card and circular day progress | Personal, adaptable commitments |
| Waiting room | Individual object compositions and calm expiry labels | Store a want without promoting checkout |
| Pause | Sprout companion, warm circular framing and breathing/time treatment | A comfortable reflective moment |
| Recovery | Small illustrated sprout band | Return after a purchase without erased history |
| Owned and use-up | Wardrobe illustrations | Enjoy suitable existing belongings |
| Goals | Weekend bag landscape and separate goal cards | Meaningful possibilities backed by manual confirmations |
| Food alternative | Simple meal story band above the pantry plan | Support a familiar meal instead of delivery |
| Screen gallery | Full 390×844px phone frames scaled to 66% | Compare first-viewport layouts without arbitrary crop panels |

## Original art

Seven original illustrations share a matte ceramic/clay 3D language. Hourglass: reflection. Garden: gradual growth. Quiet ritual: reading and tea. Sprout companion: patience and recovery. Wardrobe: suitable items already owned. Weekend bag: meaningful goals. Meal: a familiar food alternative. The generated artwork was inspected and both original RGBA PNGs and transparent optimized WebP copies are included. Exact prompts and paths are in asset-manifest.md.

Artwork is contained within deliberate scenes or compact bands. Headlines, status values and controls remain HTML, making text editable and localizable. No competitor assets or screenshot imagery are included in the repository.

## Motion specification

| Interaction | Treatment | When motion is off |
| --- | --- | --- |
| Screen entry | Existing brief opacity/upward reveal | Immediate appearance |
| Sculpture | Seven-second ±7px drift with restrained rotation | Static illustration |
| Floating scene note | Seven-second small drift and tilt | Static note |
| Scene accents | Twelve-second restrained turn | Static accents |
| Progress and challenge ring | Existing 800ms appearance; actual state controls values | Final state shown |
| Breathing cue | Six-second scale cycle | Static circle; timer continues |
| Completion particles | One brief 900ms burst when a completion screen mounts | Hidden |
| Action response | Small press/hover response | Immediate state response |
| Screen gallery | Same gentle illustration movement, lazy-loaded artwork, content visibility | Static previews |

Motion controls are available in the gallery, prototype review controls and asset board. The setting persists under `lessly-motion`, independent of the app records. Changing it does not rerender the screen or alter a running countdown. The operating system reduced-motion preference wins and disables decorative movement. No animation library is required.

## Responsive review layout

Desktop: persistent header; searchable navigator; complete phone previews with labels above; wrapping journey filters. The gallery uses flexible columns with a 257.4px minimum per phone. At 700px and below the navigator collapses and the gallery uses as many complete phone columns as fit, usually one on a narrow phone. Individual screen exploration uses the full mobile viewport. Onboarding content can scroll separately from the action area when height is constrained.

Gallery phone content is inert: pressing a preview opens its interactive screen. Enter and Space support the same action. Forms, buttons and nested navigation work in Prototype mode. The gallery presents each screen's first full device viewport; long content is scrollable after opening that screen.

## Verification status

Source/render/state regression checks pass for all 82 screens. The new filters combine with text search, reset correctly, and motion changes preserve app records and a running timer. All seven artwork files have genuine transparent alpha channels and runtime references resolve. Browser/device visual and native accessibility QA remain pending because the required browser control was unavailable in this environment.
