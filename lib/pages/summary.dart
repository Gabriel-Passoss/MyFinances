import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_finances/controllers/transaction_controller.dart';

import '../models/transaction.dart';
import '../repositories/transactions_repository.dart';

import '../components/summary/credit_card.dart';
import '../components/summary/transaction_card.dart';

import '../models/app_routes.dart';

class Summary extends StatelessWidget {
  Summary({super.key});

  void _backToHome(BuildContext context) {
    Navigator.of(context).pop();
  }

  final controller = singletonController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => _backToHome(context),
        ),
        actions: [
          PopupMenuButton(
              position: PopupMenuPosition.under,
              color: Colors.grey.shade900,
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 26,
              ),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text(
                        'Placeholder',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ])
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seus Cartões',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 30,
                        fontFamily: 'PublicSans',
                      ),
                    ),
                    Text(
                      'Você tem 3 cartões ativos',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.amber.shade300),
                      child: const Icon(Icons.add_outlined),
                    ))
              ],
            ),
            const CreditCard(),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Transações recentes',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 20,
                  fontFamily: 'PublicSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Observer(builder: (context) {
                  return ListView.builder(
                      itemCount: controller.recentTransactions.length,
                      itemBuilder: (BuildContext context, index) {
                        return TransactionCard(
                          transaction: controller.recentTransactions[index],
                        );
                      });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
