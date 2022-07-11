import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_clinica/models/pagos.dart';
import 'package:flutter_application_clinica/providers/pagos_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class PagosFormScreen extends StatefulWidget {
  const PagosFormScreen({Key? key}) : super(key: key);

  @override
  State<PagosFormScreen> createState() => _PagosFormScreen();
}

enum Categorias { Debito, Credito }

class _PagosFormScreen extends State<PagosFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final txtpagoId = TextEditingController();
  final txtNomUsuario = TextEditingController();
  final txtNumTarje = TextEditingController();
  final txtfecha = TextEditingController();
  final txtclave = TextEditingController();
  Categorias? _catSeleccion = Categorias.Debito;
  bool formModificado = false;
  

  @override
  Widget build(BuildContext context) {
    final pagosProvider = Provider.of<PagosProvider>(context);
    // RECIBIENDO EL PRODUCTO POR ARGUMENTO
    final Pago? pago =ModalRoute.of(context)!.settings.arguments as Pago?;

    if (!formModificado) {
      if (pago != null) {
        // EDITAR
        txtpagoId.text = pago.pagoId.toString();
        txtNomUsuario.text = pago.nomUsuario;
        txtNumTarje.text = pago.numTarje;
        txtfecha.text = pago.fecha;
        txtclave.text = pago.clave.toString();
        print(pago.categoria);
        
        if (pago.categoria == 'Categorias.Debito') {
          _catSeleccion = Categorias.Debito;
        } else {
          _catSeleccion = Categorias.Credito;
        }
        
      } else {
        // NUEVO
        txtpagoId.text = '0';
        txtNomUsuario.text = '';
        txtNumTarje.text = '';
        txtfecha.text = '';
        txtclave.text = '';
      }
    }




    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('REGISTRO DE PAGOS'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              //maxLines: 8,
              //maxLength: 50,
              decoration: InputDecoration(
                  labelText: 'Nombre y Apellido',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtNomUsuario,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una descripcion';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskedInputFormatter('#### #### #### ####')
                ],
                decoration: InputDecoration(
                    labelText: '0000 0000 0000 0000',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtNumTarje,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una descripcion';
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskedInputFormatter('##/##')
                ],
                decoration: InputDecoration(
                    labelText: '00/00',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtfecha,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ' ingrese su Fecha';
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),          
            Container(
              width: 150,
              alignment: Alignment.centerLeft,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'cvv',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtclave,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ingrese el cvv';
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: <Widget>[
                Text('Categoria:'),
                SizedBox(
                  width: 20,
                ),
                Radio(
                    value: Categorias.Debito,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                        formModificado = true;
                      });
                    }),
                Text('Debito'),
                SizedBox(
                  width: 15,
                ),
                Radio(
                    value: Categorias.Credito,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                        formModificado = true;
                      });
                    }),
                Text('Credito'),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              child: ElevatedButton(
                child: const Text('PAGAR'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Valindado...')));

                    var pagos = Pago(
                        id: '',
                        pagoId: int.parse(txtpagoId.text),
                        nomUsuario: txtNomUsuario.text,
                        numTarje: txtNumTarje.text,
                        fecha: txtfecha.text,
                        clave: int.parse(txtclave.text),
                        categoria: _catSeleccion.toString());
                        

                    pagosProvider.savePagos(pagos);

                    Navigator.pushReplacementNamed(context, 'ruta_pagos');
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
