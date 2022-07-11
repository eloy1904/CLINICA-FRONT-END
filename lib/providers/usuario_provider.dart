import 'dart:io';

import 'package:flutter_application_clinica/models/usuario.dart';
import 'package:flutter_application_clinica/models/usuario_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UsuarioProvider extends ChangeNotifier {
  String _baseUrl = '192.168.100.93:3999';

  List<Usuario> listaUsuarios = [];

  UsuarioProvider() {
    print('Ingresando a UsuarioProvider');
    this.getOnUsuarioList();
  }

  getOnUsuarioList() async {
    var url = Uri.http(_baseUrl, '/api/usuarios', {});
    final response = await http.get(url);
    print(response.body);
    final usuarioResponse = UsuarioResponse.fromJson(response.body);
    listaUsuarios = usuarioResponse.usuarios;
    notifyListeners();
  }

  saveUsuario(Usuario usuario) async {
    var url = Uri.http(_baseUrl, '/api/usuarios/save');
    print(usuario.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: usuario.toJson());
    print(response.body);
    getOnUsuarioList();
    notifyListeners();
  }
}
