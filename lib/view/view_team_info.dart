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
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            decoration: const BoxDecoration(
                              color: AppColor.tertiaryColor,
                            ),
                            child: Column(
                              children: [
                                const Expanded(
                                  child: TeamDropdown(),
                                ),
                                Container(
                                  height: 1,
                                  color: AppColor.accentColor,
                                ),
                              ],
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

class TeamDropdown extends StatefulWidget {
  const TeamDropdown({super.key});

  @override
  TeamDropdownState createState() => TeamDropdownState();
}

class TeamDropdownState extends State<TeamDropdown> {
  String selectedTeam = 'The Bitter Rangers';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedTeam,
      dropdownColor: AppColor.tertiaryColor,
      decoration: const InputDecoration(
         prefixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 40),
         ),
      // icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30),
      iconSize: 0,
      elevation: 16,
      isExpanded: true,
      // underline: Container(),
      style: const TextStyle(color: Colors.white),
      onChanged: (String? newValue) {
        setState(() {
          selectedTeam = newValue!;
        });
      },
      items: <String>['The Bitter Rangers', "CPI's Hurricane", 'None at None']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
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
