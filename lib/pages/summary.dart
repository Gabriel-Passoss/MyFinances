import 'package:flutter/material.dart';
import 'package:my_finances/components/transaction_card.dart';

import '../models/app_routes.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  void _backToHome(BuildContext context) {
    Navigator.of(context).pop();
  }

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
        margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
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
                          fontWeight: FontWeight.w600),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(top: 25),
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(103, 40, 255, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/images/chip_cartao.png'),
                  ),
                  Container(
                    child: const Text(
                      '4562 1122 4595 7852',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: const Text(
                              'Gabriel dos Passos',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: const Text(
                              'Data de expiração',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: const Text(
                              '05/28',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 60,
                        height: 60,
                        child: Image.asset('assets/images/mastercard.png'),
                      )
                    ],
                  ),
                ],
              ),
            ),
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
            const TransactionCard()
          ],
        ),
      ),
    );
  }
}
