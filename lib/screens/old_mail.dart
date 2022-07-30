import 'package:flutter/material.dart';
import 'package:mirinae_gugu/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: MyHomePage(title: '구구절절'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [SamplePage(), StudyPage(), RecordPage(), AboutPage()];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions : <Widget>[
            IconButton(
                icon: Icon(
                    Icons.notifications,
                    color: Colors.blue,
                    size : 30.0,
                ),
              onPressed: ()=>{},

            )
          ]
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onTap,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'MY',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                  label: '학습',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mic),
                  label: '녹음',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: '더보기',
                //chat
              )
            ]));
  }
}