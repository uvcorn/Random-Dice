import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int number = 1;
  int number1 = 1;
  int count = 0;
  int count1 = 0;
  int bottomcount = 0;
  int bottomcount1 = 0;
  var rand = Random();

  void getRandomvalue() {
    setState(() {
      number = rand.nextInt(6);
      count = count + number + 1;
    });
  }

  void getRandomvalue1() {
    setState(() {
      number1 = rand.nextInt(6);
      count1 = count1 + number1 + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Ludo')),leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'Assets/$number.png',
                width: 100,
                height: 100,
              ),
              Image.asset(
                'Assets/$number1.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomcount < 5
                  ? ElevatedButton(
                      onPressed: () {
                        bottomcount++;
                        getRandomvalue();
                      },
                      child: const Text('1st'))
                  : Text("Total Score :$count"),
              bottomcount1 < 5
                  ? ElevatedButton(
                      onPressed: () {
                        bottomcount1++;
                        getRandomvalue1();
                      },
                      child: const Text('2nd'))
                  : Text("Total Score:$count1")
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                count.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                count1.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )
            ],
          ),
          count > count1
              ? Text('Player1 is winer')
              : count == count1
                  ? Text('Match draw')
                  : Text('Player2 is winer'),
        ],
      ),
    );
  }
}
