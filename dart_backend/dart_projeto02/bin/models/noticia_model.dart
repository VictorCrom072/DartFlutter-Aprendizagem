class NoticiaModel {
  final int id;
  final String titulo;
  final String descricao;
  final String imagem;
  final DateTime dtPublicacao;
  final DateTime? dtAtualPublicacao;

  NoticiaModel(
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.dtPublicacao,
    this.dtAtualPublicacao,
  );

  factory NoticiaModel.fromJson(Map map){
    return NoticiaModel(
      map['id'] ?? '',
      map['titulo'],
      map['descricao'],
      map['imagem'],

      DateTime.fromMicrosecondsSinceEpoch(map['dtPublicacao']),

      map['dtAtualPublicacao'] != null
      ? DateTime.fromMicrosecondsSinceEpoch(map['dtAtualPublicacao'])
      : null
    );
  }

  Map toJson(){
    return{
      'id' : id,
      'titulo' : titulo,
      'descricao' : descricao,
      'imagem' : imagem,
    };
  }

  @override
  String toString(){
    return 'NoticiaModel(id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, dtPublicacao: $dtPublicacao, dtAtualPublicacao: $dtAtualPublicacao)'; 
  }
}
