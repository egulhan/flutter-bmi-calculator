import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_with_text.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  var height = 185;
  var weight = 70;
  var age = 30;

  void selectGender(GenderType genderType) {
    setState(() {
      if (genderType == GenderType.male) {
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      } else {
        maleCardColor = kInactiveCardColor;
        femaleCardColor = kActiveCardColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () => selectGender(GenderType.male),
                      color: maleCardColor,
                      child: IconWithText(
                        icon: Icon(FontAwesomeIcons.mars, size: 50.0),
                        text: Text('Male', style: kLabelTextStyle),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () => selectGender(GenderType.female),
                      color: femaleCardColor,
                      child: IconWithText(
                        icon: Icon(FontAwesomeIcons.venus, size: 50.0),
                        text: Text('Female', style: kLabelTextStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ReusableCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text('Height', style: kLabelTextStyle),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      /**
                       * align cm to bottom
                       */
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 25.0,
                        ),
                        thumbColor: Color(0xFFEA1456),
                        overlayColor: Color(0x29EB1515),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF888895),
                      ),
                      child: Slider(
                        min: 1.0,
                        max: 250.0,
                        value: height.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text('Weight', style: kLabelTextStyle),
                          ),
                          Container(
                            child: Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) {
                                      weight--;
                                    }
                                  });
                                },
                              ),
                              SizedBox(width: 5.0),
                              RoundIconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text('Age', style: kLabelTextStyle),
                          ),
                          Container(
                            child: Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) {
                                      age--;
                                    }
                                  });
                                },
                              ),
                              SizedBox(width: 5.0),
                              RoundIconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calculator = CalculatorBrain(
                  weight: weight.toDouble(), height: height.toDouble());

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmi: calculator.calculate(),
                  resultText: calculator.getResultText(),
                  resultMessage: calculator.getResultMessage(),
                );
              }));
            },
            child: Container(
              color: Color(0xFFEA1456),
              width: double.infinity,
              height: 60.0,
              margin: EdgeInsets.only(top: 15.0),
              child: Center(
                  child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
