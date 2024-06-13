import 'package:flutter/material.dart';
import 'package:ctracker/constants/colors.dart';

void main() {
  runApp(const ViewTeamInfo());
}

class ViewTeamInfo extends StatelessWidget {
  const ViewTeamInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.tertiaryColor,
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.accentColor,
                          width: 1,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        // Envolver PopupMenuButton em um Container para controlar a largura
                        SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.7, // Largura responsiva
                          child: PopupMenuButton<String>(
                            color: AppColor.tertiaryColor,
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'Option 1',
                                child: Container(
                                  // decoration: const BoxDecoration(
                                  //   border: Border(
                                  //     bottom: BorderSide(
                                  //       color: AppColor.accentColor,
                                  //       width: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                  child: const Text(
                                    'The Bitter Rangers',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Option 2',
                                child: Container(
                                  // decoration: const BoxDecoration(
                                  //   border: Border(
                                  //     bottom: BorderSide(
                                  //       color: AppColor.accentColor,
                                  //       width: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                  child: const Text(
                                    "CPI's Hurricane",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Option 3',
                                child: Container(
                                  // decoration: const BoxDecoration(
                                  //   border: Border(
                                  //     bottom: BorderSide(
                                  //       color: AppColor.accentColor,
                                  //       width: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                  child: const Text(
                                    'None at None',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: const Row(
                                children: [
                                  Icon(Icons.keyboard_arrow_down,
                                      color: Colors.white, size: 30),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'The Bitter Rangers',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 42),
                  const Center(
                    child: SizedBox(
                      width: 113,
                      height: 113,
                      child: CircleAvatar(
                        backgroundColor: AppColor.backgroundColor,
                        backgroundImage:
                            AssetImage('assets/images/Team1Icon.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 27),
                  const Center(
                    child: Text(
                      'The Bitter Rangers',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Center(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultrices odio a nisl venenatis gravida. Integer hendrerit ultricies nisl, ut viverra quam tempor sed. Praesent sem quam, lobortis eu nunc eu, lacinia.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  const Center(
                    child: Text(
                      '3 Jogadores',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const PlayerCard(
                    imagePath: 'assets/images/Aniranha.png',
                    playerName: 'Aniranha',
                  ),
                  const PlayerCard(
                    imagePath: 'assets/images/Jayne.png',
                    playerName: 'Jayne',
                  ),
                  const PlayerCard(
                    imagePath: 'assets/images/Albert.png',
                    playerName: 'Albert Gore',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  final String imagePath;
  final String playerName;

  const PlayerCard({
    super.key,
    required this.imagePath,
    required this.playerName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.tertiaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 29,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 15),
          Text(
            playerName,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
