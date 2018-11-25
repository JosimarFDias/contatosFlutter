import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddContato extends StatelessWidget {
  String nome;
  String sobrenome;
  String celular;
  String email;
  String fotoPerfil;
  DocumentReference reference;

  _saveContato(BuildContext context){
    Map<String, dynamic> dadosContato = new Map<String, dynamic>();
    dadosContato["nome"] = this.nome;
    dadosContato["sobrenome"] = this.sobrenome;
    dadosContato["celular"] = this.celular;
    dadosContato["email"] = this.email;
    dadosContato["fotoPerfil"] = this.fotoPerfil;
    
    Firestore.instance.collection('contatos').add(dadosContato);
    print("instance created");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Adicionar contato"),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {_saveContato(context);},
            child:(
              new Text('SALVAR')
            )
          )
        ]
      ),
      body: new ListView(
        children: <Widget>[
          new TextField(
            autocorrect: false,
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Nome'),
            onChanged: (value) {
              this.nome = value;
            }, 
          ),
          new TextField(
            autocorrect: false,
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Sobrenome'),
            onChanged: (value) {
              this.sobrenome = value;
            }, 
          ),
          new TextField(
            autocorrect: false,
            autofocus: false,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: 'Celular'),
            onChanged: (value) {
              this.celular = value;
            }, 
          ),
          new TextField(
            autocorrect: false,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: 'E-mail'),
            onChanged: (value) {
              this.email = value;
            }, 
          ),
          new TextField(
            autocorrect: false,
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Link foto do perfil'),
            onChanged: (value) {
              this.fotoPerfil = value;
            }, 
          )
        ],
      ),
    );
  }
}