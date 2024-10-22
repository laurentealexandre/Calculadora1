import 'package:flutter/material.dart';
import 'botao.dart';

class Teclado extends StatelessWidget {
  final void Function(String) callback;

  const Teclado(this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final buttonWidth = constraints.maxWidth / 4;
        final buttonHeight = constraints.maxHeight / 5;
        
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 109, 109, 109),  
            borderRadius: BorderRadius.circular(20),  
          ),
          margin: EdgeInsets.only(top: 10),  
          child: Column(
            children: <Widget>[
              _buildBotoesLinha(['C', '^', '!', '/'], buttonWidth, buttonHeight),
              _buildBotoesLinha(['7', '8', '9', '*'], buttonWidth, buttonHeight),
              _buildBotoesLinha(['4', '5', '6', '-'], buttonWidth, buttonHeight),
              _buildBotoesLinha(['1', '2', '3', '+'], buttonWidth, buttonHeight),
              _buildBotoesLinha(['0', '00', '.', '='], buttonWidth, buttonHeight),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBotoesLinha(List<String> botoes, double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: botoes.map((texto) => _buildBotao(texto, width, height)).toList(),
    );
  }

  Widget _buildBotao(String texto, double width, double height) {
    return Container(
      width: width - 8,
      height: height - 8,
      padding: EdgeInsets.all(4),
      child: Botao(
        texto: texto,
        callback: callback,
        cor: _definirCor(texto),
      ),
    );
  }

  Color _definirCor(String texto) {
    if (texto.contains(RegExp(r'[0-9]')) || texto == '.') {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}