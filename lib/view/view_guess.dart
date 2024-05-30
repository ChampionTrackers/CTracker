import 'package:flutter/material.dart';
 
class ViewGuess extends StatefulWidget {
  const ViewGuess({super.key});
  @override
  State<ViewGuess> createState() => _ViewGuessState();
}
 
class _ViewGuessState extends State<ViewGuess> {
 
  @override
  Widget build(BuildContext context) {
                   
  return Container(
  color: const Color.fromRGBO(10, 9, 45, 1), 
  child: SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                   child: const Center(
                     child: Text(
                        'Faça seu Palpite',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center, // Centraliza o texto horizontalmente
                      ),
                    ),                                
                  ), 

                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),                               
                      child: const Center(
                        child: Text(
                          'Escolha a equipe ganhadora:',
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            ),
                            textAlign: TextAlign.center, 
                          ),
                        ),                                
                      ),            

                              
                ClipRect(                  
                  child: Row(                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [                     
                      Container(
                        margin: const EdgeInsets.only(top: 60, bottom: 0),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(46, 56, 86, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),

                            Container(
                                margin: const EdgeInsets.only(top: 60, bottom: 0),
                                height: 70,
                                width: 150,                                                  
                                child: const Center(
                                  child: Text(
                                    'VS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                    textAlign: TextAlign.center, 
                                  ),
                                ),
                              ),

                                      Container(
                                        margin: const EdgeInsets.only(top: 60, bottom: 0),
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(46, 56, 86, 1),
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),

                    ],
                  ),
                ),

                ClipRect(                  
                  child: Row(                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [                     
                      Container(
                        margin: const EdgeInsets.only(top: 0, bottom: 20),
                        height: 100,
                        width: 100,
                        child: const Center(
                          child: Text(
                            '[time 1]',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              ),
                            textAlign: TextAlign.center, 
                          ),
                        ),
                      ),
                            
                                      Container(
                                        margin: const EdgeInsets.only(top: 0, bottom: 20),
                                        height: 100,
                                        width: 100,
                                        child: const Center(
                                          child: Text(
                                            '[time 2]',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.center, 
                                          ),
                                        ),
                                      ),
                    ],
                  ),
                ),

                 ClipRect(                  
                  child: Row(                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [                     
                      Container(
                        margin: const EdgeInsets.only(top: 0, bottom: 20),
                        height: 40,
                        width: 100,
                        child: const Center(
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              ),
                            textAlign: TextAlign.center, 
                          ),
                        ),
                      ),
                            
                                      Container(
                                        margin: const EdgeInsets.only(top: 0, bottom: 20),
                                        height: 40,
                                        width: 100,
                                        child: const Center(
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                            ),
                                            textAlign: TextAlign.center, 
                                          ),
                                        ),
                                      ),
                    ],
                  ),
                ),

                ClipRect(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(top:40, bottom: 20),
          height: 250,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(46, 56, 86, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          // ignore: prefer_const_constructors
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Insira a quantidade de CTcoins',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
             /* const SizedBox(height: 20),               
                PriceSlider(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondAccentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Adicionar'),
                ),*/
              ],
            ),
          ),
        ),
      ),
    ],
  ),
),


/*
             class PriceSlider extends StatefulWidget {
              @override
            _PriceSliderState createState() => _PriceSliderState();
          }

              class _PriceSliderState extends State<PriceSlider> {
                double _currentPrice = 50;

                @override
                Widget build(BuildContext context) {
                  return Column(
                    children: [
                      Text(
                        'Preço: \$${_currentPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Slider(
                        value: _currentPrice,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: _currentPrice.toStringAsFixed(2),
                        onChanged: (double value) {
                          setState(() {
                            _currentPrice = value;
                          });
                        },
                      ),
                    ],
                  );
                }
              }
*/
               
              ],
            ),
  ),
);



}
}       