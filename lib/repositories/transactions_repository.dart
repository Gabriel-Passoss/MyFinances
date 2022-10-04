import '../models/transaction.dart';

class TransactionsRepository {
  final List<Transaction> _transactions = [];

  List<Transaction> loadTransactions() {
    _transactions.addAll([
      // Transaction(
      //     title: 'Paypal', value: 2000, type: 'bank', date: DateTime.now()),
      // Transaction(
      //     title: 'Steam', value: 250, type: 'game', date: DateTime.now()),
    ]);
    return _transactions;
  }

  List<Transaction> addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    return _transactions;
  }

  List<Transaction> removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    return _transactions;
  }
}
