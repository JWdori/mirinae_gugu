
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../1_Loading.dart';

class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  String? _changeFontSize;
  final List<String> _fontSizeList = ['크게 (+4)','조금 크게 (+2)','보통','조금 작게 (-2)','작게 (-4)'];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      //Retrieving font size
      getFontSize().then((value) => setState(() {
        _changeFontSize = value as String?;
      }));
    });
    super.initState();
  }

  // void addDefaultValueToSharedPreferences() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setInt('fontsize', 10);
  // }
  Future<String?> getFontSize() async {
    SharedPreferences ss = await SharedPreferences.getInstance();
    if (size == -4) {
      ss.setString('fontsize', "작게 (-4)");
      print(1);
    }
    else if (size == -2) {
      ss.setString('fontsize', "조금 작게 (-2)");
      print(2);
    }
    else if (size == 0) {
      ss.setString('fontsize', "보통");
      print(3);
    }
    else if (size ==2) {
      ss.setString('fontsize', "조금 크게 (+2)");
      print(4);
    }
    else if (size ==4) {
      ss.setString('fontsize', "크게 (+4)");
      print(5);
    }
    return ss.getString('fontsize');
  }

  Future<String?> updateFontSize(String updatedSize) async {
    SharedPreferences ss = await SharedPreferences.getInstance();
    await ss.setString('fontsize', updatedSize);
    if (ss.getString('fontsize') == "작게 (-4)") {
      size = -2;
      print(11);
    }
    else if (ss.getString('fontsize') == "조금 작게 (-2)") {
      size = -1;
      print(22);
    }
    else if (ss.getString('fontsize') == "보통") {
      size = 0;
      print(33);
    }
    else if (ss.getString('fontsize') == "조금 크게 (+2)") {
      size = 1;
      print(44);
    }
    else if (ss.getString('fontsize') == "크게 (+4)") {
      size = 2;
      print(55);
    }
  }



  @override
  Widget build(BuildContext context) {

    print(_changeFontSize);
    return Center(



          child: Column(
            children: [
              Card(
                margin: EdgeInsets.only(bottom: 3),

                child: ListTile(

                  title: Text("Size",style: TextStyle(fontSize: 14.sp),),
                  trailing: DropdownButtonHideUnderline(

                    child: DropdownButton(

                      isExpanded: false,
                      value: _changeFontSize,
                      items: _fontSizeList.map((myFontSize) {
                        return DropdownMenuItem(
                          value: myFontSize,
                          child: Text(myFontSize.toString()),
                        );
                      }).toList(),
                      onChanged: (value) async {
                        setState(() {
                          _changeFontSize = value as String?;
                        });
                        //Updating font size
                        await updateFontSize(value as String);
                      },
                      hint: Text("Select FontSize"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("※ 변경 내용을 적용하려면 앱을 다시 시작하세요", style: TextStyle(fontSize: 9.sp),),
            ],
          ),
        );
  }
}