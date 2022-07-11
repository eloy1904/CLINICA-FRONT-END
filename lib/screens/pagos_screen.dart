import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_clinica/models/pagos.dart';
import 'package:flutter_application_clinica/providers/pagos_provider.dart';
import 'package:flutter_application_clinica/search/pagos_search_delegate.dart';
import 'package:flutter_application_clinica/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';


class PagosScreen extends StatefulWidget{
  @override
  createState() => _PagosScreen();
}

class _PagosScreen extends State<PagosScreen>{
  @override
  Widget build(BuildContext context) {

    final pagosProvider = Provider.of<PagosProvider>(context);
    final List<Pago> listaPagos = pagosProvider.listaPagos;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pagos'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context: context, 
                delegate: PagoSearchDelegate(listaPagos)
              );
            },// PENDIENTE
          )
        ],
      ),
      
      
      drawer: const MenuLateral(),
      body: Container(
        width: double.infinity,
        height: size.height * 0.9,
        color: Colors.white,
        child: Swiper(
          itemCount: listaPagos.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.5,
          itemBuilder: (BuildContext context, int index) {
            return _EtiquetaPago(listaPagos[index]);
          },
        ),
      ),



      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, 'ruta_pagos_form');
        },
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}

class _EtiquetaPago extends StatelessWidget {
  final Pago pago;
  _EtiquetaPago(this.pago);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: Colors.white),
      child: ListTile(
        title: Text(pago.nomUsuario,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
        subtitle: Text(pago.numTarje,
        style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.indigo),),
        leading: CircleAvatar(
          child: Text(pago.nomUsuario.substring(0, 1)),
          backgroundColor: Color.fromARGB(255, 129, 199, 132),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'ruta_pagos_form',
                arguments: pago);
          },
        ),
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final Pago pago;
  _ImagenFondo(this.pago);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 100,
        
      ),
    );
  }
}
