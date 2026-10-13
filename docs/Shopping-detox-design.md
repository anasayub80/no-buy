# Lessly Shopping Detox Design

Version 1.6. Visual edition 04. 13 October 2026. Working name Lessly.

Make saving a tempting product, waiting for a reminder and choosing later the central experience. The playful layer helps people understand and share that experience. It preserves the practical tools and essential exceptions from the original product.

## Main screens

| Screen | Updated experience |
| --- | --- |
| Today | Animated companion hero, Park a temptation action, pending product value, recorded skipped cost, ready reminders and a battle entry |
| Waiting room | Illustrated object cards, cooldowns, review dates and optional work-hour prices |
| Product capture | Product URL, clipboard paste, prominent three-day or one-week choices and reminder preference |
| Saved product | Clear review choices, preserved shop link, work-hour estimate and snooze controls |
| Skip completion | Companion celebration, honest skipped-cost label and sharing action |
| Companion | Three growth stages, recorded moments and no loss of progress |
| Temptation counter | Undecided product value, recorded monthly/all-time skips, earlier aggregate and separate set-aside balance |
| Save from anywhere | Native share-sheet preview, working clipboard fallback and sample import |
| No-Buy Battles | Seven-day or thirty-day private challenge concept, category and exception rules |
| Battle room and recap | Local daily check-ins, progress percentage and explicitly simulated opponent |
| Monthly anti-haul | Item history for explicitly skipped products this calendar month |
| Share card | Forest/clay SVG, optional amount, privacy-preserving caption and download |

There are 91 routes across 15 journeys. The gallery retains complete phone previews, search and journey filters. The social screens are reachable from Today, Challenges and the previous buddy screen.

## Savings and achievements

Savings is the consumer-facing label for estimated spending avoided through skips. The large Today card preserves the earlier aggregate and marks demo history; current monthly shares use recorded item values only. Seven achievements reward one, five or ten skipped wants; 100, 500 or 1000 units of recorded estimated savings; and seven honest check-in days. Earlier demo amounts earn no awards. Spending never removes badges. A skip surfaces freshly unlocked achievements and keeps confirmed set-aside money unchanged.

## Character and motion

The sprout uses self-contained SVG and CSS. It breathes, blinks, moves its leaves and waves on a deliberate tap. Decisions, check-ins and recorded pauses produce growth at four and twelve thoughtful moments. Capturing more products earns no progress. Essential purchases and setbacks never cause decay. Motion stops with either the explicit app control or system reduced-motion preference; functional timers keep running.

## Honest numbers

Pending value is the sum of undecided wants. Recorded skipped cost comes from explicit, deduplicated skip records. The monthly anti-haul uses local calendar dates. Earlier aggregate totals from the previous prototype are labeled separately and excluded from new share cards. Actual money set aside remains a separate confirmation. No new streaks or automatic savings claims are introduced.

## Social interaction

Battle scoring rewards honest check-in consistency. A necessary exception and a setback count as showing up. There is one replaceable record per local day. A demo opponent explains the design without implying a connected friend. Copying an invitation draft sends nothing. Production needs accounts, participant consent, authorized membership, sync, timezone handling and revocation.

## Product import

Clipboard paste and incoming `?url=...&title=...` or `?text=...` prefilling work in the browser. Every import requires confirmation of name, price and deadline. Only safe http/https product URLs are accepted. Titles are escaped. No live product metadata is fetched. iOS Share Extension, Android share intents and local notifications remain native implementation requirements.

## Sharing

Cards are self-contained 1080 by 1350 SVG files. They exclude product details, private notes and savings balances. Amounts are off by default, with the same setting applied to captions. Optional amounts describe estimated skipped purchase cost and are based on monthly item records. Earlier demo aggregates are never included. Captions can download as text if clipboard writing fails.

## Verification

The regression suite covers all routes, safe import escaping, recorded skips, monthly filtering, companion growth, independent monetary totals, private card contents, battle check-in deduplication, expiry and motion controls. Native delivery and live multiplayer cannot be verified in this browser-local prototype. Browser/device visual and accessibility review remains pending because the required browser-control skill is unavailable in this environment.
