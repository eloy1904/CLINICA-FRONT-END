import 'package:flutter/material.dart';
import 'package:flutter_application_clinica/models/historial.dart';
import 'package:flutter_application_clinica/providers/historial_provider.dart';
import 'package:provider/provider.dart';

class HistorialFormScreen extends StatefulWidget {
  const HistorialFormScreen({Key? key}) : super(key: key);

  @override
  State<HistorialFormScreen> createState() => _HistorialFormScreen();
}

enum Categorias { si, No }

class _HistorialFormScreen extends State<HistorialFormScreen> {
  final _formKey = GlobalKey<FormState>();
  Categorias? _catSeleccion = Categorias.si;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final historialProvider = Provider.of<HistorialProvider>(context);
    final txtNom = TextEditingController();
    final txtCont = TextEditingController();
    //final txtEnfermedad = TextEditingController();
    //final txtAntecedentes = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('creacion del historial'),
        backgroundColor: Colors.green[300],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  //maxLines: 1,
                  //maxLength: 50,
                  decoration: InputDecoration(
                    labelText: 'nombre',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: txtNom,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'POR FAVOR INGRESE Nombre ';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'contacto',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: txtCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'POR FAVOR INGRESE UN CONTACTO ';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                /*
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'enfermedad',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: txtEnfermedad,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'POR FAVOR INGRESE LOS DATOS ';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ANTECEDENTES',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: txtAntecedentes,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ingrese los datos  ';
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                */
                Row(
                  children: <Widget>[
                    Text('¿presenta alguna alergia?'),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: Categorias.si,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          print(_catSeleccion);
                        });
                      },
                    ),
                    Text('SI'),
                    SizedBox(
                      width: 10,
                    ),
                    Radio(
                      value: Categorias.No,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          print(_catSeleccion);
                        });
                      },
                    ),
                    Text('NO'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text('estado'),
                    SizedBox(
                      width: 10,
                    ),
                    Checkbox(
                      value: _estadoActivo,
                      onChanged: (value) {
                        setState(() {
                          _estadoActivo = value;
                          print('_estadoActivo: ${_estadoActivo}');
                        });
                      },
                    ),
                    Text('Activo')
                  ],
                ),
                Container(
                  child: ElevatedButton(
                    child: const Text('agregar historial'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Validando....')),
                        );
                        var historial = Historial(
                          id: '',
                          historialId: 0,
                          nombre: txtNom.text,
                          contacto: int.parse(txtCont.text),
                        );
                        historialProvider.saveHistorial(historial);

                        Navigator.pushReplacementNamed(
                            context, 'ruta_historial');
                      }
                    },
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
