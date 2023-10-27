import 'package:flutter/material.dart';
import 'package:teste_telas/model/profile/perfil_usuario_model.dart';


final PerfilUsuario perfilUsuario = PerfilUsuario(
  nomeUsuario: 'Lula Molusco',
  fotoPerfil: AssetImage('images/foto.png'), // Substitua pela URL da foto de perfil
  viagensAnteriores: [], // Uma lista vazia ou com as viagens anteriores
  orcamentoViagem: 5000.0, // Substitua pelo valor desejado
  interesses: [Interesse.cultura, Interesse.descobertas],
  metasViagem: [MetaViagem.descobrir, MetaViagem.relaxar],
);
