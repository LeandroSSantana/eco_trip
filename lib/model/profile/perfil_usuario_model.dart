import 'package:flutter/material.dart';

class PerfilUsuario {
  final String nomeUsuario;
  final AssetImage fotoPerfil; // URL da foto de perfil
  final double orcamentoViagem; // Orçamento da viagem
  final List<Interesse> interesses; // Atividades de interesse
  final List<MetaViagem> metasViagem; // Metas de viagem
  final List<Viagem> viagensAnteriores; // Histórico de viagem

  PerfilUsuario({
    required this.nomeUsuario,
    required this.fotoPerfil,
    required this.orcamentoViagem,
    required this.interesses,
    required this.metasViagem,
    required this.viagensAnteriores,
  });
}

class Viagem {
  final double orcamento;
  final List<Interesse> interesses;
  final List<MetaViagem> metasViagem;

  Viagem({
    required this.orcamento,
    required this.interesses,
    required this.metasViagem,
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
  // Adicione outros interesses conforme necessário
}

enum MetaViagem {
  descobrir,
  relaxar,
  agitar,
  // Adicione outras metas de viagem conforme necessário
}
