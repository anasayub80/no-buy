# Lessly App Idea and Product Requirements

Version 1.6. Prepared for Anas Ayub on 13 October 2026. Lessly is a working name and can be changed before launch.

## Product decision

Build a mobile app whose core loop is saving a product link, waiting for a chosen reminder date, and deciding later whether the item is still wanted. A useful pause, realistic personal rules and practical alternatives support that loop. The first release should work without a bank connection or mandatory account. Keep the core experience simple enough for one developer to build, support and improve.

The prototype contains 91 navigable screens. It combines a no-buy or low-buy challenge with an impulse pause, a waiting room, an owned-item collection and meaningful goals. Community-informed tools add essential replacement decisions, personal activities, use-up tracking, food-delivery alternatives and contextual spending records. The implementation is an interactive browser-local prototype; the native app and external services are a subsequent phase.

## Audience and problem

The initial audience is English-speaking adults in the US and UK who want to reduce discretionary impulse spending. European localization can follow evidence of demand, with country-specific currencies, dates and language. Launch with a narrower audience such as people reducing clothing, skincare or delivery-app spending rather than trying to serve everyone at once.

People may already know they want to buy less but struggle at the moment of temptation. A sale can turn an unexpected purchase into an apparent bargain. Shopping can also fill boredom, stress or a social gap. Rigid rules can make essential replacements feel like cheating, and a counter reset can make weeks of effort feel erased. An inventory alone is not enough if it becomes a large project to maintain.

These observations come from a qualitative review of 25 accessible entries in r/nobuy's New feed: 22 member posts and 3 moderator accountability threads. The sample is cached and cannot establish the exact latest live order, how common a problem is, or whether an app will solve it. The source register and coverage notes are in community-research.md. We should validate the flows with willing users before making outcome claims.

## Positioning

The user should think of Lessly as a personal decision companion for buying less. The app supports intentional purchases and necessary exceptions, preserves effort after setbacks and offers something useful to do besides shopping. A friendly visual identity makes the experience inviting without turning the app into another feed or rewards store.

The current brand uses forest green, pale mint, warm clay and cream. Bold system-sans headings make screens easy to scan; selective Georgia italic accents add warmth. Seven original clay illustrations explain reflection, recovery, existing belongings, goals and everyday enjoyment. A persistent motion setting and the system reduced-motion preference control decorative animation. The final name, legal identity, pricing and store assets remain undecided.

## Complete feature catalogue

### Personal introduction

Introduce the pause, a clearer price perspective and meaningful progress. Let the user choose an intention and currency. An optional take-home hourly estimate supports the time-price view. Explain reminders before requesting a platform permission. Allow the user to explore before creating an account or a challenge.

Acceptance: a user can finish the introduction, decline reminder setup and enter the app. Leaving an hourly rate blank hides that perspective. Currency changes in the prototype relabel demo amounts and do not perform exchange conversion; production records must preserve their currency.

### A manageable first challenge

Offer a seven-day starter with one category, a realistic allowance for low-buy, and one essential exception. The custom flow supports no-buy or low-buy, chosen categories, exceptions, personal rules and duration. A review screen confirms the plan before beginning. Existing check-in history remains when creating or adjusting a challenge.

Acceptance: categories cannot be empty; budgets cannot be negative; rules can be edited; necessary purchases are welcome. The prototype has one active challenge. Multiple simultaneous challenges and a searchable archive are future features, not connected functionality.

### Daily check-ins and lasting progress

Record mood, whether purchases were planned or unplanned, and an optional note. A calendar and a progress screen show the user's records. Purchases and spending days do not erase prior check-ins. Weekly reflection captures one useful observation and a small next step.

Acceptance: editing today's check-in updates the same dated record rather than adding duplicate credit. The progress count is derived from check-in records. Seed historical records are labeled as sample data. Production requires arbitrary-date history, timezone-aware rollover and accessible date semantics.

### Saving a product and deciding after a reminder

The core flow begins with a product the user saw and wants to buy. They paste its optional shop URL, enter a name, price and category, and choose when to revisit it. Three days and one week are prominent choices; 24 and 48 hours remain available. A per-product reminder preference defaults on in the save form. The app saves the original link and a review date, then invites the user to leave the decision for later.

The saved-product screen shows the link, local review date, remaining time, reminder preference and optional context. The user can update the URL without resetting the wait or explicitly choose a new interval. At expiry, Today and the waiting room expose the item as ready to revisit. The user can decide they no longer want it, review before buying intentionally, or wait another three days or week. Opening a product link does not log a purchase or change money totals.

Acceptance: persist a stable item ID, safe http/https product URL, creation time, selected interval, review timestamp and reminder preference. Reject unsafe schemes and links containing credentials; escape displayed values. Use the saved expiration timestamp rather than a restarting counter. Editing with Keep current review date preserves it; rescheduling sets a new one. Reminder-off items still become ready at expiry. Removing an entry adds no skipped spending. Explicitly skipping it adds its price once and removes it. Waiting and link opening do not increase savings or goal contributions.

The browser prototype saves links, dates and preferences, recalculates due items on rendering and provides the in-app review entry. It does not send device notifications while closed. Scheduled device reminders are a first-release requirement for the native app, rather than an optional later feature. They should use local notification scheduling without requiring a bank connection, an account or a server. Request notification permission after the user chooses a reminder; show a clear status if permission is denied. Tap a reminder to open the same saved-product review. Update or cancel the schedule when the item is rescheduled, skipped, deleted or logged as purchased. Test duplicate prevention, background delivery, app restart, timezone changes and daylight saving transitions before release. Optional product-photo imports can follow validation; the manually entered link is part of the core release.

### A guided impulse pause

Let the user name a trigger, rate the urge and try a 90-second pause. The timer can pause, resume or finish early. A comfortable breathing cue is optional. The user records the urge afterward and chooses an alternative action. A pause remains useful even if the rating does not decrease.

Acceptance: navigation and a hidden page pause the timer. Recording a reflection stores a local event and does not change monetary totals. Do not describe the tool as treatment or promise reduced spending. Native app suspension and restart behavior need device testing.

### Price in work hours

Show a want's price divided by the user's optional take-home hourly estimate. Explain the estimate clearly and let the user disable it. Use it as perspective rather than a purchase permission or an affordability judgment.

Acceptance: zero or a blank rate hides the calculation; a valid updated rate recalculates the view. Production must handle rounding, fractional minutes and localized currency units consistently.

### Essential replacement reflection

Ask why the item is needed, whether an owned item is suitable and which personal rule or exception applies. Reasons include finished products, broken or unsuitable items, health or safety needs, planned gifts and a new want. Present the user's context without issuing an automated approval score.

Acceptance: the result offers a contextual exception log, a suitable owned alternative or more waiting. It must never require using an expired, unsafe or unsuitable item to complete a challenge. Health and safety needs should not be delayed by a game mechanic.

### Sale decision tool

Ask for the actual amount to pay, an optional retailer comparison price and whether the user wanted the item before seeing the offer. Emphasize the real outflow. A lower offered price is not money saved if the purchase was never planned. Allow the thought to enter the waiting room.

Acceptance: prices are validated; the result does not add money to skipped spending or savings. Retailer comparison prices are user-entered and unverified. No live price scraping, sale detection or retailer endorsement is connected.

### Owned items and suitable alternatives

Keep a small manual collection of things the user owns, with category and condition. Compare a want with active suitable items in the same category when possible. A category match is a prompt to think, not a claim that two items are equivalent.

Acceptance: finished, given-away and unsuitable or unsafe items are excluded from alternative suggestions. Users can add an item or enjoy one they own. Production photo capture, accessibility descriptions and optional barcode imports are future additions.

### Use-up progress

Track an approximate remaining percentage and status for an owned item. This can represent a product, book or project. The aim is to make available resources visible with little effort, not to impose meticulous measurement.

Acceptance: percentages are 0 to 100; marking finished sets remaining to zero; unsafe or unsuitable status removes the item from suggested alternatives. The app should not give product safety, expiry or hygiene instructions. Safety remains the user's context and professional advice where relevant.

### Small decluttering plans

Choose one owned item and a next step: keep and use, repair, give away responsibly, consider selling or dispose responsibly. Store a short practical note and recent plans. Avoid encouraging purchases of organizing supplies or pretending to arrange a sale.

Acceptance: the plan is saved locally. No marketplace listing, sale proceeds or donation action is created. Confirming disposal or sale completion is a separate production feature and must be distinct from selecting an intention.

### Personal no-spend activities

Let users keep their own menu of activities, with approximate duration and low, medium or high energy. Examples use existing books, craft supplies or social connections. Track that an activity was enjoyed without a monetary reward or leaderboard.

Acceptance: filter by energy; add a personal activity; record enjoyment. Counts change only through a user action. Do not imply an activity is free if it requires supplies, travel or paid access the user does not have.

### Food-delivery alternative plan

Save food available at home, a familiar easy meal and a low-energy backup. This addresses a trigger that deleting an app alone may not resolve. Include a direct route for essential groceries or a necessary meal rather than treating all food purchases as failure.

Acceptance: a meal plan is user-authored and stored locally. Recording use does not estimate or claim savings automatically. No nutrition guidance, generated recipe, dietary verification or grocery integration is connected.

### Shopping friction checklist

Offer manual steps such as reducing retailer email, removing a saved payment method in an account the user controls, removing a shopping shortcut and writing a boundary around new buy-now-pay-later purchases. These are voluntary environment changes, not permissions to control another person's finances.

Acceptance: a switch records what the user says they completed. The app cannot uninstall other apps, unsubscribe, remove cards, freeze credit or block purchases. A later app-blocking feature would need separate platform feasibility, explicit permission and a clear essential-access escape route.

### Contextual purchase logs

Record actual purchases with amount, category, date, note and whether they were planned, exceptions or unplanned. Relevant categories update the active challenge and matching allowance pocket. Unplanned purchases offer a recovery flow. A purchase history preserves the context.

Acceptance: validate a positive amount; keep history and goal totals intact. A purchase is not made by the app. In production, support editing, deletion, receipts, multi-currency constraints and recalculating all affected aggregates.

### Returns and confirmed refunds

Attach a retailer return-by date from the user's receipt or policy. Record additional money already refunded, never a promised refund. A confirmed refund reduces net logged spending for the matching purchase, challenge and pocket. Keep confirmed refunds, skipped spending and set-aside contributions distinct.

Acceptance: additional refunds cannot exceed the unreimbursed purchase amount. Saving a policy date initiates no return and changes no spending total. The app makes no claim about legal return rights or a retailer's acceptance policy.

### Category allowance pockets

Keep separate practical budgets for categories such as fun, gifts, clothing or takeaway. Allow optional carry-over of a manually entered unused prior-period amount. Matching purchase logs and refunds update the pocket's spending.

Acceptance: category names are unique; amounts are nonnegative; carry-in applies only when enabled. Pocket carry-over is not cash savings. The prototype applies exact category-name matching; production should use stable category IDs and explicit period boundaries, reconciliation and carry-over rules.

### Recurring spending review

List recurring services, monthly amount, whether they are useful and active or cancelled status. Show an active monthly total and a clearly labeled unchanged annual projection. A user can record cancellation only after cancelling with the provider.

Acceptance: cancellation requires a deliberate second confirmation and does not call the provider. Projected avoided recurring costs must never be presented as confirmed cash savings. Annual billing and future price changes need separate fields in production.

### Payment commitment visibility

Let users record existing BNPL, credit-card, loan or other obligations with a current remaining balance, planned payment and due date. The records are a visibility tool. The user updates their own balance after an outside action.

Acceptance: amounts are nonnegative; a name and date are required. There is no payment, interest calculation, fee forecast, debt optimization or credit recommendation. Due-date notifications are a later permissioned integration.

### Goals and money actually set aside

Create independent goals with a name, target and reason. Add a contribution only after the user confirms they moved or intentionally reserved money outside the app. Keep a contribution history for each goal and a total across goals.

Acceptance: a new goal begins at zero and does not inherit another goal's balance. Contributions are positive. Skipping a want, cancellation, unused allowance or a refund never increases a goal automatically. The app neither holds nor transfers money.

### Recovery and planning

After an impulse purchase, record what happened and one helpful next step. Offer rule adjustment and lasting progress. A temptation plan records a sale or event date, actual needs and a boundary chosen in advance. Do not use punishment, countdown pressure or spending shame.

Acceptance: recovery stores a reflection and preserves history. Event dates are manual. No retailer monitoring, automatic event reminders or promised behavior change is connected.

### Patterns and reflection

Display honest monetary categories, recorded progress and urge patterns. Distinguish seeded illustrative charts from actual local records. The prototype's weekly and monthly chart examples remain labeled sample data; the progress screen derives counts from its dated check-ins, and newly logged pause events are retained.

Acceptance: production analytics must derive from records, include transparent denominators and time ranges, and avoid diagnosing mental health or predicting individual outcomes. A chart should not reward suppressing essential purchases.

### Optional private accountability and sharing

Design for one trusted buddy with challenge name, dates and check-in completion shared by default. Personal notes, wants and amounts remain private unless deliberately selected. Preview an invitation and let the user copy it to share themselves. A progress card can hide monetary amounts and download as a self-contained SVG.

Acceptance: the prototype sends no invitation or message. Buddy accounts, sync, permissions, revocation and deletion are future integrations. Production must show exactly what is shared, with whom and how to stop sharing.

### Settings and usable state handling

Include currency and time-price preferences, reminder choices, help, local data export and sample reset. Empty screens explain a useful next step. Offline and recoverable sync error designs preserve work and offer retry or continuation. The review site exposes every screen and a brand board.

Acceptance: export includes local records; reset requires a second deliberate action. No notification delivery, live sync service or installed offline cache is connected. Browser storage can be cleared by the browser, so it is not a production backup solution.

## Shopping detox experience

Version 1.5 makes the product waiting loop the primary visual experience. Today presents an animated sprout, parked temptations, products ready to review and a direct product capture action. The waiting room uses object cards with a visible cooldown and the optional price in work hours. The original product URL, three-day or one-week deadline and buy, skip or wait-longer decisions remain central.

### Companion growth

A code-native sprout illustration breathes, blinks and waves. Growth has three stages at zero, four and twelve thoughtful moments. A moment is an explicitly recorded product decision, a daily check-in or a recorded pause. Capturing more wants earns no growth. An essential or unplanned purchase does not subtract progress. Native implementation should deduplicate event IDs, preserve history across versions and expose the same reduced-motion behavior.

Acceptance: only one product decision is recorded per item ID; a daily check-in can be updated without earning duplicate credit. All animation stops with the app motion control or system reduced-motion setting, while the pause timer and stored records keep working.

### Temptation counter and anti haul

Parked value is the sum of undecided saved-product prices. It is not avoided spending. Recorded skipped value sums explicit skips with item history, filtered to the current local calendar month or all recorded history. The earlier prototype aggregate remains visible separately; it includes demo data and has no complete item-level history. New monthly anti-hauls and share cards exclude that earlier total. Set-aside balances continue to require a separate user confirmation.

Acceptance: deleting, waiting longer, editing a product link or opening a shop changes no skipped value. Explicit skipping counts once, preserves money set aside and stores the item's name, category, price, date and stable ID. Production monetary aggregation must retain original currency and use minor units; changing prototype currency relabels values without conversion.

### Product sharing

The prototype includes a native share-sheet design and a working browser paste action. Clipboard denial falls back to the existing product-link field. An incoming URL query can prefill a safe http or https product link and optional title, with manual confirmation of price and reminder. Importing does not save the product or create an assumed retailer price.

Acceptance: reject unsafe URL schemes, credential-bearing URLs and invalid links. Escape titles. Shipping iOS requires a Share Extension and shared app storage; Android requires an incoming share intent. Actual native integration, metadata extraction and background notifications are not connected in this browser prototype.

### No Buy Battles

A local room supports seven-day and thirty-day durations, one focus category, personal rules and essential exceptions. A participant records one check-in per local calendar day. Following a plan, a necessary exception and an honest setback all count toward completion. Score is check-in days divided by challenge duration, rather than money avoided or purchases made. The opponent and its score are explicitly illustrative. A live recap does not pretend an unfinished challenge is complete.

Acceptance: edits replace today's check-in; entries after the challenge period are rejected. Creating another room replaces the current local room without erasing product decisions or companion progress. Copying an invitation draft sends nothing and creates no working join link. Production requires authentication, consented membership, timezone rules, authorized reads and writes, revocation and sync. Prices, product URLs, notes and financial balances remain private.

### Share cards

Forest and clay card styles download as self-contained SVG. Amounts are hidden by default. Only recorded monthly skips appear in the count and optional amount. The card labels estimated purchase cost clearly and excludes actual savings, product names, links and personal notes. Captions use the same privacy settings and fall back to a text download when clipboard access is unavailable.

Acceptance: the card and caption use the same selected period and records. Earlier aggregate totals never leak into a share card. Zero records produce a truthful zero state, not an invented streak. The design uses the working tagline Want it Wait on it; final brand wording can change independently of financial definitions.

### Savings presentation and achievements

Display avoided purchase cost as Savings, qualified as estimated spending avoided through explicitly skipped purchases. Keep money actually set aside as a separate confirmed balance. The all-time headline preserves the previous skipped-cost aggregate and labels earlier demo history when present. Monthly cards and share images use item-level recorded skips only.

Seven achievements cover a first skip, five skips, ten skips, 100, 500 and 1000 currency units of estimated savings, and seven honest check-in days. Money milestones use recorded all-time item values; imported demo totals cannot unlock them. A skip reveals any newly unlocked milestone. Purchases never remove awards; check-ins need not be consecutive. The underlying monetary model is unchanged, and no money is moved by a skip.

The Markdown specification is the current v1.6 handoff. The Word document remains the v1.5 product baseline; this section documents the newer presentation and achievement behavior.

## Money model

Use these definitions consistently throughout design, implementation and marketing.

| Value | Definition | Changes only when |
| --- | --- | --- |
| Purchase cost skipped | Price of an explicitly declined want | User chooses to let a saved want go |
| Net logged spending | Purchase amount less confirmed refunds | User records a purchase or a received refund |
| Confirmed refunds | Money already returned outside the app | User records the actual refund |
| Allowance left | Allowance plus enabled carry-in less applicable net spending | Relevant spending or personal allowance changes |
| Money set aside | User-confirmed reserved or moved money | User adds a real manual contribution |
| Goal progress | Contributions attached to that specific goal | That goal receives a contribution or its target changes |

For example, a user skips a 50-unit want. Skipped cost rises by 50; the goal does not change. If they confirm moving 20 units to their own savings, the goal rises by 20. Returning a 10-unit logged purchase reduces net spending by 10 and records the refund; it does not create a skipped purchase or goal contribution.

Production should store amounts in minor currency units with a currency code on every monetary record. Avoid floating-point balances, automatic foreign-exchange assumptions or merging different currencies into one total. Changes to records must recalculate affected totals rather than relying on increment-only counters.

## Interaction and visual requirements

Primary navigation is Today, Challenges, Pause, Wants and Patterns. Inventory, goals and personal tools are reached from relevant moments and Settings. Keep secondary tools contextual so the main experience remains manageable. Most people should be able to start with only one challenge and one daily action.

Use labeled fields, understandable validation, visible focus and a helpful primary action. Preserve form content where practical. Use native safe areas, scalable text and at least 44 by 44 logical-pixel touch targets in the mobile implementation. Test contrast, screen-reader announcements, keyboard behavior and calendar semantics. Decorative motion must respect reduced-motion preferences.

Review every state: first use, saved content, empty content, loading, invalid input, permissions declined, offline, local-save failure, sync conflict and recoverable error. The current review site implements first use, empty screens, form errors and local interactions; loading and network sync behavior still need native/backend implementation.

## Implementation and data requirements

Use the prototype as the design reference for a native Flutter app. A local database can hold settings, challenges, category IDs, rules, wants, owned items, check-ins, pauses, activities, meal plans, purchases, refunds, pockets, recurring services, commitments, goals and contributions. Add optional account sync only after validating the local experience.

| Record group | Essential fields |
| --- | --- |
| Settings and challenges | Locale, currency, optional rate, challenge ID, start/end, categories, allowance, rules and active status |
| Wants and inventory | Stable ID, name, category ID, price/currency where relevant, created time, product URL, review interval, expiry timestamp, reminder preference, condition, use status and remaining estimate |
| Check-ins and pauses | Date key with timezone, mood, purchase context, note; trigger, before/after urge, timestamp and completion context |
| Purchases and refunds | IDs, purchase amount/currency, category, challenge/period association, reason, receipt/policy date, actual refund records |
| Goals and contributions | Goal ID, target/currency, purpose, contribution amount/time/method and correction history |
| Pockets and recurring costs | Category/period IDs, allowance, explicit carry-in, recurrence amount/billing period, user confirmation status |
| Commitments and personal tools | User-entered balance/payment/due date; activities/energy/duration; meal plan, friction steps and small declutter intentions |

Keep derived totals separate from source records. Use stable IDs rather than matching names. Make deletion, corrections, export and backup behavior explicit. Validate timer suspension, timestamp expiry, timezone travel, dates, duplicate actions, restored backups, record conflicts and data migration. Sensitive reflections should stay private by default.

## Scope and delivery status

| Area | Current delivery | Production work remaining |
| --- | --- | --- |
| Design and brand | 91 screens, original assets, responsive review site and motion | Native adaptation, device visual and accessibility QA |
| Core and community tools | Browser-local forms, records, timer, cooldowns, export and card download | Durable database, arbitrary-date history and correction workflows |
| Progress | Record-derived check-in counts; seeded charts labeled | Fully derived analytics with accurate periods and denominators |
| Reminders | Preferences and permission-primer design | Native permission handling and scheduled delivery |
| Offline and sync | UI state designs and local browser data | Installed offline behavior, backup, optional sync and conflicts |
| Buddy support | Private sharing specification and invite preview | Account/invitation service, field permissions and revocation |
| Commercial plan | Useful free core and optional upgrade concept | Pricing validation, billing, entitlements and store compliance |

No connected financial, retailer, medical, messaging or payment service is part of this prototype. Do not describe a manually checked action as one the app performed.

## Differentiation and release priorities

Mallow's public listing describes skipped purchases, timed wishlists, pre-buy questions, check-ins, notes, monthly goals and personal rules. Those are category foundations. Lessly's opportunities lie in a coherent pause-and-alternative flow, essential replacement context, preserving effort, personal use-up work and honest money semantics. The public listing does not establish whether a competitor lacks any particular feature; superiority needs user research and measured comparisons.

For the first native release, prioritize challenges, timestamp-based wants with product URLs and scheduled local reminders, the pause, suitable inventory, exception reflection, contextual purchases, check-ins and manual goals. Add the seven-day start and a simple activity menu to keep the product easy to begin. Ship category pockets and use-up progress next if early users find them useful. Keep the larger tools optional; do not make every user maintain a financial dashboard.

After the core is reliable, consider production analytics, photo capture and backup. Buddy sync and paid upgrades should follow demonstrated demand and a privacy design. Avoid bank integrations, retailer scraping, a public social feed or costly AI infrastructure in the initial release.

## Monetization and distribution

Keep a useful free core with the pause, a challenge, check-ins and honest purchase logging. Evaluate a one-time upgrade for longer history, more personalization, export styles or multiple challenges. The price is deliberately undecided. Avoid affiliate shopping links, retailer ads and limited-time purchase pressure inside an app intended to help people spend less.

Validate distribution through short product demonstrations, a small spending-reset challenge and willing beta participants. Focus on practical moments such as a tempting discount, an essential replacement or choosing a familiar meal over delivery. r/nobuy prohibits app and website promotion; research does not authorize advertising there or contacting members. No promotional posts or messages were sent.

## Validation and release criteria

The current regression checks cover all screen renders and navigation, form validation, escaped input, timer lifecycle, timestamp cooldowns, independent monetary totals, goal contributions, preserved check-ins, essential exceptions, activities, food plans, unsuitable-inventory exclusion, carry-over, cancellation confirmation, commitments and refunds. The v1.4 checks also cover safe URL capture, three-day and one-week intervals, preservation of review dates on edit, rescheduling, due-item review and snoozing without financial changes. Run npm test or node tests/prototype.test.cjs.

Before a native launch, verify the app on supported iOS and Android devices with assistive technology, large text and reduced motion. Test persistence, backup restoration, date rollover, duplicate taps, history edits, refunds, currency constraints, permission denial and account deletion if accounts are added. Review the published privacy policy and store disclosures against the actual production behavior.

Use beta research to check whether a person can start a realistic challenge, understand exceptions, identify a suitable owned alternative and explain the difference between skipped spending and actual set-aside money. Track retention only with permission and transparent definitions. Treat reduced spending or urge changes as self-reported observations until stronger evidence exists. Do not market guaranteed savings, medical benefits or an award the app has not received.

## Project files and references

The GitHub repository contains the complete prototype in dist, original images in assets/originals, regression checks in tests, and this product document alongside the detailed UI/UX specification, asset manifest and community source register. The screen inventory is maintained in UIUX-specification.md. The hosted private review site is https://lessly-design.m-anasayub80.chatgpt.site.

Research sources: r/nobuy New feed and the 25 linked entries in community-research.md. Competitor reference: https://apps.apple.com/us/app/mallow-no-buy-tracker/id6738301938. Public source descriptions can change, and the community sample does not represent all users.
