import 'package:flutter/material.dart';
import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/constants/texts.dart';

class ViewWelcome extends StatefulWidget {
  const ViewWelcome({super.key});

  @override
  State<ViewWelcome> createState() => _ViewWelcomeState();
}

class _ViewWelcomeState extends State<ViewWelcome> {
  late PageController _pageController;
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> slides = AppTexts.welcomeItems
      .map(
        (item) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.fitWidth,
                  width: 220.0,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              const SizedBox(
                  height:
                      30.0), // Adiciona espaçamento de 20.0 entre a imagem e a descrição
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        item['descrição'],
                        style: const TextStyle(
                          color: AppColor.textColor,
                          letterSpacing: 1.2,
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
        slides.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: currentPage.round() == index
                ? AppColor.secondaryColor
                : AppColor.secondaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              return slides[index];
            },
          ),
          if (currentPage.round() ==
              slides.length - 1) // Verifica se está na última página
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 200.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Ação do botão na última página
                    // print('Botão na última página pressionado');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColor.primaryColor, // Cor de fundo do botão
                    foregroundColor: Colors.white, // Cor do texto do botão
                    shape: RoundedRectangleBorder(
                      borderRadius:
                        BorderRadius.circular(20.0), // Borda do botão
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      'Continuar',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 70.0),
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
