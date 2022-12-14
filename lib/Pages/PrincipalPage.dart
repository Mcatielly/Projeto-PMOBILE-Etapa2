import 'package:flutter/material.dart';
import 'package:flutter_application_1/Domain/Cards.dart';
//import 'package:flutter_application_1/Domain/Cards.dart';
import 'package:flutter_application_1/Widget/card_unidades.dart';
//import 'package:flutter_application_1/SecondPage.dart';
import 'package:flutter_application_1/Banco/BD.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return buildCard();
  }

  buildCard() {
    var futureBuilder = FutureBuilder<List<Cards>>(
      future: BD.getValues(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Cards> lista = snapshot.data ?? [];

          return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return CardUnidades(
                    card: lista[index],
                    color: const Color(0xFFFFFBF0),
                    cor: Colors.black,
                  );
                } else {
                  return CardUnidades(
                    card: lista[index],
                    color: const Color(0xFF46707B),
                    cor: const Color(0xFFFFFBF0),
                  );
                }
              });
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 16, right: 10, bottom: 0),
      child: futureBuilder,
    );
  }
  /* builBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ListView(
        children: const [
          SizedBox(height: 12),
          
        ]
      ),  
    );   
  }*/
}
