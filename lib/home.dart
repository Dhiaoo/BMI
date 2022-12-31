import 'package:flutter/material.dart';
import 'result.dart';
import 'dart:math';
class MyhomePage extends StatefulWidget {
   MyhomePage({Key? key}) : super(key:key);

  final String title='home';

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}
class _MyhomePageState extends State<MyhomePage>{
  bool isMale=true;
  double heigh=170;

  int weight= 55;
  int age= 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title,),
          centerTitle: true,
        ),
        body:SafeArea(
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          expand(context,'male'),
                          const SizedBox(width: 15),
                          expand(context,'female')
                        ],

                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey
                        ),
                        child: Column(
                          children: [
                            Text('Height',
                                style:Theme.of(context).textTheme.headline2 ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text('${heigh.toStringAsFixed(2)}',
                                  style:Theme.of(context).textTheme.headline1 ,),
                                const Text('Cm',
                                  style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            Slider(
                                min: 90,
                                max: 220,
                                value: heigh,
                                onChanged: (val)=> setState(() => heigh = val )
                            )
                          ],
                        ),

                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          expand2(context, 'age'),
                          SizedBox(width: 15),
                          expand2(context, 'weight'),

                        ]

                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/15,
                    width:double.infinity,
                    color: Colors.teal,
                    child: TextButton(

                      onPressed: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Result(result: weight / pow(heigh/100, 2), isMale: isMale, age: age))

                      );}


                       ,child: Text('Calculate',
                          style: Theme.of(context).textTheme.headline1),
                    ),
                  )
                ]

              ),
        )
        );



  }

  Expanded expand(BuildContext context, String type) {
    return Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  isMale= type=='male'? true:false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (isMale&&type=='male')||(!isMale&&type=='female')?  Colors.teal : Colors.blueGrey
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Icon(type=='male'?Icons.male:Icons.female,
                    size: 90,),
                    SizedBox(height: 15),
                    Text(type=='male'? 'Male':'Female',
                        style: Theme.of(context).textTheme.headline2)

                  ],
                ),
              ),
            ),
          );
  }
  Expanded expand2(BuildContext context, String type) {
    return Expanded(
          child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(type=='age'?'Age':'Weight',
              style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: 15),
              Text(type=='age'? '$age':'$weight',
                  style: Theme.of(context).textTheme.headline1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: (){
                      setState(() {
                        type=='age'? age--: weight--;
                      });
                     },
                    mini: true,
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: (){
                      setState(() {
                        type=='age'? age++: weight++;
                      });
                    },
                    mini: true,
                    child: const Icon(Icons.add),
                  )
                ],
              )
            ],
          ),
        )
      );

  }
}
