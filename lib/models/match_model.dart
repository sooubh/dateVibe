class MatchModel {
  final String id;
  final String userId;
  final String matchedUserId;
  final DateTime timestamp;

  MatchModel({
    required this.id,
    required this.userId,
    required this.matchedUserId,
    required this.timestamp,
  });
}
