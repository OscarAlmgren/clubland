import '../graphql/graphql_api.dart';

/// Human-readable labels for [Enum$VoteChoice].
///
/// The backend's authoritative codelist (ontology/codelists/governance-codelists.ttl)
/// defines these same prefLabels. Kept static here per the project's static-enum
/// alignment decision (no runtime codelist fetch).
const Map<Enum$VoteChoice, String> kVoteChoiceLabels = {
  Enum$VoteChoice.YAY: 'Yay',
  Enum$VoteChoice.NAY: 'Nay',
  Enum$VoteChoice.ABSTAIN: 'Abstain',
};

extension VoteChoiceLabel on Enum$VoteChoice {
  String get label => kVoteChoiceLabels[this] ?? toString();
}
