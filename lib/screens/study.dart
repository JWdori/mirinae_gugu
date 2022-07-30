import 'package:flutter/material.dart';


class StudyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //AppBar(
            //title: Text('구구절절', style: TextStyle(color: Colors.blue)),
            //backgroundColor: Colors.white,
            //leading: IconButton(icon: Icon(Icons.menu),onPressed: null),
            //actions: [
            // IconButton(icon: Icon(Icons.image), onPressed: null),
            // IconButton(icon: Icon(Icons.navigate_next), onPressed: null),
            //],
            //),
            Container(
              color: Colors.white,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Center(
                      child: Text("홍길동님,\n안녕하세요!",
                          style: TextStyle(fontSize: 30, color: Colors.black)),
                    ),
                  ),
                  Container(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/hedgehog.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 400, width: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("음절\n학습"),
                            Text("31%"),
                            ]
                    )
                  ),
                  Container(
                      height: 100,
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("문장\n학습"),
                            Text("58%"),
                          ]
                      )
                  ),
                  Container(
                      height: 100,
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("복습\n학습"),
                            Text("10%"),
                          ]
                      )
                  ),
                ],
              ),
            )
          ]
      ),
    );
  }
}
