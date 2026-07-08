---
created: 2026-04-03T15:42:00.320Z
updated: 2026-04-03T15:42:49.173Z
assigned: ""
progress: 0
tags:
  - social
---

# implementera-social-check

`social_remote_datasource.dart` har 7 TODOs för operationer som saknas i `GraphQLDocuments`:

- `userActivityQuery`
- `clubReviewsQuery`
- `createReviewMutation`
- `likeActivityMutation`
- `addCommentMutation`
- `notificationsSubscription`
- `clubActivitySubscription`

Verifiera att backend-schemat stödjer dessa (inget `social.graphql` finns i backend ännu).
Skapa `.graphql`-filer i `lib/graphql/social/`, kör codegen, koppla till datasource.
