import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/pag_ubs.dart';
import 'package:flutter_application_1/Domain/var_ubs.dart';
import 'package:flutter_application_1/Banco/BDSecondPage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05A4AB),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF05A4AB),
      ),
      body: buildCard(),
    );
  }

  buildCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: FutureBuilder<List<VarUbs>>(
        future: BDSecondPage.getValues(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<VarUbs> lista = snapshot.data ?? [];

            return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return PagUbs(
                      varUbs: lista[index],
                      color: const Color(0xFFFFFBF0),
                      cor: Colors.black,
                    );
                  } else {
                    return PagUbs(
                      varUbs: lista[index],
                      color: const Color(0xFF46707B),
                      cor: const Color(0xFFFFFBF0),
                    );
                  }
                });
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
