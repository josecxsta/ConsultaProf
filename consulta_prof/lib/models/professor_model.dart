class ProfessorModel {
  final int id;
  final String nome;
  final double mediaDidatica;
  final int mediaCoerencia;
  final int mediaPontualidade;
  final int mediaGenteBoa;
  final int mediaCursariaNovamente;

  ProfessorModel({
    this.mediaDidatica,
    this.mediaCoerencia,
    this.mediaPontualidade,
    this.mediaGenteBoa,
    this.mediaCursariaNovamente,
    this.id,
    this.nome,
  });
}
