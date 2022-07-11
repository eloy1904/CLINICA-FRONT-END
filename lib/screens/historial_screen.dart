import 'dart:ui';

import 'package:flutter_application_clinica/models/historial.dart';
import 'package:flutter_application_clinica/providers/historial_provider.dart';
import 'package:flutter_application_clinica/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HistorialScreen extends StatefulWidget {
  const HistorialScreen({Key? key}) : super(key: key);

  @override
  createState() => _HistorialScreen();
}

class _HistorialScreen extends State<HistorialScreen> {
  @override
  Widget build(BuildContext context) {
    final historialProvider = Provider.of<HistorialProvider>(context);
    final List<Historial> listaHistorial = historialProvider.listaHistorial;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HISTORIAL DE PACIENTES '),
         backgroundColor: Colors.green[300],
      ),
      drawer: const MenuLateral(),
      body: Center(
          child: ListView.builder(
        itemCount: listaHistorial.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    listaHistorial[index].nombre,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  subtitle: Text(
                    listaHistorial[index].contacto.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 243, 124, 33)),
                  ),
                  leading: const Icon(Icons.card_giftcard),
                ),
              ],
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'ruta_historial_form');
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}
