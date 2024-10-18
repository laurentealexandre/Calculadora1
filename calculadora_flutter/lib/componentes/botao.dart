import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final Color cor;
  final void Function(String) callback;

  const Botao({
    Key? key,
    required this.texto,
    required this.cor,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => callback(texto),
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  texto,
                  style: TextStyle(
                    color: _getTextColor(cor),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getTextColor(Color backgroundColor) {
    if (ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }
}