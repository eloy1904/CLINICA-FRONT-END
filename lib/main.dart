

import 'package:flutter/material.dart';
import 'package:flutter_application_clinica/providers/historial_provider.dart';
import 'package:flutter_application_clinica/providers/pagos_provider.dart';
import 'package:flutter_application_clinica/providers/usuario_provider.dart';
import 'package:flutter_application_clinica/screens/historial_form_screen.dart';
import 'package:flutter_application_clinica/screens/historial_screen.dart';
import 'package:flutter_application_clinica/screens/pagos_form_screen.dart';
import 'package:flutter_application_clinica/screens/registro_form_screen.dart';
import 'package:flutter_application_clinica/screens/pagos_screen.dart';
import 'package:flutter_application_clinica/screens/principal_screen.dart';
import 'package:flutter_application_clinica/screens/reporte_screen.dart';
import 'package:provider/provider.dart';

import 'screens/login_clinica.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS APP',
      initialRoute: 'ruta_login',// POR DEFECTO LLAMA A LA RUTA LOGIN
      routes: {
        'ruta_login': (_) => LoginScreen(),// INTEGRANTE 1
        'ruta_principal': (_) => PrincipalScreen(),// INTEGRANTE 2
        'ruta_productos': (_) => ProductoScreen(),// INTEGRANTE 3
        'ruta_productos_form': (_) => ProductoFormScreen(),// INTEGRANTE 3
      },
    );
    */
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider(),lazy: false),
        ChangeNotifierProvider(create: (_) => PagosProvider(),lazy: false),
         ChangeNotifierProvider(create: (_) => HistorialProvider(), lazy: false),
        
        //ChangeNotifierProvider(create: (_) => CuentaProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POS APP',
        initialRoute: 'ruta_login', // POR DEFECTO LLAMA A LA RUTA LOGIN
        routes: {
          'ruta_login': (_) => LoginClinica(), //Cesar
          'ruta_registro_form': (_) => RegistroFormScreen(), //Cesar
          'ruta_principal': (_) => PrincipalScreen(),
          'ruta_pagos': (_) => PagosScreen(), // Eloy
          'ruta_pagos_form': (_) => PagosFormScreen(), // Eloy
          'ruta_historial': (_) => HistorialScreen(),
          'ruta_historial_form': (_) => HistorialFormScreen(),
          'ruta_reporte': (_) => reportScreen()
        },
      ),
    );
  }
}
        