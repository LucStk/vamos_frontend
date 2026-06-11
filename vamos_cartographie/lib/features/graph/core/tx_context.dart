class TxContext {
  final int txId;
  final Map<String, dynamic> tempIds = {};

  TxContext(this.txId);
}
