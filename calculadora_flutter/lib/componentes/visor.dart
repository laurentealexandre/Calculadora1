import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Visor extends StatelessWidget {
  final String texto;

  const Visor(this.texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 109, 109, 109),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              texto,
              minFontSize: 20,
              maxFontSize: 80,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w100,
                decoration: TextDecoration.none,
                fontSize: 80,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}