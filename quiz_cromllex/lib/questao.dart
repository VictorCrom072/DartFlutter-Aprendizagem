class Questao{
  String? pergunta;
  List respostas = [];
  int? indiceRespCorreta;
  List<Questao> questoes = [];

  getQuestoes(){
    Questao questao1 = Questao();
    questao1.pergunta = "Em que ano se iniciou a segunda guerra mundial?";
    questao1.respostas = ["1965","1945","1914","1939"];
    questao1.indiceRespCorreta = 3;

    Questao questao2 = Questao();
    questao2.pergunta = "Quais eram os países envolvidos na guerra fria?";
    questao2.respostas = ["EUA e China","EUA e URSS","Estados Unidos da America e Brasil","Brasil e Argentina"];
    questao2.indiceRespCorreta = 1;

    Questao questao3 = Questao();
    questao3.pergunta = "Qual foi a principal 'Arma' usuada pelos vietcongues contra o EUA?";
    questao3.respostas = ["Cristiano Ronaldo","Rifles e Explosivos","Túneis de Escavação e Armadilhas","Blindados e Armamento Aéreo"];
    questao3.indiceRespCorreta = 2;

    questoes.add(questao1);
    questoes.add(questao2);
    questoes.add(questao3);

    return questoes;
  }
}
