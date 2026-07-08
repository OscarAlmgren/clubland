---
created: 2026-04-03T00:00:00.000Z
updated: 2026-04-03T00:00:00.000Z
assigned: ""
progress: 0
tags:
  - backlog
  - implementation
  - clubs
---

# Koppla check-in mutation i clubs datasource

`clubs_remote_datasource.dart:505` har TODO för `checkInToClubMutation`.
Filen `lib/graphql/clubs/check_in.graphql` finns redan — operationen behöver bara
läggas till i `GraphQLDocuments` och kopplas till datasource-metoden.

Backend stödjer: `checkInFacilityBooking`, `checkInRestaurantReservation`, `checkInEventRSVP`.
