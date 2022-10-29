import 'package:flutter/material.dart';
import 'package:galeria_contatos_app/models/contatos.dart';
import 'package:galeria_contatos_app/ui/widgets/cards.dart';

class DetalhesContato extends StatelessWidget {
  const DetalhesContato({
    super.key,
    required this.contato,
    required this.cor,
  });

  final Contato contato;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contato.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: ContatoCard(
            contato: contato,
            corBorda: cor,
          ),
        ),
      ),
    );
  }
}
