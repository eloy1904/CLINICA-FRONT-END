import 'package:flutter/material.dart';
import 'package:flutter_application_clinica/models/pagos.dart';

class PagoSearchDelegate extends SearchDelegate<Pago> {
  final List<Pago> listaPagos;

  PagoSearchDelegate(this.listaPagos);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear,color: Colors.blueAccent,),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back,color: Colors.blueAccent,),
      onPressed: () {
        close(
            context,
            Pago(
                id: '',
                pagoId: 0,
                nomUsuario: '',
                numTarje: '',
                fecha: '',
                clave: 0,
                categoria: '',)
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final listaFiltrada = query.isEmpty ? 
                          listaPagos :
                          listaPagos.where(
                            (pago) => pago.nomUsuario.toLowerCase().contains(query.toLowerCase())
                          ).toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index){
        return _cardPago(listaFiltrada[index], context);  
      },
    );
  }
}

Widget _cardPago(Pago pagoFiltrado, context){
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
          child: Text(pagoFiltrado.nomUsuario.substring(0, 1)),
          backgroundColor: Color.fromARGB(255, 129, 199, 132),
        ),

          title: Text(pagoFiltrado.nomUsuario),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.pushNamed(context, 'ruta_pagos_form', 
              arguments: pagoFiltrado
            );
          },
        )
      ],
    ),
  );
}
