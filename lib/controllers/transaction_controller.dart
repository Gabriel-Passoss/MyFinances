import 'package:mobx/mobx.dart';

import '../models/transaction.dart';

part 'transaction_controller.g.dart';

// ignore: library_private_types_in_public_api
class _TransactionController = _TransactionControllerBase
    with _$_TransactionController;

abstract class _TransactionControllerBase with Store {
  List<Transaction> transactions = [
    Transaction(
      title: 'Paypal',
      value: 250,
      type: 'deposit',
      category: 'banco',
      date: DateTime.now(),
    )
  ].asObservable();

  @action
  double getBalance() {
    double balance = 0;

    for (var index = 0; index < transactions.length; index++) {
      if (transactions[index].type == 'deposit') {
        balance += transactions[index].value;
      } else {
        balance -= transactions[index].value;
      }
    }

    return balance;
  }

  @action
  List<Transaction> get recentTransactions {
    return transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @action
  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  @action
  void removeTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }
}

_TransactionController _singleton = _TransactionController();
// ignore: library_private_types_in_public_api
_TransactionController get singletonController => _singleton;
