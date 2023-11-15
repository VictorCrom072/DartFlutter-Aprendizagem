
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
      dtCriacao: map['dt_criacao'],
    );
  }

  @override
  String toString() {
    return 'Usuario(id: $id, nome: $nome, email: $email, senha: $senha, dtCriacao: $dtCriacao)';
  }
}
