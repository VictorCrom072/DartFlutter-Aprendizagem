// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usuario {
  final int id;
  final String nome;
  final String email;
  final String senha;
  final DateTime dtCriacao;
  List<Usuario>? usuarios;
  
  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.dtCriacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
      'dtCriacao': dtCriacao.millisecondsSinceEpoch,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] as int,
      nome: map['nome'] as String,
      email: map['email'] as String,
      senha: map['senha'] as String,
      dtCriacao: DateTime.fromMillisecondsSinceEpoch(map['dtCriacao'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) => Usuario.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Usuario(id: $id, nome: $nome, email: $email, senha: $senha, dtCriacao: $dtCriacao)';
  }
}
