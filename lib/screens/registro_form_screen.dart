import 'package:flutter_application_clinica/models/usuario.dart';
import 'package:flutter_application_clinica/providers/usuario_provider.dart';
import 'package:flutter_application_clinica/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistroFormScreen extends StatefulWidget {
  const RegistroFormScreen({Key? key}) : super(key: key);

  @override
  createState() => _RegistroFormScreen();
}

class _RegistroFormScreen extends State<RegistroFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    final txtNombres = TextEditingController();
    final txtFecha = TextEditingController();
    final txtCorreo = TextEditingController();
    final txtDireccion = TextEditingController();
    final txtTelefono = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTRO DE USUARIO'),
        backgroundColor: Colors.green[300],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: '',
                  labelText: 'Nombres y Apellidos',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtNombres,
              validator: (value) {
                if (value!.isEmpty) {
                  return '* Por favor ingrese su nombre';
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_month),
                  hintText: '',
                  labelText: 'Fecha de nacimiento',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtFecha,
              validator: (value) {
                if (value!.isEmpty) {
                  return '* Por favor ingrese sus apellidos';
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Correo electronico',
                  labelText: 'Correo electronico',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtCorreo,
              validator: (value) {
                if (value!.isEmpty) {
                  return '* Por favor ingrese sus apellidos';
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.home),
                  hintText: '',
                  labelText: 'Direccion',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtDireccion,
              validator: (value) {
                if (value!.isEmpty) {
                  return '* Por favor ingrese su direccion';
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: '',
                  labelText: 'Celular',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtTelefono,
              validator: (value) {
                if (value!.isEmpty) {
                  return '* Por favor ingrese su celular';
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 15.0),
                child: Text(
                  'Registrarse',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10.0,
              color: Colors.green[300],
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Regresando a Login...'),
                    backgroundColor: Color.fromARGB(255, 129, 199, 132),
                  ));

                  var usuario = Usuario(
                      id: '',
                      usuarioId: 0,
                      nombreA: txtNombres.text,
                      fechaNaci: int.parse(txtFecha.text),
                      correo: txtCorreo.text,
                      direccion: txtDireccion.text,
                      telefono: int.parse(txtTelefono.text));

                  usuarioProvider.saveUsuario(usuario);

                  Navigator.pushReplacementNamed(
                      context, 'ruta_login');
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
