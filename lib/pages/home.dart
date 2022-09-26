import 'package:flutter/material.dart';
import '../components/Operations.dart';
import '../components/balance_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final filters = ['Esta semana', 'Este mês', 'Este ano'];
  var filterSelected = ValueNotifier('Esta semana');

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
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
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
            const BalanceCard(),
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
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
