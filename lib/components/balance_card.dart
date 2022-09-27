import 'package:flutter/material.dart';

import '../models/app_routes.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  void _enterSummaryPage(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.SUMMARY,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _enterSummaryPage(context),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 350,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[700]!.withOpacity(0.4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '23 de março, 2022',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontFamily: 'PublicSans',
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Text(
                    '\$27.802,05',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PublicSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 3),
                    child: const Text(
                      '15%',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PublicSans',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_upward_outlined,
                    color: Colors.green.shade700,
                    size: 27,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
