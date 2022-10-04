class Transaction {
  final String title;
  final double value;
  final String type;
  final String category;
  final DateTime date;

  Transaction({
    required this.title,
    required this.value,
    required this.type,
    required this.category,
    required this.date,
  });
}
