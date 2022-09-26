import 'package:flutter/material.dart';

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
          margin: const EdgeInsets.only(top: 25, left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Seus Cartões',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 30,
                          fontFamily: 'PublicSans',
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
