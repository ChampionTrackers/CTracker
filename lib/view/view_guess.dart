import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:flutter/material.dart';

class ViewGuess extends StatefulWidget {
  const ViewGuess({super.key});
  @override
  State<ViewGuess> createState() => _ViewGuessState();
}

class _ViewGuessState extends State<ViewGuess> {
  double _sliderValue = 0; // Valor inicial do slider
  final _maxValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TrackerAppBar(),
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'Faça seu Palpite',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Escolha a equipe ganhadora:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Image.asset('./assets/graphics/baixo-t.png'),
                    ),
                    const SizedBox(height: 10),
                    const CircleAvatar(
                      backgroundColor: AppColor.secondaryColor,
                      radius: 50,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '[time1]',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      color: AppColor.textColor,
                      iconSize: 50,
                    )
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: AppColor.tertiaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  margin: const EdgeInsets.only(top: 60, bottom: 0),
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'VS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          '00:33:54',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Tempo restante',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 60),
                    const CircleAvatar(
                      backgroundColor: AppColor.secondaryColor,
                      radius: 50,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '[time2]',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      color: AppColor.textColor,
                      iconSize: 50,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.tertiaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: 60,
                      child: Image.asset('./assets/images/coin.png')),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Insira a quantidade de CTCoins',
                    style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Valor: ',
                        style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        width: 50,
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            '\$${_sliderValue.toStringAsFixed(0)}',
                            style: const TextStyle(
                                color: AppColor.secondAccentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: _maxValue.toDouble(),
                    divisions: 100,
                    activeColor: AppColor.secondAccentColor,
                    inactiveColor: AppColor.secondAccentColor.withOpacity(0.3),
                    onChanged: (double value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '0',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          _maxValue.toString(),
                          style: const TextStyle(
                            color: AppColor.textColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColor.primaryColor, // Cor de fundo do botão
                      foregroundColor: Colors.white, // Cor do texto do botão
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Borda do botão
                      ),
                    ),
                    child: const Text(
                      'Confirmar Palpite',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
