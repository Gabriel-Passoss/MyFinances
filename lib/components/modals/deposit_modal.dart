import 'package:flutter/material.dart';
import '../../controllers/transaction_controller.dart';

import '../../models/transaction.dart';

class DepositModal extends StatefulWidget {
  const DepositModal({super.key});

  @override
  State<DepositModal> createState() => _DepositModalState();
}

class _DepositModalState extends State<DepositModal> {
  final formKey = GlobalKey<FormState>();
  final titleInput = TextEditingController();
  final valueInput = TextEditingController();
  final typeInput = TextEditingController();

  final filters = [
    'Banco',
    'Cartão de Crédito',
    'Comida',
    'Educação',
    'Transporte',
    'Cinema'
  ];

  var categorySelected = ValueNotifier('Banco');

  final controller = singletonController;

  @override
  void dispose() {
    titleInput.dispose();
    valueInput.dispose();
    typeInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 500,
        child: Card(
          color: Colors.grey.shade900,
          child: Container(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Entrada de dinheiro',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: const Text(
                    'Registre aqui a sua entrada de dinheiro',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800.withOpacity(0.5),
                          labelText: 'Nome da transação',
                          labelStyle: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                        controller: titleInput,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo não preenchido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800.withOpacity(0.5),
                          labelText: 'Valor da transação',
                          labelStyle: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                        controller: valueInput,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo não preenchido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ValueListenableBuilder(
                        valueListenable: categorySelected,
                        builder: (BuildContext context, String value, _) {
                          return DropdownButton(
                            dropdownColor: Colors.grey.shade900,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            value: (value.isEmpty) ? null : value,
                            onChanged: (selected) =>
                                categorySelected.value = selected.toString(),
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
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          var formValid =
                              formKey.currentState?.validate() ?? false;
                          var message = 'Formulário inválido';

                          if (formValid) {
                            message = 'Formulário enviado';
                          }
                          controller.addTransaction(
                            Transaction(
                                title: titleInput.text,
                                value: double.parse(valueInput.text),
                                type: 'deposit',
                                category: categorySelected.value,
                                date: DateTime.now()),
                          );
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green[400],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  'Transação ${titleInput.text} criada com sucesso!'),
                            ],
                          )));
                        },
                        child: const Text('Nova transação'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
