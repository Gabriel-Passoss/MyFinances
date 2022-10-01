import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    titleInput.dispose();
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
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800.withOpacity(0.5),
                          labelText: 'Tipo da transação',
                          labelStyle: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                        controller: typeInput,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo não preenchido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          var formValid =
                              formKey.currentState?.validate() ?? false;
                          var message = 'Formulário inválido';

                          if (formValid) {
                            message = 'Formulário enviado';
                          }
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(message)));
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
