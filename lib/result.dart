import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  const Result({Key? key,
    required this.result,
    required this.isMale,
    required this.age}) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase{
    String resulText='';
    if(result >= 30) {
      resulText = 'Obese';
    } else if(result > 25 && result < 30) {
      resulText = 'Overweight';
    } else if(result >= 18.5 && result <= 24.9) {
      resulText = 'Normal';
    } else {
      resulText = 'Thin';
    }
    return resulText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ruslts',
        style: TextStyle(
            fontSize: 30,
            color: Colors.white54),
      )),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

                Padding(
                  padding: EdgeInsets.fromLTRB(50, 70, 100, 0),
                  child: Text('Healthness : ${resultPhrase}',
                  style:Theme.of(context).textTheme.headline1,
                  )
                ), Padding(
                   padding: EdgeInsets.fromLTRB(20, 20, 150, 0),
                     child: Text('Gender : ${isMale? 'Male':'Female'}',
                        style: Theme.of(context).textTheme.headline1
                         )
                   ),
                    Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 150, 0),
                      child: Text('BMI : ${result.toStringAsFixed(2)}',
                        style:Theme.of(context).textTheme.headline1),
                    ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 190, 100),
                  child: Text('Age : $age',
                    style: Theme.of(context).textTheme.headline1),
                )
                ],

        ),
      ),),
    );
  }
}
