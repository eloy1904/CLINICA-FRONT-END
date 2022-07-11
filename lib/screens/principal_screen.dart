import 'package:flutter/material.dart';
import 'package:flutter_application_clinica/widgets/menu_lateral.dart';

class PrincipalScreen extends StatefulWidget{

  @override
  createState() => _PrincipalScreen();
}

class _PrincipalScreen extends State<PrincipalScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Principal'),
          backgroundColor: Colors.green[300],
        ),
        drawer: const MenuLateral(),
        body:  Center(
          child: Text('Principal'),
        ),
    );
  }
  
}