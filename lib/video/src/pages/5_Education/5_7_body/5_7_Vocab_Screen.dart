import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/5_Education/5_7_body/5_7video_body.dart';
import 'package:mirinae_gugu/video/src/widget/learn_level_button_f.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Vocab_Screen_57 extends StatefulWidget {
  @override
  _Vocab_Screen_51 createState() => _Vocab_Screen_51();
}

class _Vocab_Screen_51 extends State<Vocab_Screen_57>{
  List<bool> FavoriteButtons = <bool>[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
  List<String> FavoriteButton = ["false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false"];
  Future<void> loadFavorite() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      FavoriteButtons = (prefs.getStringList("favorite_7") ?? <bool>[]).map((value) => value == 'true').toList();
    });

  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    loadFavorite();
    return Scaffold(
        appBar: DefaultAppBar(title: '낱말학습'),
        body: Center(
            child: Scrollbar(

                child: ListView(
                    padding: const EdgeInsets.all(10.0),
                    children: <Widget>[
                      SizedBox(height: 5.h),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('  낱말 7단원 (30)',style: TextStyle(fontSize: 20.0.sp+size,fontWeight: FontWeight.bold))
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                              state: FavoriteButtons[1],
                              text: FavoriteButtons[1] ? "7-1 ✔" : '7-1',
                              onTap: () async {
                                await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                  index:1,
                                ),));
                              }
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[2],
                            text: FavoriteButtons[2] ? '7-2 ✔' : '7-2',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 2,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[3],
                            text: FavoriteButtons[3] ? '7-3 ✔' : '7-3',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 3,
                              ),));
                            },
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                            state: FavoriteButtons[4],
                            text: FavoriteButtons[4] ? '7-4 ✔' : '7-4',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 4,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[5],
                            text: FavoriteButtons[5] ? '7-5 ✔' : '7-5',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 5,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[6],
                            text: FavoriteButtons[6] ? '7-6 ✔' : '7-6',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 6,
                              ),));
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                            state: FavoriteButtons[7],
                            text: FavoriteButtons[7] ? '7-7 ✔' : '7-7',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 7,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[8],
                            text: FavoriteButtons[8] ? '7-8 ✔' : '7-8',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 8,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[9],
                            text: FavoriteButtons[9] ? '7-9 ✔' : '7-9',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 9,
                              ),));
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                            state: FavoriteButtons[10],
                            text: FavoriteButtons[10] ? '7-10 ✔' : '7-10',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 10,
                              ),));
                            },
                          ),

                          LearnLevelButton(
                            state: FavoriteButtons[11],
                            text: FavoriteButtons[11] ? '7-11 ✔' : '7-11',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 11,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[12],
                            text: FavoriteButtons[12] ? '7-12 ✔' : '7-12',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 12,
                                //Level newLevel = await gameBloc.setLevel(index + 1);
                                //Navigator.of(context).push(GamePage.route(newLevel));
                              ),));
                            },
                          ),
                        ],
                      ), //10~12
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                            state: FavoriteButtons[13],
                            text: FavoriteButtons[13] ? '7-13 ✔' : '7-13',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 13,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[14],
                            text: FavoriteButtons[14] ? '7-14 ✔' : '7-14',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 14,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[15],
                            text: FavoriteButtons[15] ? '7-15 ✔' : '7-15',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 15,
                                //Level newLevel = await gameBloc.setLevel(index + 1);
                                //Navigator.of(context).push(GamePage.route(newLevel));
                              ),));
                            },
                          ),
                        ],
                      ),  //13~15
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                            state: FavoriteButtons[16],
                            text: FavoriteButtons[16] ? '7-16 ✔' : '7-16',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 16,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[17],
                            text: FavoriteButtons[17] ? '7-17 ✔' : '7-17',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 17,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[18],
                            text: FavoriteButtons[18] ? '7-18 ✔' : '7-18',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 18,
                                //Level newLevel = await gameBloc.setLevel(index + 1);
                                //Navigator.of(context).push(GamePage.route(newLevel));
                              ),));
                            },
                          ),
                        ],
                      ),  //16~18
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                            state: FavoriteButtons[19],
                            text: FavoriteButtons[19] ? '7-19 ✔' : '7-19',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 19,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[20],
                            text: FavoriteButtons[20] ? '7-20 ✔' : '7-20',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 20,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[21],
                            text: FavoriteButtons[21] ? '7-21 ✔' : '7-21',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 21,
                                //Level newLevel = await gameBloc.setLevel(index + 1);
                                //Navigator.of(context).push(GamePage.route(newLevel));
                              ),));
                            },
                          ),
                        ],
                      ),  //19~21
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                            state: FavoriteButtons[22],
                            text: FavoriteButtons[22] ? '7-22 ✔' : '7-22',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 22,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[23],
                            text: FavoriteButtons[23] ? '7-23 ✔' : '7-23',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 23,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[24],
                            text: FavoriteButtons[24] ? '7-24 ✔' : '7-24',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 24,
                                //Level newLevel = await gameBloc.setLevel(index + 1);
                                //Navigator.of(context).push(GamePage.route(newLevel));
                              ),));
                            },
                          ),
                        ],
                      ), //22~24
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                            state: FavoriteButtons[25],
                            text: FavoriteButtons[25] ? '7-25 ✔' : '7-25',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 25,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[26],
                            text: FavoriteButtons[26] ? '7-26 ✔' : '7-26',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 26,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[27],
                            text: FavoriteButtons[27] ? '7-27 ✔' : '7-27',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 27,
                                //Level newLevel = await gameBloc.setLevel(index + 1);
                                //Navigator.of(context).push(GamePage.route(newLevel));
                              ),));
                            },
                          ),
                        ],
                      ),  //25~27
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                            state: FavoriteButtons[28],
                            text: FavoriteButtons[28] ? '7-28 ✔' : '7-28',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 28,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[29],
                            text: FavoriteButtons[29] ? '7-29 ✔' : '7-29',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 29,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[30],
                            text: FavoriteButtons[30] ? '7-30 ✔' : '7-30',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_7(
                                index: 30,
                              ),));
                            },
                          ),
                        ],

                        //28~30

                      )
                    ]
                )
            )
        )
    );

  }

}