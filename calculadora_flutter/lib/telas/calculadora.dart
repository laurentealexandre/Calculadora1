import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../componentes/visor.dart';
import '../componentes/teclado.dart';
import '../modelos/memoria.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final Memoria memoria = Memoria();

  _pressionado(String comando) {
    setState(() {
      memoria.tratarDigito(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255), 
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                
                Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 88, 88, 88),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Visor(memoria.valorNoVisor),
                ),
                SizedBox(height: 1), 
                
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 88, 88, 88),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Teclado(_pressionado),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}