import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const Widget verticalSpaceSmall = SizedBox(height: 8.0);
  static const Widget verticalSpaceMedium = SizedBox(height: 10);
  static const Widget verticalSpaceLarge = SizedBox(height: 20);

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Exercício Montagem GUI',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "TELA DE CADASTRO",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpaceMedium,
              _buildLabeledTextField('NOME:', 'Digite o nome'),
              _buildLabeledTextField('ENDEREÇO:', 'Digite o endereço'),
              _buildLabeledTextField('EMAIL:', 'Digite o e-mail'),
              verticalSpaceLarge,
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        verticalSpaceSmall,
        TextField(
          decoration: _buildInputDecoration(hint),
        ),
        verticalSpaceMedium,
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buildButton(context, 'CANCELAR', true),
        const SizedBox(width: 20),
        _buildButton(context, 'SALVAR', false),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String label, bool isFirstButton) {
    return ElevatedButton(
      onPressed: () => onTapButton(context, isFirstButton),
      style: buttonStyle,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  void onTapButton(BuildContext context, bool isFirstButton) {
    final action = isFirstButton ? 'cancelar' : 'salvar';
    showCustomAlert(context, 'Botão $action', 'O botão $action foi acionado');
  }

  void showCustomAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        );
      },
    );
  }
}
