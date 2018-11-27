part of 'contato.dart';

Contato _$ContatoFromJson(Map<String, dynamic> json) {
  return Contato(
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      celular: json['celular'] as String,
      email: json['email'] as String,
      fotoPerfil: json['fotoPerfil'] as String);
      //dateOfBirth: DateTime.parse(json['dateOfBirth'] as String));
}

Map<String, dynamic> _$ContatoToJson(Contato instance) => <String, dynamic>{
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'celular': instance.celular,
      'email': instance.email,
      'fotoPerfil': instance.fotoPerfil
      //'dateOfBirth': instance.dateOfBirth.toIso8601String()
    };