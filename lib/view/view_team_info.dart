import 'package:flutter/material.dart';
import 'package:ctracker/constants/colors.dart';

void main() {
  runApp(const TeamInfo());
}

class TeamInfo extends StatelessWidget {
  const TeamInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 29, vertical: 29),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Icon(
                            Icons
                                .keyboard_arrow_down, 
                            size: 25,
                            color: Colors.white, 
                          ),
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'The Bitter Rangers',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 42),
                  Center(
                    child: SizedBox(
                      width: 113,
                      height: 113,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/Team1Icon.png',
                          fit: BoxFit.cover,
                        ),
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
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              imagePath,
              width: 58,
              height: 58,
              fit: BoxFit.cover,
            ),
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
