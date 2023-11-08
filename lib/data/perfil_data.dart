import 'package:flutter/material.dart';
import 'package:teste_telas/model/profile/perfil_usuario_model.dart';


final PerfilUsuario perfilUsuario = PerfilUsuario(
  nomeUsuario: 'Lula Molusco',
  fotoPerfil: AssetImage('images/foto.png'),
  viagensAnteriores: [],
  orcamentoViagem: 5000.0,
  interesses: [Interesse.cultura, Interesse.descobertas],
  metasViagem: [MetaViagem.descobrir, MetaViagem.relaxar],
);
