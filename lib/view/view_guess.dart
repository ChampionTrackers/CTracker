import 'dart:async';

import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/controller/controller_guess.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:flutter/material.dart';

class ViewGuess extends StatefulWidget {
  final String teamAName;
  final String teamBName;
  final String teamAImageUrl;
  final String teamBImageUrl;
  final int matchId;
  final int teamAId;
  final int teamBId;
  final DateTime plannedStartDate;

  const ViewGuess(
      {super.key,
      required this.teamAName,
      required this.teamBName,
      required this.teamAImageUrl,
      required this.teamBImageUrl,
      required this.matchId,
      required this.teamAId,
      required this.teamBId,
      required this.plannedStartDate});

  @override
  State<ViewGuess> createState() => _ViewGuessState();
}

class _ViewGuessState extends State<ViewGuess> {
  double _sliderValue = 0; // Valor inicial do slider
  final _maxValue = 100;
  Timer? _timer;
  late Duration _remainingTime;
  final GuessController _guessController = GuessController();
  int? _selectedTeamId;
  bool _showSlider = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.plannedStartDate.difference(DateTime.now());
    if (_remainingTime.isNegative) {
      _remainingTime = Duration.zero;
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _remainingTime = widget.plannedStartDate.difference(DateTime.now());
          if (_remainingTime.isNegative) {
            _remainingTime = Duration.zero;
            _timer?.cancel();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get formattedRemainingTime {
    if (_remainingTime.isNegative) {
      return "A Começar";
    } else {
      return "${_remainingTime.inHours.toString().padLeft(2, '0')}:${(_remainingTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}";
    }
  }

  void _selectTeam(int teamId) {
    setState(() {
      _selectedTeamId = teamId;
      _showSlider = true;
    });
  }

  void _confirmGuess() async {
    if (_selectedTeamId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione uma equipe primeiro')),
      );
      return;
    }

    try {
      await _guessController.makeGuess(
          widget.matchId, _selectedTeamId!, _sliderValue);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Palpite realizado com sucesso')),
      );
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$error')),
      );
    }
  }

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
                    if (_selectedTeamId == widget.teamAId)
                      SizedBox(
                        height: 50,
                        child: Image.asset('./assets/graphics/baixo-t.png'),
                      ),
                    if (_selectedTeamId != widget.teamAId)
                      const SizedBox(height: 50),
                    const SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: AppColor.secondaryColor,
                      radius: 50,
                      backgroundImage: NetworkImage(widget.teamAImageUrl),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      child: Text(
                        widget.teamAName,
                        style: const TextStyle(
                          color: AppColor.textColor,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                      onPressed: () => _selectTeam(widget.teamAId),
                      icon: const Icon(Icons.add),
                      color: _selectedTeamId == widget.teamAId
                          ? AppColor.accentColor
                          : AppColor.textColor,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
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
                          formattedRemainingTime,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Center(
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
                    if (_selectedTeamId == widget.teamBId)
                      SizedBox(
                        height: 50,
                        child: Image.asset('./assets/graphics/baixo-t.png'),
                      ),
                    if (_selectedTeamId != widget.teamBId)
                      const SizedBox(height: 50),
                    const SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: AppColor.secondaryColor,
                      radius: 50,
                      backgroundImage: NetworkImage(widget.teamBImageUrl),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      child: Text(
                        widget.teamBName,
                        style: const TextStyle(
                          color: AppColor.textColor,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                      onPressed: () => _selectTeam(widget.teamBId),
                      icon: const Icon(Icons.add),
                      color: _selectedTeamId == widget.teamBId
                          ? AppColor.accentColor
                          : AppColor.textColor,
                      iconSize: 50,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            if (_showSlider)
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
                      inactiveColor:
                          AppColor.secondAccentColor.withOpacity(0.3),
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
                      onPressed: _confirmGuess,
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
