import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text(''),
            
            decoration: BoxDecoration(
              
                color: Color.fromARGB(139, 67, 160, 72),
                image: DecorationImage(
                    image: AssetImage('assets/login.jpeg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            iconColor: Colors.green[600],
            leading: Icon(Icons.home),
            title: const Text('Principal'),
            hoverColor: Colors.green[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_principal');
            },
          ),
          ListTile(
            iconColor: Colors.green[600],
            leading: Icon(Icons.calendar_month),
            title: const Text('Citas'),
            hoverColor: Colors.green[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_cita');
            },
          ),
          ListTile(
            iconColor: Colors.green[600],
            leading: Icon(Icons.assignment_ind_outlined),
            title: const Text('Historial'),
            hoverColor: Colors.green[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_historial');
            },
          ),
          ListTile(
            iconColor: Colors.green[600],
            leading: Icon(Icons.payment),
            title: const Text('Pagos'),
            hoverColor: Colors.green[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_pagos');
            },
          ),
          ListTile(
            iconColor: Colors.green[600],
            leading: Icon(Icons.payment),
            title: const Text('Reportes'),
            hoverColor: Colors.green[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporte');
            },
          ),
          Divider(),
          ListTile(
            iconColor: Colors.green[600],
            leading: Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            hoverColor: Colors.green[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_login');
            },
          ),
        ],
      ),
    );
  }
}