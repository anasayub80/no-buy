# Lessly — complete mobile UI/UX specification

Working name: **Lessly**. The final name has not been chosen. Version 1.5, 13 October 2026. This is an interactive design prototype for a no-buy / low-buy mobile app, not a released financial service.

## Product promise

**Buy less. Live more.** Help people create space between an impulse and a purchase, make realistic personal commitments, enjoy what they own, and give money actually set aside a purpose.

Primary audience: English-speaking adults in the US, UK and European markets who want to reduce impulsive discretionary spending. Launch with one focused audience and validate their needs before expanding localization. The product is intended to be feasible for a solo indie developer.

## What is delivered

- 90 designed, navigable mobile screens across 15 journeys.
- Responsive design-review website with a mobile prototype, searchable screen navigator, complete screen index, and brand/system board.
- Seven original illustrations: hourglass, growth garden, quiet ritual, sprout companion, enough wardrobe, little escape and simple meal, transparent full-resolution originals, optimized local WebP assets, original vector identity and icon system.
- Motion: screen entrances, slow illustrative movement, breathing cue, live countdown and tactile button feedback, with a persistent motion toggle and system reduced-motion support.
- Interactive browser-local demo: challenge setup, rule editing, wants, purchase decisions, inventory, multiple goals and contributions, check-ins, reminders preferences, timer, reflections, export and share-card download.
- Source, meaningful regression checks, this specification, and an asset manifest.

## Competitive context and differentiation hypotheses

Primary source reviewed: [mallow’s public Apple App Store listing](https://apps.apple.com/us/app/mallow-no-buy-tracker/id6738301938). Its public description includes skipped purchases, cooldown wishlists, a pre-buy questionnaire, tags, check-ins/calendar, streaks/notes, monthly spending goals and personal no-buy rules. These are established category features, not Lessly inventions.

The following are **additional concepts beyond that public listing**, not verified claims that mallow lacks them. No private competitor access or head-to-head usability study was performed. Public listings may omit features and change over time.

| Opportunity | Lessly design | Why it could matter | Validation needed |
| --- | --- | --- | --- |
| Act during the urge | 90-second guided pause; trigger and before/after urge reflection | Gives users an action at the purchase moment | Completion, return visits, reported usefulness; do not assume therapeutic effects |
| See a price personally | Optional take-home work-hours perspective | Adds context without bank integration | Whether it helps decisions without guilt |
| Remember existing alternatives | Manual “enough collection”; category comparison | Offers a useful route other than buying or banning | Inventory effort and reuse rate |
| Honest goal progress | Skipped cost separated from confirmed money set aside | Avoids overstating savings | User comprehension of the distinction |
| Planned purchases belong | Purchase log updates allowance; exceptions are explicit | Supports low-buy instead of all-or-nothing behavior | Accurate rules and allowance comprehension |
| Recover without punishment | Kind recovery plan and rolling consistency | Lets people return after an impulse purchase | Retention and perceived pressure |
| Prepare before sales | Date, need list and boundary plan | Acts before externally imposed urgency | Usefulness around shopping events |
| Private accountability | One trusted buddy, amounts hidden by default | Support without another feed | Demand, privacy understanding and operating cost |

The defensible advantage should come from a coherent, useful daily experience and measured outcomes, rather than a large feature count. A solo developer can test the first six ideas without AI, bank APIs, retailer scraping or a community moderation system.

## Core journeys

1. **Start:** Welcome → three concept introductions → intention → preferences → reminder primer → ready → first challenge.
2. **Commit:** Challenge type → categories → rules/exceptions → timeframe/allowance → review → progress → adjust → completion/reflection.
3. **Decide:** Waiting room → add want → detail → owned alternative / work-hours view → pre-buy reflection → wait, skip or log a purchase.
4. **Pause:** Pause studio → trigger and urge strength → 90-second timer → after-urge reflection → alternative action.
5. **Recover:** Unplanned purchase → name trigger → one helpful next step → return to the day or adjust rules. Keep history intact.
6. **Grow:** Goal → confirm money actually moved or reserved outside the app → updated contribution progress → optional share card.
7. **Notice:** Daily check-in → consistency → calendar → reflection → patterns → one weekly adjustment.
8. **Connect:** Quiet circle → reviewed invitation → user-controlled copy/share. Private notes and wants are excluded.

## Navigation and screen behavior

The app has five primary destinations: Today, Challenges, Pause, Wants, and Patterns. Inventory and Goals are available from contextual entry points and Settings. Subflows have a consistent back action. The review website additionally exposes every screen for inspection; its screen numbers and annotations are not intended for the shipped app.

Every core flow includes useful context, a clear next action, and a way to return. Long forms scroll within the phone. Inputs have labels, hints, validation and focus on an invalid field. Screen transitions use subtle vertical entrances. The live timer can pause, resume or finish early, and pauses on navigation or when the page becomes hidden.

First-use, empty, offline and recoverable error states are included. Offline/sync screens specify intended product behavior; this static site has no installed service worker or sync backend. The completion screen is labeled as a preview while the sample challenge is ongoing.

## Rules and money semantics

| Value | Meaning | When it changes |
| --- | --- | --- |
| Cost skipped | Price of a want the user explicitly decided not to buy | “Let this want go” |
| Logged spending | Purchases the user reports | Purchase form; chosen challenge categories update its allowance |
| Remaining allowance | Max(0, allowance − relevant logged spending) | Relevant purchases or edited allowance |
| Money actually set aside | Amount the user confirms they moved/reserved outside the app | Positive manual contribution |
| Goal progress | Confirmed contributions to that specific goal / goal target | Contribution or edited target |
| Work-hours perspective | Price / user-entered take-home hourly estimate | Price or hourly-rate changes; zero/blank hides the view |

A removed wishlist item is not automatically a skipped purchase. A skipped purchase never automatically increases confirmed savings. Logging a purchase never reduces an unrelated goal. The app does not move, hold or verify money. A planned purchase and an allowed exception are supported. An unplanned purchase opens a kind recovery flow, without erasing check-ins.

Currency selection labels amounts in the chosen currency; the prototype does not perform exchange-rate conversion. Production must choose a stable money model (minor currency units, locale formatting, fixed currency per record/goal, and explicit behavior when preferences change).

## Brand and interface system

**Personality:** thoughtful, warm, quietly optimistic. **Voice:** direct, respectful and gentle. Avoid shopping shame, inflated savings claims, social competition and “failed day” language.

| Token | Value / intent |
| --- | --- |
| Forest | `#183F35`, primary action and grounding |
| Sprout | `#D2E9BD`, growth and positive emphasis |
| Clay | `#F3AD91`, human warmth and reflective moments |
| Cream | `#FBFCF7`, breathable app canvas; `#F8F7F0` brand cream |
| Primary typography | Bold system sans headings and controls; selective Georgia italic accents |
| Phone width | 390×844px desktop review; fluid mobile viewport |
| Spacing | Primarily 6/8/12/16/20/24/32px |
| Shapes | 17px primary controls, 24–29px cards, sculptural circular framing |
| Icons | Original consistent line SVGs, usually 22px with 1.65px stroke |
| Screen entrance | 400ms screen reveal; 500ms staggered elements with 40–150ms delay |
| Illustration motion | Seven-second drift; decorative; explicit off control and system preference |
| Breathing cue | Gentle six-second cycle; no mandated breathing technique |

The original hourglass visually explains the pause. The sculptural garden explains cumulative growth. The quiet-ritual illustration adds books and tea as a personal alternative to shopping. These illustrations avoid coins, banknotes and shopping imagery, keeping the brand about personal space rather than financial spectacle. All runtime assets are local; no stock images, remote fonts, advertising scripts or third-party UI libraries are loaded.

## Accessibility and localization requirements

- Semantic buttons, navigation, forms, headings and labels; icons used decoratively are hidden from assistive technology.
- Visible keyboard focus, readable error text and a live status region for feedback.
- Honor `prefers-reduced-motion`; decorative motion must never be needed to understand or complete a flow.
- Product target: at least 44×44 logical-pixel action hit areas, scalable native text, screen-reader names and tested focus order. Review compact controls again when porting to Flutter.
- Do not communicate check-in state or spending state by color alone in the production calendar; provide named semantics and a legend.
- Currency, decimal separators, locale dates, plurals and work-hour formatting need native localization tests. Avoid assuming a single “European” locale.
- User control over reminders, amounts shared, export and deletion; amounts are hidden on share cards by default.

## Prototype data and interactions

Sample dates and historical analytics are clearly identified as demo/sample data. The sample app starts with a 30-day low-buy challenge, three wants, three owned items, and a goal with 90 units actually set aside. The demo check-in date is 10 October 2026. Seed historical consistency/analytics are illustrative, not computed from your new logs.

Demo changes are saved in `localStorage` under `lessly-demo-v1`. The user can export JSON or reset sample data; reset and deletion require a second deliberate tap. New goals are independent of existing goals; contributions are attached to their chosen goal. Inputs are escaped before display. No account, authentication, bank operation, payment, analytics endpoint, scheduled reminder delivery or buddy service is connected.

Wishlist cooldowns now use saved expiry timestamps and refresh on rendering. The separate 90-second pause is a real countdown. Native delivery must still test restarts, suspension and timezone changes. The exported progress card is a self-contained original SVG; copying an invitation or caption is initiated by the user and never sends a message automatically.

## Suggested implementation order for a solo developer

**First release:** Native Flutter navigation and design tokens; local persistent wants with timestamp cooldowns; no-buy/low-buy rule builder; check-ins; real timer; manual purchase logs; owned inventory; goals with manual contributions; export; scheduled local product reminders and permission handling; accessible empty/error states. Use a reliable local database and no mandatory account initially.

**Next:** Weekly patterns generated from actual local data; fully implemented offline behavior and backup; calendar history editing; richer owned-item photos; production share card rendering and localized currencies/dates.

**After validation:** Optional accounts and encrypted transport; opt-in one-buddy accountability with explicit field permissions, invitation expiry and revocation; cross-device conflict handling; optional sustainable upgrade. Pricing is a concept and remains undecided. Keep core behavior change tools useful without an upgrade.

Before release, test deletion/export, backup recovery, timezone changes, timer suspension, financial data rounding, accessibility, permissions, and privacy policy obligations for the chosen launch market. Do not market medical effects or guaranteed savings.

## Acceptance and verification

The included Node regression check renders all 90 screen templates, validates routes, checks implemented action/form handlers, and exercises form validation, escaping, independent money totals, goal creation/contributions, purchase logging, challenge setup, local persistence, period selection and timer lifecycle.

Run `node tests/prototype.test.cjs` from the source root. This is a buildless site; `dist/` contains the deployment output.

**Verification limit:** Browser-based visual and device QA was unavailable in this managed environment. All seven generated illustrations were visually inspected. Source, rendered markup and state behavior were checked; native iOS/Android screen-reader behavior, pixel-level layout, touch interactions, clipboard and downloaded-card viewing still require browser/device review.

## Community informed additions

The v1.1 update adds 20 screens: a seven-day starter, essential exception reflection/results, lasting progress, personal activities/add activity, a familiar food plan, a manual friction checklist, use-up overview/detail, small declutter plans, actual-price sale reflection, allowance pockets/edit pocket, recurring-cost review/add cost, purchase history/return record, and payment commitments/add commitment. The source register is in community-research.md and the complete feature catalogue is in App-product-requirements.md.

Check-in history is preserved after purchases. Pockets apply a manually entered carry-in only when enabled. Confirmed refunds reduce applicable net spending and do not become skipped spending or set-aside contributions. Recurring cancellation is a manual two-step confirmation, not an API operation. Suitable inventory matching excludes finished, given-away and unsafe or unsuitable items. The app performs no automatic financial, shopping, app-blocking or messaging operations.

## Visual edition 03: Pet Care-inspired clarity

The v1.3 redesign preserves all 82 screens and existing browser-local records. The shared presentation layer in `dist/journeys.css` adapts the user's Pet Care reference to Lessly's independent green identity.

- Complete screen gallery: 390×844px phone frames scaled to 66%, with labels above each phone. The desktop navigator remains visible. Journey filters combine with screen search; empty results have an explicit reset action. Enter or Space opens a focused phone preview.
- Mobile hierarchy: bold 32px system-sans headings, occasional Georgia italic emphasis, clear 13px descriptions and 50px primary actions. The four welcome screens use a flexible scrollable content area and bottom-aligned actions.
- Illustration system: seven matching transparent originals. The new sprout supports pauses/recovery; the wardrobe supports existing belongings/use-up; the weekend bag supports goals; the meal supports food-delivery alternatives. Fourteen other screens gain compact illustrated story bands.
- Motion: slow art and floating-note movement, short screen arrivals, progress appearance, the six-second breathing cue and brief completion particles. Motion on/off persists independently of records; turning it off does not pause or reset the timer. A system reduced-motion preference takes precedence. No financial or challenge state is altered by motion.
- Review entry point: `?view=screens` opens the gallery; existing screen hashes continue to open individual prototype screens.
- Brand & system: all seven assets can be inspected and downloaded individually.

No remote fonts, new dependencies or external integrations were introduced. Pet Care's repository is unchanged. Source/state checks include the new gallery filtering, reset behavior and timer-preserving motion setting. Browser/device visual QA remains pending; it was unavailable in this managed environment. See Visual-design-guide.md and Pet-care-inspired-design.md for the visual handoff.

## Core product capture and reminder flow

Version 1.4 restores the original product-link concept as a primary path. Today includes Save a product; Wants includes the same action. The save form captures the optional product URL, name, price, category, context, reminder preference and a review interval. Three days is the default; one week, 24 hours and 48 hours are also available.

The saved-product screen shows the original product link, the exact local review date and remaining wait. Editing can retain the current date or explicitly reschedule it. When the timestamp expires, Today presents Still want this and the waiting-room Ready filter exposes the item. The decision screen offers let it go, review before buying, wait three more days or wait another week. Notification taps in the native app must deep-link to this same item review.

Links are validated as http/https without embedded credentials and are escaped before rendering. Dates, reminder preferences and URLs persist with the item. The prototype implements the saved date and in-app due-item state; it does not deliver OS notifications. Scheduled local device reminders are a required native first-release integration. Skips, deletion and purchases must cancel their pending device reminder; rescheduling must replace it without duplicates. See the updated product requirements for acceptance conditions.

## Complete screen inventory

Every screen below is reachable in the review website.

## Shopping detox edition

The full design and interaction contracts for the animated companion, recorded temptation counter, native share preview, local battles and private anti-haul cards are in [Shopping detox design](Shopping-detox-design.md). Today and Wants now lead with save, wait and decide. The eight added routes are listed below.

| # | Journey | Screen | Purpose |
| --- | --- | --- | --- |
| 01 | Start here | [Welcome](https://lessly-design.m-anasayub80.chatgpt.site/#welcome) | A calmer relationship with buying. |
| 02 | Start here | [Save now decide later](https://lessly-design.m-anasayub80.chatgpt.site/#intro-pause) | Save a product link and choose when to revisit. |
| 03 | Start here | [The clarity](https://lessly-design.m-anasayub80.chatgpt.site/#intro-clarity) | Understand the true cost of a want. |
| 04 | Start here | [The growth](https://lessly-design.m-anasayub80.chatgpt.site/#intro-grow) | Turn small choices into meaningful progress. |
| 05 | Start here | [Your intention](https://lessly-design.m-anasayub80.chatgpt.site/#intent) | Choose the reason that matters to you. |
| 06 | Start here | [Your preferences](https://lessly-design.m-anasayub80.chatgpt.site/#profile) | Currency and optional take-home rate. |
| 07 | Start here | [Gentle reminders](https://lessly-design.m-anasayub80.chatgpt.site/#notification-primer) | A thoughtful permission primer. |
| 08 | Start here | [You’re ready](https://lessly-design.m-anasayub80.chatgpt.site/#ready) | Your first small step. |
| 09 | Daily rhythm | [Today](https://lessly-design.m-anasayub80.chatgpt.site/#today) | A useful overview without guilt. |
| 10 | Daily rhythm | [Daily check-in](https://lessly-design.m-anasayub80.chatgpt.site/#check-in) | Mood, spending and a quick reflection. |
| 11 | Daily rhythm | [Check-in complete](https://lessly-design.m-anasayub80.chatgpt.site/#check-in-done) | Consistency over perfect streaks. |
| 12 | Daily rhythm | [Your calendar](https://lessly-design.m-anasayub80.chatgpt.site/#calendar) | A readable record of real life. |
| 13 | Daily rhythm | [Day reflection](https://lessly-design.m-anasayub80.chatgpt.site/#day-detail) | Review a past check-in. |
| 14 | Challenges | [Your challenges](https://lessly-design.m-anasayub80.chatgpt.site/#challenges) | No-buy and low-buy can coexist. |
| 15 | Challenges | [Choose a challenge](https://lessly-design.m-anasayub80.chatgpt.site/#challenge-type) | Pick a realistic way to buy less. |
| 16 | Challenges | [Choose categories](https://lessly-design.m-anasayub80.chatgpt.site/#challenge-categories) | Focus where you need it. |
| 17 | Challenges | [Rules & exceptions](https://lessly-design.m-anasayub80.chatgpt.site/#challenge-rules) | Necessary purchases are welcome. |
| 18 | Challenges | [Allowance & dates](https://lessly-design.m-anasayub80.chatgpt.site/#challenge-budget) | A clear, achievable commitment. |
| 19 | Challenges | [Review your plan](https://lessly-design.m-anasayub80.chatgpt.site/#challenge-review) | Confirm before you begin. |
| 20 | Challenges | [Challenge progress](https://lessly-design.m-anasayub80.chatgpt.site/#challenge-detail) | Track consistency and allowance. |
| 21 | Challenges | [Adjust your rules](https://lessly-design.m-anasayub80.chatgpt.site/#edit-rules) | Adapt with intention. |
| 22 | Challenges | [Challenge complete](https://lessly-design.m-anasayub80.chatgpt.site/#challenge-complete) | Celebrate what you learned. |
| 23 | Wants & decisions | [Waiting room](https://lessly-design.m-anasayub80.chatgpt.site/#wishlist) | Give your wants a little breathing room. |
| 24 | Wants & decisions | [Save a product](https://lessly-design.m-anasayub80.chatgpt.site/#add-item) | Save its link and choose a time to revisit. |
| 25 | Wants & decisions | [Saved product & reminder](https://lessly-design.m-anasayub80.chatgpt.site/#item-detail) | Product link, review date and buy, skip or wait choices. |
| 26 | Wants & decisions | [Edit saved product](https://lessly-design.m-anasayub80.chatgpt.site/#edit-item) | Update its link or reschedule the review. |
| 27 | Wants & decisions | [Before you buy](https://lessly-design.m-anasayub80.chatgpt.site/#decision-check) | Four thoughtful questions. |
| 28 | Wants & decisions | [The time price](https://lessly-design.m-anasayub80.chatgpt.site/#work-hours) | An optional view of money as time. |
| 29 | Wants & decisions | [Your decision](https://lessly-design.m-anasayub80.chatgpt.site/#decision-result) | Wait, skip, or buy intentionally. |
| 30 | Wants & decisions | [Log a purchase](https://lessly-design.m-anasayub80.chatgpt.site/#purchase-log) | Planned spending counts honestly. |
| 31 | Wants & decisions | [Want let go](https://lessly-design.m-anasayub80.chatgpt.site/#skip-done) | Skipped cost is not cash savings. |
| 32 | Pause & recover | [Pause studio](https://lessly-design.m-anasayub80.chatgpt.site/#pause) | Interrupt an impulse with kindness. |
| 33 | Pause & recover | [Name the moment](https://lessly-design.m-anasayub80.chatgpt.site/#trigger) | Notice what is behind the urge. |
| 34 | Pause & recover | [90-second pause](https://lessly-design.m-anasayub80.chatgpt.site/#timer) | A real, pauseable breathing timer. |
| 35 | Pause & recover | [Check the urge](https://lessly-design.m-anasayub80.chatgpt.site/#reflection) | Compare before and after. |
| 36 | Pause & recover | [Try this instead](https://lessly-design.m-anasayub80.chatgpt.site/#alternatives) | Use, repair, borrow or do something else. |
| 37 | Pause & recover | [A fresh start](https://lessly-design.m-anasayub80.chatgpt.site/#recovery) | Learn from an impulse purchase. |
| 38 | Pause & recover | [Your reset plan](https://lessly-design.m-anasayub80.chatgpt.site/#recovery-plan) | A next step without a punishment. |
| 39 | Own & enjoy | [Things you own](https://lessly-design.m-anasayub80.chatgpt.site/#owned) | A personal reminder of enough. |
| 40 | Own & enjoy | [Add something owned](https://lessly-design.m-anasayub80.chatgpt.site/#add-owned) | Build a simple personal inventory. |
| 41 | Own & enjoy | [Rediscover an item](https://lessly-design.m-anasayub80.chatgpt.site/#owned-detail) | Care, use and enjoy what you have. |
| 42 | Own & enjoy | [You already have](https://lessly-design.m-anasayub80.chatgpt.site/#compare-owned) | Compare the want with an alternative. |
| 43 | Meaningful goals | [Your goals](https://lessly-design.m-anasayub80.chatgpt.site/#goals) | Real money set aside, self-reported. |
| 44 | Meaningful goals | [Create a goal](https://lessly-design.m-anasayub80.chatgpt.site/#add-goal) | Give the saved money a purpose. |
| 45 | Meaningful goals | [Goal progress](https://lessly-design.m-anasayub80.chatgpt.site/#goal-detail) | A small escape, one choice at a time. |
| 46 | Meaningful goals | [Confirm money set aside](https://lessly-design.m-anasayub80.chatgpt.site/#set-aside) | Count only what you actually moved. |
| 47 | Meaningful goals | [Progress confirmed](https://lessly-design.m-anasayub80.chatgpt.site/#set-aside-done) | Acknowledge a real action. |
| 48 | Patterns & plans | [Your patterns](https://lessly-design.m-anasayub80.chatgpt.site/#insights) | Insights grounded in sample logs. |
| 49 | Patterns & plans | [Urge patterns](https://lessly-design.m-anasayub80.chatgpt.site/#trigger-insights) | Find the moments that need support. |
| 50 | Patterns & plans | [Weekly reflection](https://lessly-design.m-anasayub80.chatgpt.site/#weekly-review) | Learn and make one small adjustment. |
| 51 | Patterns & plans | [Plan for a sale](https://lessly-design.m-anasayub80.chatgpt.site/#temptation-plan) | Prepare before a high-temptation event. |
| 52 | A gentler start | [A seven-day start](https://lessly-design.m-anasayub80.chatgpt.site/#starter) | One category, a realistic exception, a small first step. |
| 53 | A gentler start | [Does this fit my rules?](https://lessly-design.m-anasayub80.chatgpt.site/#rule-check) | Make replacements and essential exceptions explicit. |
| 54 | A gentler start | [Your exception reflection](https://lessly-design.m-anasayub80.chatgpt.site/#rule-result) | Support a decision without pretending to approve it. |
| 55 | A gentler start | [Progress that stays](https://lessly-design.m-anasayub80.chatgpt.site/#progress-review) | Keep check-ins and context after a purchase. |
| 56 | Life beyond shopping | [Your no-spend menu](https://lessly-design.m-anasayub80.chatgpt.site/#joy-menu) | Personal alternatives matched to your energy. |
| 57 | Life beyond shopping | [Add a little joy](https://lessly-design.m-anasayub80.chatgpt.site/#add-activity) | A free activity using what you already have. |
| 58 | Life beyond shopping | [Before food delivery](https://lessly-design.m-anasayub80.chatgpt.site/#food-rescue) | Make an easy meal plan with your own food. |
| 59 | Life beyond shopping | [Make shopping less automatic](https://lessly-design.m-anasayub80.chatgpt.site/#friction) | A manual checklist for shopping triggers. |
| 60 | Enough, in practice | [Use what is open](https://lessly-design.m-anasayub80.chatgpt.site/#use-up) | Finish safe, suitable items before replacing. |
| 61 | Enough, in practice | [Your use-up progress](https://lessly-design.m-anasayub80.chatgpt.site/#use-up-item) | Track a remaining amount without pressure. |
| 62 | Enough, in practice | [One item, less overwhelm](https://lessly-design.m-anasayub80.chatgpt.site/#declutter) | Keep, repair, give away or responsibly let go. |
| 63 | Spending with context | [A deal or a need?](https://lessly-design.m-anasayub80.chatgpt.site/#deal-check) | Focus on the actual outflow, not the discount. |
| 64 | Spending with context | [Your allowance pockets](https://lessly-design.m-anasayub80.chatgpt.site/#pockets) | Separate small budgets, with optional carry-over. |
| 65 | Spending with context | [A personal pocket](https://lessly-design.m-anasayub80.chatgpt.site/#edit-pocket) | Give fun, gifts or a category a realistic boundary. |
| 66 | Spending with context | [Recurring spending review](https://lessly-design.m-anasayub80.chatgpt.site/#subscriptions) | Manual subscription inventory and cancellation notes. |
| 67 | Spending with context | [Add a recurring cost](https://lessly-design.m-anasayub80.chatgpt.site/#add-subscription) | Know what you use and what you pay for. |
| 68 | Spending with context | [Purchase history](https://lessly-design.m-anasayub80.chatgpt.site/#purchase-history) | Planned, exception and unplanned records belong. |
| 69 | Spending with context | [A return, if it fits](https://lessly-design.m-anasayub80.chatgpt.site/#return-check) | Track a policy date and confirm an actual refund. |
| 70 | Spending with context | [Payment commitments](https://lessly-design.m-anasayub80.chatgpt.site/#commitments) | Keep manual obligations visible without debt advice. |
| 71 | Spending with context | [Add a commitment](https://lessly-design.m-anasayub80.chatgpt.site/#add-commitment) | Your balance, payment and date, entered by you. |
| 72 | Together | [Your quiet circle](https://lessly-design.m-anasayub80.chatgpt.site/#buddy) | Private accountability without a feed. |
| 73 | Together | [Invite a buddy](https://lessly-design.m-anasayub80.chatgpt.site/#invite) | A reviewed invitation concept. |
| 74 | Together | [Share your progress](https://lessly-design.m-anasayub80.chatgpt.site/#share-card) | A tasteful card, with amounts optional. |
| 75 | Preferences & states | [Settings](https://lessly-design.m-anasayub80.chatgpt.site/#settings) | You control the experience. |
| 76 | Preferences & states | [Reminder preferences](https://lessly-design.m-anasayub80.chatgpt.site/#notifications) | Useful nudges, at your pace. |
| 77 | Preferences & states | [Privacy & data](https://lessly-design.m-anasayub80.chatgpt.site/#privacy) | Transparent local prototype data. |
| 78 | Preferences & states | [Lessly Plus concept](https://lessly-design.m-anasayub80.chatgpt.site/#plus) | Review a potential sustainable business model. |
| 79 | Preferences & states | [Help & guidance](https://lessly-design.m-anasayub80.chatgpt.site/#help) | A clear explanation of the app. |
| 80 | Preferences & states | [Empty waiting room](https://lessly-design.m-anasayub80.chatgpt.site/#empty) | A helpful, quiet first-use state. |
| 81 | Preferences & states | [Offline state](https://lessly-design.m-anasayub80.chatgpt.site/#offline) | A local-first experience concept. |
| 82 | Preferences & states | [Recoverable error](https://lessly-design.m-anasayub80.chatgpt.site/#error) | A clear path back to your work. |
| 83 | Pause, play & share | [Meet your companion](https://lessly-design.m-anasayub80.chatgpt.site/#companion) | A living sprout that grows with thoughtful decisions. |
| 84 | Pause, play & share | [Your temptation counter](https://lessly-design.m-anasayub80.chatgpt.site/#temptation-counter) | Parked wants, recorded skips and real savings stay distinct. |
| 85 | Pause, play & share | [Save from anywhere](https://lessly-design.m-anasayub80.chatgpt.site/#capture-guide) | Preview native sharing; paste a link in the browser. |
| 86 | Pause, play & share | [No-Buy Battles](https://lessly-design.m-anasayub80.chatgpt.site/#battle-hub) | Private challenges measured by showing up, not wealth. |
| 87 | Pause, play & share | [Create a battle](https://lessly-design.m-anasayub80.chatgpt.site/#battle-create) | Choose a duration, category and essential exception. |
| 88 | Pause, play & share | [Your battle room](https://lessly-design.m-anasayub80.chatgpt.site/#battle-lobby) | Local check-ins and a clearly labeled demo opponent. |
| 89 | Pause, play & share | [Battle recap](https://lessly-design.m-anasayub80.chatgpt.site/#battle-results) | Review the challenge without resetting progress. |
| 90 | Pause, play & share | [Your monthly anti-haul](https://lessly-design.m-anasayub80.chatgpt.site/#anti-haul) | A private list of recorded wants you let go. |
