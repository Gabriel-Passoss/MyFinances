import 'package:flutter/material.dart';
import 'package:my_finances/models/transaction.dart';

import '../../controllers/transaction_controller.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({super.key, required this.transaction});

  final Transaction transaction;
  final controller = singletonController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 80,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.grey[700]!.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 7),
                child: Icon(
                  Icons.paypal_outlined,
                  color: Colors.white.withOpacity(0.6),
                  size: 40,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      transaction.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Text(
                    '26 de setembro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                transaction.type == "deposit"
                    ? '+ R\$${transaction.value.toStringAsFixed(2)}'
                    : '- R\$${transaction.value.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller.removeTransaction(transaction);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[400],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
