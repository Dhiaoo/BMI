
import 'package:flutter/material.dart';
import 'home.dart';
void main() => runApp(const Myapp());
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.white10,
        iconTheme: const IconThemeData(color: Colors.white,),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: Colors.white
          ),
            headline2: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black
            )
        )
      ),
      home:  MyhomePage(),
    );
  }
}
