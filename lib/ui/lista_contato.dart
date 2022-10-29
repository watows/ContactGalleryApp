import 'package:flutter/material.dart';
import 'package:galeria_contatos_app/models/contatos.dart';
import 'package:galeria_contatos_app/ui/detalhes_contato.dart';
import 'package:galeria_contatos_app/ui/widgets/cards.dart';
import 'package:galeria_contatos_app/ui/widgets/perspectiva.dart';

class ListaContato extends StatefulWidget {
  const ListaContato({super.key});

  @override
  ListaContatoState createState() => ListaContatoState();
}

class ListaContatoState extends State<ListaContato> {
  int? _visibleItems;
  double? _itemExtent;

  @override
  void initState() {
    _visibleItems = 8;
    _itemExtent = 270.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('GALERIA DE CONTATOS'),
      ),
      body: PerspectivaLista(
        visualizedItems: _visibleItems,
        itemExtent: _itemExtent,
        initialIndex: 7,
        enableBackItemsShadow: true,
        backItemsShadowColor: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(10),
        onTapFrontItem: (index) {
          final cor = Colors.accents[index! % Colors.accents.length];
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (_) => DetalhesContato(
                contato: Contato.contatos[index],
                cor: cor,
              ),
            ),
          );
        },
        children: List.generate(Contato.contatos.length, (index) {
          final corBorda = Colors.accents[index % Colors.accents.length];
          final contato = Contato.contatos[index];
          return ContatoCard(
            corBorda: corBorda,
            contato: contato,
          );
        }),
      ),
      //---------------------------------------
      // Pasta
      //---------------------------------------
      drawer: Drawer(
        child: Material(
          textStyle: const TextStyle(color: Colors.white, fontSize: 16),
          child: Container(
            color: const Color(0xFF5B4382),
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //----------------------------
                  // Título Pasta
                  //----------------------------
                  Row(
                    children: const [
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        ' Settings',
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 40),
                  //----------------------------
                  // Controle de Itens
                  //----------------------------
                  Row(
                    children: [
                      const Icon(
                        Icons.visibility_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                      const Text(
                        ' Visible items',
                        style: TextStyle(),
                      ),
                      Expanded(
                        child: Slider(
                          value: _visibleItems!.toDouble(),
                          min: 1,
                          max: 15,
                          divisions: 15,
                          label: '$_visibleItems',
                          activeColor: Colors.deepPurple[200],
                          inactiveColor: Colors.deepPurple[400],
                          onChanged: (value) {
                            setState(() {
                              _visibleItems = value.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const Divider(height: 40),
                  //----------------------------
                  // Extensão de Itens
                  //----------------------------
                  Row(
                    children: [
                      const Icon(
                        Icons.widgets,
                        color: Colors.white,
                        size: 16,
                      ),
                      const Text(
                        ' Item Extent',
                        style: TextStyle(),
                      ),
                      Expanded(
                        child: Slider(
                          value: _itemExtent!,
                          min: 270,
                          max: MediaQuery.of(context).size.height * .8,
                          label: '$_itemExtent',
                          activeColor: Colors.deepPurple[200],
                          inactiveColor: Colors.deepPurple[400],
                          onChanged: (value) {
                            setState(() {
                              _itemExtent = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const Divider(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
