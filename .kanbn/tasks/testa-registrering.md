---
created: 2026-04-03T00:00:00.000Z
updated: 2026-04-03T00:00:00.000Z
assigned: ""
progress: 0
tags:
  - test
  - manual
  - auth
---

# Testa registrering av nytt konto

1. Öppna appen — splash-sidan visas och navigerar till inloggning
2. Tryck "Register", fyll i e-post och obligatoriska fält
3. Slutför registrering — appen navigerar till hem eller club-val
4. Bekräfta att `syncUser`-mutationen körs och token sparas i Keychain

**Förväntat:** Konto skapat, JWT lagrat, rätt navigering efteråt
