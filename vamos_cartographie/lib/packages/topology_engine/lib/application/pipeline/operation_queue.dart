class PendingOperation {
  final int id;
  final String type; // create/update/delete
  final dynamic payload;
  final DateTime createdAt;

  PendingOperation({
    required this.id,
    required this.type,
    required this.payload,
    required this.createdAt,
  });
}
