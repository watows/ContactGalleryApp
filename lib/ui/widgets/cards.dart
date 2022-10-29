import 'package:flutter/material.dart';
import 'package:galeria_contatos_app/models/contatos.dart';

class ContatoCard extends StatelessWidget {
  const ContatoCard({
    super.key,
    required this.corBorda,
    required this.contato,
  });

  final Color corBorda;
  final Contato contato;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: contato.nome,
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-----------------------------
            // Tabela de Card
            //-----------------------------
            Align(
              heightFactor: .9,
              alignment: Alignment.centerLeft,
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: corBorda,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            //-----------------------------
            // Corpo do Card
            //-----------------------------
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: corBorda,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                //-----------------------------
                // Corpo do Card
                //-----------------------------
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //---------------------------
                      // Nome Profissão
                      //---------------------------
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outlined,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text.rich(
                              TextSpan(
                                text: contato.nome,
                                children: [
                                  TextSpan(
                                    text: '\n${contato.profissao}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5,
                                    ),
                                  )
                                ],
                              ),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //---------------------------
                      // Endereço
                      //---------------------------
                      Row(
                        children: [
                          const Icon(
                            Icons.home_outlined,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            contato.endereco,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple,
                            ),
                          )
                        ],
                      ),
                      //---------------------------
                      // Telefone
                      //---------------------------
                      Row(
                        children: [
                          const Icon(
                            Icons.phone_outlined,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            contato.telefone,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      //---------------------------
                      // E-mail
                      //---------------------------
                      Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    contato.email,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                                Text(
                                  contato.website,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
