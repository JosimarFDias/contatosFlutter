import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PageContatos extends StatefulWidget {
  @override
  _PageContatosState createState() {
    return _PageContatosState();
  }
}

class _PageContatosState extends State<PageContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contatos')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('contatos').orderBy('nome').snapshots(),
      builder: (context, snapshot){
        if (!snapshot.hasData) return CircularProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      }
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Contato.fromSnapshot(data);

    return ListTile(
      key: ValueKey(record.reference.documentID),
      leading: new CircleAvatar(backgroundImage: new NetworkImage(record.fotoPerfil)),
      title: new Text(record.nome),
      subtitle: new Text(record.sobrenome),
      onTap: () => {},
    );
  }
}

class Contato {
  final String nome;
  final String sobrenome;
  final String celular;
  final String email;
  final String fotoPerfil;
  final DocumentReference reference;

  Contato.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['nome'] != null),
       assert(map['sobrenome'] != null),
       assert(map['celular'] != null),
       assert(map['email'] != null),
       assert(map['fotoPerfil'] != null),
       nome = map['nome'],
       sobrenome = map['sobrenome'],
       celular = map['celular'],
       email = map['email'],
       fotoPerfil = map['fotoPerfil'];

  Contato.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$nome:$sobrenome:$celular:$email:$fotoPerfil>";
}
