import 'package:flutter/material.dart';

class LoginClinica extends StatefulWidget {
  @override
  createState() => _LoginClinica();
}

class _LoginClinica extends State<LoginClinica> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Clinica Jerusalen'),
        backgroundColor: Colors.green[300],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                //Al momento de escribir, se acomode la pantalla con el teclado
                child: Image.asset(
                  'assets/login.jpeg',
                  height: 100.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextFormField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextFormField(),
              SizedBox(
                height: 15.0,
              ),
              _bottonLogin(),
              SizedBox(
                height: 15.0,
              ),
              _bottonRegistro(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextFormField() {
    final txtUser = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Ingrese su usuario',
          labelText: 'Usuario',
        ),
        controller: txtUser,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, ingresa un usuario';
          }
        },
      ),
    );
  }

  Widget _passwordTextFormField() {
    final txtPass = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline),
          hintText: 'Ingrese su contraseña',
          labelText: 'Contraseña',
        ),
        controller: txtPass,
        validator: (value) {
          if (value!.length < 3) {
            return 'La contraseña debe tener mínimo 3 caracteres';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Iniciar sesión',
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
              Navigator.pushReplacementNamed(context, 'ruta_principal');
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Ingresando...'),
                backgroundColor: Color.fromARGB(255, 129, 199, 132),
              ));
            }
            
          });
          
    });
  }

  _bottonRegistro() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
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
            Navigator.pushReplacementNamed(context, 'ruta_registro_form');
          });
    });
  }
}
