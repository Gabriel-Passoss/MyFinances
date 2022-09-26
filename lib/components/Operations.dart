import 'package:flutter/material.dart';
import '../components/OperationButton.dart';

class Operations extends StatelessWidget {
  const Operations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OperationButton(
            icon: Icons.arrow_upward,
            color: Colors.red.shade400,
            title: 'Enviar',
          ),
          OperationButton(
            icon: Icons.arrow_downward,
            color: Colors.green.shade400,
            title: 'Receber',
          ),
          OperationButton(
            icon: Icons.attach_money_outlined,
            color: Colors.amber.shade500,
            title: "Empréstimo",
          ),
          OperationButton(
            icon: Icons.cloud_outlined,
            color: Colors.blueGrey.shade400,
            title: 'Completar',
          ),
        ],
      ),
    );
  }
}
