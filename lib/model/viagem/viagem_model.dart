class Viagem {
  final double orcamento;
  final EstiloViagem estiloViagem;
  final List<Interesse> interesses;
  final List<MetaViagem> metasViagem;
  final List<String> historicoViagem;

  Viagem({
    required this.orcamento,
    required this.estiloViagem,
    required this.interesses,
    required this.metasViagem,
    required this.historicoViagem,
  });
}

enum EstiloViagem {
  economica,
  moderada,
  luxuosa,
}

enum Interesse {
  esportes,
  cultura,
  aoArLivre,
  descobertas,
  // Adicionar outros interesses conforme necessário
}

enum MetaViagem {
  descobrir,
  relaxar,
  agitar,
  // Adicionar outras metas de viagem conforme necessário
}
