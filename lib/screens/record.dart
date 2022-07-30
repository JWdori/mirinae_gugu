import 'package:flutter/material.dart';
import 'package:mirinae_gugu/screens/screens.dart';

class RecordPage extends StatelessWidget {
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
              height: 200, width: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.indigo, width: 0.5)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("이번 주 공부량", style: TextStyle(fontSize: 15, color: Colors.black45)),
                  Text("목표량", style: TextStyle(fontSize: 10, color: Colors.black45)),
                  Container(
                    height:10, width : 200,
                    color: Colors.black12,
                  ),
                  Text("5/20", style: TextStyle(fontSize: 10, color: Colors.black45)),
                  Text('자세히보기', style: TextStyle(fontSize: 10, color: Colors.black54))
                ],
              ),
            ),
            Container(
              height: 200, width: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.indigo, width: 0.5)
              ),
              child:
              Center(
                child: Text("오늘의 상식\n조선시대 죄인의 심문과 도적, 화재 예방을 위해 순찰 등의 일을 맡았던 관서를 무엇이라 하나요?\n포도청", style: TextStyle(fontSize: 10, color: Colors.black45)),
              ),

            )
          ]
      ),
    );
  }
}
