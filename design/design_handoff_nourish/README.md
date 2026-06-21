# Handoff: Nourish — Calorie Tracker (Mobile App)

## Overview
Nourish is a mobile calorie & nutrition tracking app (Indonesian-language UI). Users set up a profile, log meals across 4 meal times, track macros (protein/carbs/fat) and water, and review weekly statistics. The design is warm-minimal: soft cream backgrounds, sage-green accent, serif display numbers.

---

## About the Design Files
The file in this bundle (`Nourish App.html`) is a **design reference created in HTML/React** — a working prototype showing the intended look and behavior. **It is not production code to copy directly.**

Your task is to **recreate these designs in your target codebase** using its established patterns and libraries. If you're starting fresh, the recommended stack is:
- **React Native + Expo** (closest to the iOS look here), or
- **Flutter**, or
- **SwiftUI** (native iOS).

The HTML uses inline styles and a fixed iPhone frame (390×844) purely for previewing — translate the layout/tokens below into your framework's idioms (StyleSheet, styled-components, Tailwind, SwiftUI modifiers, etc.).

---

## Fidelity
**High-fidelity (hifi).** Final colors, typography, spacing, and interactions are specified below and should be recreated pixel-faithfully. The reference frame is a 390×844 logical-pixel iPhone (12/13/14 class). All measurements are in logical px (= dp on Android, pt on iOS).

---

## Design Tokens

### Colors
| Token | Hex | Usage |
|---|---|---|
| `bg` | `#F7F4EE` | App background (warm off-white) |
| `bgCard` | `#FFFFFF` | Cards, sheets |
| `bgMuted` | `#F0EDE6` | Secondary background |
| `surface` | `#EAE6DD` | Track/empty progress, icon chips |
| `border` | `rgba(0,0,0,0.07)` | Hairline dividers, card borders |
| `text` | `#1C1A16` | Primary text |
| `textSec` | `#6B6560` | Secondary text |
| `textMuted` | `#A09890` | Tertiary/placeholder text |
| `green` (accent) | `#4A7C59` | Primary accent, protein macro |
| `greenLight` | `#EBF3EE` | Accent tint backgrounds |
| `greenDark` | `#2F5238` | Gradient end, dark accent text |
| `yellow` | `#D4A843` | Carbs macro |
| `yellowLight` | `#FDF6E3` | — |
| `red` | `#C45C4A` | Fat macro, over-target, destructive |
| `redLight` | `#FDEEED` | Destructive tint |
| Water blue | `#2B6CB0` | Water tracker fill |
| Water blue bg | `#EBF3FA` | Water card background |
| Water blue text | `#1E4A6B` | Water card label |
| Streak orange | `#FF6B35` | Streak badge |

**Accent is themeable.** Alternate accent options offered in the prototype: `#4A7C59` (green, default), `#2B6CB0` (blue), `#C45C4A` (red), `#8B5CF6` (purple), `#D4A843` (yellow). Gradients use `linear-gradient(135deg, accent, #2F5238)`.

### Typography
Two families (Google Fonts):
- **DM Sans** — UI/body. Weights: 300, 400, 500, 600, 700.
- **DM Serif Display** — large numbers, headings, hero text. Weights: 400 (regular + italic).

| Role | Font | Size | Weight | Notes |
|---|---|---|---|---|
| Hero title (Onboarding logo) | DM Serif Display | 42 | 400 | line-height 1.1 |
| Screen heading (onboarding) | DM Serif Display | 32–34 | 400 | line-height 1.2 |
| Big calorie number | DM Serif Display | 40 | 400 | dashboard ring card |
| Card stat number | DM Serif Display | 18–28 | 400 | meals, macros, stats |
| Screen title (top bar) | DM Sans | 22–24 | 700 | |
| Section header | DM Sans | 15–17 | 700 | |
| Row title | DM Sans | 15 | 600 | |
| Body / secondary | DM Sans | 13–14 | 400 | color `textSec` |
| Label / uppercase | DM Sans | 11–13 | 600 | letter-spacing 0.3–0.8, uppercase |
| Macro chip | DM Sans | 10 | 700 | |
| Caption / muted | DM Sans | 10–11 | 400 | color `textMuted` |

### Spacing
Base scale (px): `4, 6, 8, 10, 12, 14, 16, 20, 24, 28`. Screen horizontal padding: **16** (cards) / **24** (headers & text blocks). Card inner padding: **16–24**. Gap between stacked cards: **8–12**.

### Border Radius
| Element | Radius |
|---|---|
| Device frame | 48 |
| Large cards (ring card, charts) | 24 |
| Standard cards | 20 |
| List rows / food items | 16 |
| Inputs | 14 |
| Buttons | 12–16 |
| Icon chips | 12 |
| Small badges | 5–8 |
| Pills / circular | 9999 |
| Macro bars (track + fill) | 99 |

### Shadows
| Use | Value |
|---|---|
| Ring card | `0 2px 16px rgba(0,0,0,0.06)` |
| Meal cards | `0 1px 6px rgba(0,0,0,0.04)` |
| Active chip / FAB | `0 4px 12px {accent}44` / `0 6px 20px {accent}55` |
| Primary button | `0 8px 24px {accent}44` |

---

## Screens / Views

### 1. Onboarding (4 steps, single screen with internal step state)
**Purpose:** Collect profile, compute calorie targets, welcome the user.
**Layout:** Full-bleed `bg` background. Status bar at top. Content area below switches between 4 steps with a fade transition (opacity 0→1, 150ms).

- **Step 0 — Welcome:** Centered column. Animated leaf logo (72px, `pulse` 3s loop), serif "Nourish" (42px), tagline (16px `textSec`). Primary button "Mulai Sekarang" (full-width, accent, radius 16, padding 16, shadow). Text button below: "Sudah punya akun? Masuk".
- **Step 1 — Name:** Top: step label "Langkah 1 dari 3" (accent, uppercase, 13/600), progress bar (4px track, 33% accent fill). Serif heading "Hai! Siapa namamu?" (32px). Subtitle. Large text input (serif 20px, 2px border that turns accent when filled, radius 14). Bottom: "Lanjut →" button (disabled/muted until name entered).
- **Step 2 — Body stats:** Step label "Langkah 2 dari 3", 66% progress. Two number inputs side-by-side (Berat kg / Tinggi cm), serif 24px. Goal selector: 3 radio cards (Turun Berat Badan / Jaga Berat Badan / Tambah Massa Otot) — selected card gets `greenLight` bg + accent border + filled radio dot.
- **Step 3 — Done:** Centered. Green check circle (88px, `greenLight` bg, `checkPop` animation). Serif "Selamat, {name}!". Stat summary card (`greenLight`): 4 columns — 2000 Kalori / 150g Karbo / 120g Protein / 55g Lemak. "Mulai Nourish!" button → enters main app.

### 2. Dashboard / Home (tab: `home`)
**Purpose:** At-a-glance daily progress.
**Layout:** Scrollable, `paddingBottom: 100` to clear tab bar.
- **Header:** Date (13px `textSec`) + greeting "Halo, {name} 👋" (22/700). Right: 40px gradient avatar circle.
- **Ring card** (`bgCard`, radius 24, ring-card shadow): Left column — "KALORI HARI INI" label, big serif total (40px), "dari 2.000 kkal". Right — **AnimatedRing** 100px, strokeWidth 10, shows percent in center. Ring animates from empty to target offset over 1.2s `cubic-bezier(0.34,1.56,0.64,1)` after a 300ms delay.
- **Remaining callout:** Pill row inside card — `greenLight` bg (or `redLight` if over). Circular icon (+/×), "{n} kkal tersisa" / "{n} kkal melebihi target".
- **Macro bars:** 3 `MacroBar` components (Protein/Karbo/Lemak) — label + current/goal, 6px track, colored fill animating width over 1s. Colors green/yellow/red.
- **Meal summary:** Section header "Ringkasan Makan" + "Lihat semua". 4 meal cards (🌅 Sarapan / ☀️ Makan Siang / 🌙 Makan Malam / 🍎 Camilan): emoji chip, name + item count, right serif kcal total, chevron. Tap → Log tab. Staggered `fadeSlideUp` entrance.
- **Water widget:** Blue card (`#EBF3FA`). "💧 Air Minum" + "5/8 gelas". Row of 8 segments (28px tall, radius 8); filled = `#2B6CB0`, empty = `rgba(43,108,176,0.18)`.

### 3. Food Log (tab: `log`)
**Purpose:** Review & manage logged foods per meal.
**Layout:** Fixed header + scrollable list, `paddingBottom: 90`.
- **Header:** Date, "Food Log" (24/700). Horizontal scrollable meal-time chips (4) — active chip = accent bg, white text, shadow; inactive = white card, `textSec`.
- **Meal total card:** Active meal name + serif kcal total. "+ Tambah" button (accent) → Add Food screen for that meal.
- **Food items:** Each row (`bgCard`, radius 16): 44px emoji chip, name (15/600), "{qty} × {serving}", macro chips (P/K/L with `{color}18` tint bg), right serif kcal + "kkal".
- **Empty state:** Centered emoji + "Belum ada makanan" + hint.

### 4. Add Food (modal-style full screen)
**Purpose:** Search the food DB and add items to a meal.
**Layout:** Header with back button (36px white chip) + "Tambah ke {meal}" / "Pilih Makanan". Search input with magnifier icon (border turns accent when typing). Scrollable results.
- **Food result row:** 48px emoji chip, name, "{serving} · {category}", macro chips, right serif kcal + a 32px circular add button. On add: button + card flip to accent/`greenLight`, icon morphs + → ✓ with `checkPop`, reverts after 1.5s. Item is appended to the meal's log live.
- Reached via the center **FAB** (+) in the tab bar (defaults to "Makan Malam") or "Tambah" buttons.

### 5. Statistik (tab: `stats`)
**Purpose:** Weekly trends and macro distribution.
**Layout:** Scrollable, `paddingBottom: 90`.
- **Weekly bar chart card:** "Kalori Mingguan / 7 hari terakhir". 7 vertical bars (Sen–Min), 120px chart height. Today (last) = accent; over-goal days = red with ↑ marker; others = `surface` at 0.6 opacity. Bars animate height with staggered delay (`i*0.06s`). Goal-line label below.
- **Macro donut card:** "Distribusi Makro Hari Ini". 120px SVG donut with 3 segments (green/yellow/red) drawn via `stroke-dasharray`, animating in with staggered delays; white center hole shows total kcal. Right: 3 legend rows with mini progress bars.
- **Achievements card:** "Pencapaian". 3 stat tiles: 🔥 7 Hari berturut-turut / 🎯 85% Akurasi target / 🥗 42 Makanan berbeda. Serif value, caption.

### 6. Profil (tab: `profile`)
**Purpose:** Profile, body stats, preferences.
**Layout:** White header block, then cards. `paddingBottom: 90`.
- **Header:** 64px gradient avatar (first initial, serif), name (22/700), "Bergabung sejak…", streak dot + "7 hari streak".
- **Body stats row:** 4 columns separated by hairline dividers — Berat Saat Ini 65 kg / Target 60 kg / BMI 22.3 / TDEE 2.180 kkal. Serif values.
- **Preferensi card:** Uppercase section label + grouped list (Target Kalori / Level Aktivitas / Alergi / Tujuan) — label left, value right, hairline between rows.
- **Logout button:** Full-width `redLight` bg, `red` text.

---

## Navigation & Tab Bar
- **Bottom tab bar:** Fixed, frosted (`rgba(247,244,238,0.95)` + `backdrop-filter: blur(20px)`), top hairline, `paddingBottom: 28` (home-indicator safe area). 5 slots: Beranda · Log · **[FAB]** · Statistik · Profil. Active item = accent icon + label (600); inactive = `textMuted`.
- **Center FAB:** 52px circle, accent→greenDark gradient, white +, lifted `marginTop: -20`, accent glow shadow. Opens Add Food.
- **Flow:** Onboarding → (done) → Home. Tabs swap top-level screens. Meal cards / "Lihat semua" → Log. "Tambah"/FAB → Add Food → back returns to previous main screen.

---

## Interactions & Behavior
| Interaction | Spec |
|---|---|
| Progress ring fill | `stroke-dashoffset` from full to target, 1.2s `cubic-bezier(0.34,1.56,0.64,1)`, 300ms delay |
| Macro bar fill | width 0→target%, 1s `cubic-bezier(0.34,1.56,0.64,1)`, staggered 500–700ms |
| Weekly bars | height 0→value, 0.8s spring, stagger `i*0.06s` |
| Donut segments | `stroke-dasharray` grow, 1s ease, stagger `0.3 + i*0.15s` |
| Step transitions (onboarding) | opacity fade 150ms + `fadeSlideIn` (translateX 30→0) |
| Card entrances | `fadeSlideUp` (translateY 20→0), staggered |
| Add-food confirm | `checkPop` (scale 0→1.2→1), color flip, auto-revert 1.5s |
| Logo idle | `pulse` scale 1↔1.05, 3s infinite |
| Input focus | border-color → accent, 200ms |
| Buttons | disabled state = `surface` bg + `textMuted` text when form invalid |

**Keyframes used:** `ringFill`, `fadeSlideUp`, `fadeSlideIn`, `fadeIn`, `scaleIn`, `shimmer`, `pulse`, `barGrow`, `floatUp`, `checkPop`, `bounceDot`. Respect `prefers-reduced-motion` in production — show end-states without animating.

---

## State Management
Top-level state (in `App`):
- `screen`: `'onboarding' | 'main' | 'addFood'`
- `tab`: `'home' | 'log' | 'stats' | 'profile'`
- `logs`: `{ [mealTime]: FoodEntry[] }` where mealTime ∈ `Sarapan, Makan Siang, Makan Malam, Camilan`
- `addingMeal`: which meal the Add Food screen targets
- Onboarding-local: `step`, `data { name, weight, height, goal, actLevel }`

`FoodEntry` shape: `{ id, name, cal, p, c, f, serving, emoji, category, qty, totalCal }`.
Dashboard/Stats totals are **derived** from `logs` (sum `totalCal`; macros = `Σ macro*qty`). Adding a food appends to `logs[addingMeal]` and updates all derived views live.

**Goals (defaults):** calories 2000, protein 120g, carbs 250g (onboarding summary shows 150g — reconcile to one value in production), fat 65g, water 8 glasses.

---

## Sample Food Database (seed data)
| Name | kcal | P | C | F | Serving | Category |
|---|---|---|---|---|---|---|
| Nasi Putih | 130 | 2.7 | 28 | 0.3 | 100g | Karbohidrat |
| Ayam Bakar | 215 | 30 | 0 | 10 | 100g | Protein |
| Tempe Goreng | 193 | 14 | 12 | 10 | 100g | Protein |
| Sayur Bayam | 23 | 2.9 | 3.6 | 0.4 | 100g | Sayuran |
| Pisang | 89 | 1.1 | 23 | 0.3 | 1 buah | Buah |
| Tahu Goreng | 70 | 8 | 2 | 4 | 100g | Protein |
| Mie Goreng | 337 | 7 | 50 | 12 | 1 porsi | Karbohidrat |
| Alpukat | 160 | 2 | 9 | 15 | 100g | Buah |
| Telur Rebus | 78 | 6 | 0.6 | 5 | 1 butir | Protein |
| Susu Full Cream | 149 | 8 | 12 | 8 | 250ml | Minuman |

---

## Assets
- **Icons:** All inline SVG (tab bar, chevrons, search, plus, check, status bar). Recreate with your icon library (SF Symbols / Material / Lucide) or keep as SVG.
- **Food icons:** Emoji (🍚🍗🥬🍌🥑…). In production consider a proper food-image set or illustration pack.
- **Logo:** Custom leaf mark in SVG (`NourishLogo`) — see source for path data.
- **Fonts:** DM Sans + DM Serif Display (Google Fonts) — bundle for offline/native.
- No external images; nothing requires licensing beyond the Google Fonts (SIL OFL).

---

## Files
- `Nourish App.html` — the full interactive prototype (React via Babel, inline). Contains every screen, the animated ring/charts, the food DB, and a Tweaks panel for accent color / name / calorie goal. Open in a browser to interact.
- `ios-frame.jsx` — device-frame & status-bar helper used only for preview chrome (not part of the app UI).

> The `Nourish App.html` uses a fixed 390×844 frame and inline styles for prototyping. Treat it as the visual source of truth; implement with your platform's native layout system, navigation, and component primitives.
