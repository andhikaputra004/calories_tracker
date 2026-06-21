# Calories Tracker

  ## Project Overview
  Nourish adalah aplikasi mobile tracking kalori dan nutrisi harian berbahasa Indonesia.
  Pengguna dapat mencatat makanan per waktu makan, memantau kalori dan makro
  (protein, karbo, lemak), serta mengatur target harian sesuai tujuan kesehatan mereka.

  ## Tech Stack
  - Flutter (target: iOS & Android)
  - State management: BLoC (flutter_bloc)
  - Database lokal: Drift (SQLite)
  - HTTP: Dio
  - Navigation: go_router
  - Charts: fl_chart
  - Food API: Open Food Facts

  ## Architecture
   Proyek menggunakan Clean Architecture dengan pendekatan feature-first —
   kode dipisah berdasarkan fitur (dashboard, food_log, food_search, goals, profile).
   Setiap fitur memiliki 3 layer: data (repository & API), domain (model & business logic),
   dan presentation (widget & screen).
   Selain features/, terdapat folder core/ (shared utilities, constants, extensions),
   app/ (router & theme), dan database/ (Drift tables & DAOs).

  ## Coding Rules
  - Untuk namingnya pake camelCase untuk nama fungsi dan variable
  - Untuk class nama filenya pake snake_case
  - Untuk Widget jangan buat besar dibuat ke component kecilnya , reusable, dan pake best practice
  - Tidak ada print() di kode, pakai debugPrint()
  - Tanya sebelum memilih antara 2 pendekatan berbeda

  ## Agent Roles
  - **Architect**: keputusan arsitektur dan tech stack — dipanggil via `/architect`
    - Skills: `/flutter-apply-architecture-best-practices`
  - **UI Builder**: implementasi widget dan screen — dipanggil via `/ui`
    - Skills: `/flutter-build-responsive-layout`, `/flutter-fix-layout-issues`
  - **Logic**: BLoC events, states, dan business logic — dipanggil via `/logic`
    - Skills: `/flutter-implement-json-serialization`, `/flutter-setup-declarative-routing`
  - **Tester**: unit test & widget test — dipanggil via `/test`
    - Skills: `/flutter-add-widget-test`, `/flutter-add-integration-test`
  - **Reviewer**: review kode setelah implementasi — dipanggil via `/code-review`

  Setiap agent hanya fokus pada domainnya.
  Architect tidak menulis widget. UI Builder tidak menyentuh BLoC layer.
  Tester hanya menulis test, tidak mengubah production code.
