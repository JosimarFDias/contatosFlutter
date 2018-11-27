import 'package:json_annotation/json_annotation.dart';

part 'contato.g.dart';

@JsonSerializable(nullable: false)
class Contato {
  final String nome;
  final String sobrenome;
  final String celular;
  final String email;
  final String fotoPerfil;
  Contato({this.nome, this.sobrenome, this.celular, this.email, this.fotoPerfil});
  factory Contato.fromJson(Map<String, dynamic> json) => _$ContatoFromJson(json);
  Map<String, dynamic> toJson() => _$ContatoToJson(this);
}