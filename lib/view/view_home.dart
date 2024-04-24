import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Seus Torneios',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // ação para o botão "Ver mais"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondAccentColor,
                      textStyle: const TextStyle(color: AppColor.textColor, fontWeight:FontWeight.bold),
                    ),
                    child: const Text('Ver mais'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView(
                padding: const EdgeInsets.only(left: 20), // Margem à esquerda
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard(
                    'assets/images/CSGO.jpg',
                    'Counter-Strike: GO',
                  ),
                  _buildCard(
                    'assets/images/Sword.png',
                    'Sword Fighting',
                  ),
                  _buildCard(
                    'assets/images/TFT.jpg',
                    'Teamfight Tactics',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            const MyTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
  String imagePath,
  String title,
) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0), // Adicionando margem apenas na parte superior
    child: Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      color: const Color.fromRGBO(46, 56, 86, 1),
      child: SizedBox(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 100,
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(color: AppColor.textColor, fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.gamepad, color: AppColor.textColor),
                        SizedBox(width: 5),
                        Text('CS:GO', style: TextStyle(color: AppColor.textColor)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Icon(Icons.location_on, color: AppColor.textColor),
                        SizedBox(width: 5),
                        Text('Virtual', style: TextStyle(color: AppColor.textColor)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Icon(Icons.calendar_today, color: AppColor.textColor),
                        SizedBox(width: 5),
                        Text('Data: 10/05/2024', style: TextStyle(color: AppColor.textColor)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Icon(Icons.people, color: AppColor.textColor),
                        SizedBox(width: 5),
                        Text('Participantes: 10', style: TextStyle(color: AppColor.textColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
  }

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Seus Jogos',
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 10),
          Table(
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: AppColor.primaryColor,
                      alignment: Alignment.center,
                      child: const Text(
                        'TIPO',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: AppColor.primaryColor,
                      alignment: Alignment.center,
                      child: const Text(
                        'NOME DO TORNEIO',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: AppColor.tertiaryColor,
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monitor,
                            color: AppColor.textColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      color: AppColor.tertiaryColor,
                      alignment: Alignment.center,
                      child: const Text(
                        'Pro League Free Fire',
                        style: TextStyle(color: AppColor.textColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}