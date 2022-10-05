import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'operation_button.dart';

import '../modals/deposit_modal.dart';
import '../modals/send_modal.dart';

class Operations extends StatelessWidget {
  const Operations({super.key});

  _openSendModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return const SendModal();
        });
  }

  _openDepositModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return const DepositModal();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
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
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => _openDepositModal(context),
            child: OperationButton(
              icon: Icons.arrow_downward,
              color: Colors.green.shade400,
              title: 'Entrada',
            ),
          ),
          OperationButton(
            icon: Icons.pix,
            color: Colors.amber.shade500,
            title: 'Pix',
          ),
          OperationButton(
            icon: FontAwesomeIcons.barcode,
            color: Colors.blueGrey.shade400,
            title: 'Boleto',
          ),
        ],
      ),
    );
  }
}
