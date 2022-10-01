import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../components/operations.dart';
import '../components/balance_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final filters = ['Esta semana', 'Este mês', 'Este ano'];
  var filterSelected = ValueNotifier('Esta semana');

  final List<Transaction> _transactions = [
    Transaction(
      title: 'Paypal',
      value: 2500,
      type: 'expense',
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Google Play',
      value: 50,
      type: 'expense',
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Cartão de crédito',
      value: 15000,
      type: 'expense',
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Prestação da CG',
      value: 500,
      type: 'expense',
      date: DateTime.now(),
    )
  ];

  double get _balance {
    double balance = 0;

    for (var index = 0; index < _transactions.length; index++) {
      balance += _transactions[index].value;
    }

    return balance;
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.align_horizontal_left),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              height: 65,
              width: 65,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/icon.jpg'),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            SizedBox(
              width: 350,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Seu Balanço',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 30,
                    fontFamily: 'PublicSans',
                  ),
                ),
              ),
            ),
            BalanceCard(balance: _balance, transactions: _recentTransactions),
            const Operations(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Atividades',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'PublicSans',
                      fontSize: 24,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: filterSelected,
                    builder: (BuildContext context, String value, _) {
                      return DropdownButton(
                        dropdownColor: Colors.grey.shade900,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        value: (value.isEmpty) ? null : value,
                        onChanged: (selected) =>
                            filterSelected.value = selected.toString(),
                        items: filters
                            .map((filter) => DropdownMenuItem(
                                value: filter,
                                child: Text(
                                  filter,
                                )))
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
