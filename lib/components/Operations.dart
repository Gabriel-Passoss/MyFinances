import 'package:flutter/material.dart';
import 'operation_button.dart';

import 'modals/send_modal.dart';

class Operations extends StatelessWidget {
  const Operations({super.key});

  _openSendModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return const SendModal();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => _openSendModal(context),
            child: OperationButton(
              icon: Icons.arrow_upward,
              color: Colors.red.shade400,
              title: 'Saída',
            ),
          ),
          OperationButton(
            icon: Icons.arrow_downward,
            color: Colors.green.shade400,
            title: 'Entrada',
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
