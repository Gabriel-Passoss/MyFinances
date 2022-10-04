import 'package:flutter/material.dart';
import '../../controllers/transaction_controller.dart';

import '../../models/transaction.dart';

enum TransactionTypes { Entrada, Saida }

class SendModal extends StatefulWidget {
  const SendModal({super.key});

  @override
  State<SendModal> createState() => _SendModalState();
}

class _SendModalState extends State<SendModal> {
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
  TransactionTypes transactionTypes = TransactionTypes.Saida;

  var categorySelected = ValueNotifier('Banco');
  var transactionTypeSelected = "";

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
                  'Saída de dinheiro',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: const Text(
                    'Registre aqui a sua saída de dinheiro',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                                onChanged: (selected) => categorySelected
                                    .value = selected.toString(),
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
                          Column(
                            children: [
                              Radio(
                                  value: 'deposit',
                                  groupValue: transactionTypeSelected,
                                  onChanged: (selected) {
                                    setState(() {
                                      transactionTypeSelected =
                                          selected.toString();
                                    });
                                  }),
                              const Text(
                                'Entrada',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Radio(
                                  value: 'cashOut',
                                  groupValue: transactionTypeSelected,
                                  onChanged: (selected) {
                                    setState(() {
                                      transactionTypeSelected =
                                          selected.toString();
                                    });
                                  }),
                              const Text(
                                'Saída',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                                type: transactionTypeSelected,
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
