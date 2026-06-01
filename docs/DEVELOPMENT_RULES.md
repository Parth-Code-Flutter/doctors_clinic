# Doctors Clinic — Development Rules

**All contributors and AI-assisted work on this project must follow these rules.**  
You may add more rules to this file over time; when you do, treat the updated list as the source of truth.

Reference product doc: [`README.md`](README.md)  
Reference Flutter structure: **qobo ref project** (`qobo_one_live`) — see [`README.md` §13](README.md#13-reference-project-keyword).

---

## 1. Use common widgets first

- **Always** use existing shared UI from `lib/utils/app_widgets/` (and related utils) before building one-off UI.
- Current shared widgets include (extend as needed):
  - `app_button.dart` — `appButton()`
  - `app_clinic_logo.dart` — `AppClinicLogo`
  - `common_app_bar_widget.dart` — `CommonAppBarWidget`
  - `app_text_field.dart` — `AppTextField`
  - `app_drop_down.dart` — `AppDropDown`
  - `clinic_bottom_nav_bar.dart` — `ClinicBottomNavBar` (floating main-app dock)
  - `main_tab_scaffold.dart` — `MainTabScaffold`, `MainTabPlaceholderContent`
  - `tab_header_action_button.dart` — `TabHeaderActionButton` (compact add/book in tab headers)
  - `app_spaces.dart` — `Spacing`
  - `app_text.dart` / `text_styles.dart` — text helpers
- If a UI pattern is needed more than once, or is clearly reusable (buttons, fields, cards, dialogs, app bars), **add or extend a common widget** in the correct file under `lib/utils/app_widgets/` (or a dedicated utils subfolder), then use it from feature views.
- Do **not** duplicate button/text-field styling inside feature `views/` when a common widget can cover it.

---

## 2. Clean code and comments

- Write **clean, readable code**: small methods, clear names, consistent formatting.
- Add **comments only where they help**: non-obvious business rules, tricky flows, or important “why” — not for obvious code.
- Match the style of surrounding files in the same module.
- Keep controllers and views focused; avoid large unrelated blocks in one file.

---

## 3. String constants

- **All user-facing static strings** (labels, titles, button text, hints, snackbar messages, route-related copy, etc.) must live in `lib/constants/string_constants.dart` as `const String` values (e.g. `kWelcomeTitle`).
- Do **not** hardcode display strings in `views/` or `controllers/` except for debug logs.
- When adding a new screen, add its strings to `string_constants.dart` first (or in the same change), then reference them from UI and controllers.

---

## 4. GetX structure (mandatory)

Follow the same layout as the **qobo ref project** for every new feature:

```text
lib/app/<feature_group>/<feature_name>/
  bindings/
  controllers/
  views/
```

Examples:

- `lib/app/splash/splash/...`
- `lib/app/auth/welcome/...`
- `lib/app/auth/login/...` (when added)

Also:

- Register routes in `lib/routes/app_routes.dart` and `lib/routes/app_pages.dart`.
- Use **Bindings** to register controllers (`Get.put` / `Get.lazyPut` as appropriate).
- Views extend **`GetView<YourController>`** where applicable.
- Controllers extend **`GetxController`**.
- Use normal lowercase **filesystem folders** only — never package-style names like `App.splash`.

Shared non-UI code:

- `lib/constants/` — colors, strings, images paths  
- `lib/routes/` — routing  
- `lib/repo/` — API/data access (when added)  
- `lib/services/` — app services (when added)  
- `lib/utils/` — shared widgets and helpers  

---

## 5. Business logic in controllers only

- **Controllers** own: navigation triggers, form state, validation orchestration, API calls (via repos later), loading flags, and user actions.
- **Views** own: layout and wiring UI to controller methods — no business rules beyond presentation.
- **Bindings** own: dependency registration only.
- **Repos / services** own: data fetching and persistence — not UI logic.

Do not put API calls, navigation decisions, or multi-step workflows directly in `views/`.

---

## 6. Documentation and progress tracking

- When a screen, module, or shared foundation is **completed**, update the progress tables in [`README.md` §24](README.md#24-implementation-progress-tracker) in the **same work session** as the code.

---

## 7. Adding new rules later

This file is **living documentation**. New rules can be appended as numbered sections; all future work must comply with the full list unless explicitly overridden for a one-off task.

---

## Quick checklist (before finishing a task)

- [ ] Used or created common widgets under `lib/utils/`
- [ ] Strings in `string_constants.dart`
- [ ] GetX folders: `bindings` / `controllers` / `views`
- [ ] Routes updated in `app_pages.dart` / `app_routes.dart`
- [ ] Logic in controller, UI in view
- [ ] `docs/README.md` §24 updated if something shipped
