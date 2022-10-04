import 'package:mobx/mobx.dart';

import '../models/transaction.dart';

part 'transaction_controller.g.dart';

// ignore: library_private_types_in_public_api
class _TransactionController = _TransactionControllerBase
    with _$_TransactionController;

abstract class _TransactionControllerBase with Store {
  @observable
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
  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  void removeTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }
}

_TransactionController _singleton = _TransactionController();
_TransactionController get singletonController => _singleton;
