import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String resultText;
  final String resultMessage;

  ResultPage(
      {@required this.bmi,
      @required this.resultText,
      @required this.resultMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: Color(0xFF1D1F33),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Text(
                        resultText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          bmi.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 85.0,
                            letterSpacing: 7.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(35.0, 20.0, 25.0, 25.0),
                      child: Center(
                        child: Text(
                          resultMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 60.0,
              margin: EdgeInsets.only(top: 25.0),
              color: Color(0xFFEA1456),
              child: Center(
                child: Text(
                  'RECALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
