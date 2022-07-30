import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';

import 'package:mirinae_gugu/video/src/widget/learn_level_button_f.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../1_Loading.dart';
import '5_12_video_body.dart';


class Vocab_Screen_512 extends StatefulWidget {
  @override
  _Vocab_Screen_51 createState() => _Vocab_Screen_51();
}

class _Vocab_Screen_51 extends State<Vocab_Screen_512>{
  List<bool> FavoriteButtons = <bool>[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
  List<String> FavoriteButton = ["false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false"];
  Future<void> loadFavorite() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      FavoriteButtons = (prefs.getStringList("favorite_12_") ?? <bool>[]).map((value) => value == 'true').toList();
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
                      child: Text('  낱말 12단원 (30)',style: TextStyle(fontSize: 20.0.sp+size,fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          state: FavoriteButtons[1],
                          text: FavoriteButtons[1] ? "12-1 ✔" : '12-1',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                              index:1,
                            ),));
                          }
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[2],
                        text: FavoriteButtons[2] ? '12-2 ✔' : '12-2',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                              index: 2,
                          ),));
                              },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[3],
                        text: FavoriteButtons[3] ? '12-3 ✔' : '12-3',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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
                        text: FavoriteButtons[4] ? '12-4 ✔' : '12-4',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 4,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[5],
                        text: FavoriteButtons[5] ? '12-5 ✔' : '12-5',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 5,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[6],
                        text: FavoriteButtons[6] ? '12-6 ✔' : '12-6',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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
                        text: FavoriteButtons[7] ? '12-7 ✔' : '12-7',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 7,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[8],
                        text: FavoriteButtons[8] ? '12-8 ✔' : '12-8',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 8,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[9],
                        text: FavoriteButtons[9] ? '12-9 ✔' : '12-9',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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
                        text: FavoriteButtons[10] ? '12-10 ✔' : '12-10',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 10,
                          ),));
                        },
                      ),

                      LearnLevelButton(
                        state: FavoriteButtons[11],
                        text: FavoriteButtons[11] ? '12-11 ✔' : '12-11',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 11,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[12],
                        text: FavoriteButtons[12] ? '12-12 ✔' : '12-12',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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
                        text: FavoriteButtons[13] ? '12-13 ✔' : '12-13',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 13,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[14],
                        text: FavoriteButtons[14] ? '12-14 ✔' : '12-14',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 14,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[15],
                        text: FavoriteButtons[15] ? '12-15 ✔' : '12-15',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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
                        text: FavoriteButtons[16] ? '12-16 ✔' : '12-16',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 16,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[17],
                        text: FavoriteButtons[17] ? '12-17 ✔' : '12-17',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 17,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[18],
                        text: FavoriteButtons[18] ? '12-18 ✔' : '12-18',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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
                        text: FavoriteButtons[19] ? '12-19 ✔' : '12-19',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 19,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[20],
                        text: FavoriteButtons[20] ? '12-20 ✔' : '12-20',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 20,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[21],
                        text: FavoriteButtons[21] ? '12-21 ✔' : '12-21',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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
                        text: FavoriteButtons[22] ? '12-22 ✔' : '12-22',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 22,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[23],
                        text: FavoriteButtons[23] ? '12-23 ✔' : '12-23',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 23,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[24],
                        text: FavoriteButtons[24] ? '12-24 ✔' : '12-24',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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
                        text: FavoriteButtons[25] ? '12-25 ✔' : '12-25',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 25,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[26],
                        text: FavoriteButtons[26] ? '12-26 ✔' : '12-26',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 26,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[27],
                        text: FavoriteButtons[27] ? '12-27 ✔' : '12-27',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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
                        text: FavoriteButtons[28] ? '12-28 ✔' : '12-28',
          onTap: () async {
            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
              index: 28,
            ),));
          },
        ),
                      LearnLevelButton(
                        state: FavoriteButtons[29],
                        text: FavoriteButtons[29] ? '12-29 ✔' : '12-29',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
                            index: 29,
                          ),));
                        },
                      ),
                      LearnLevelButton(
                        state: FavoriteButtons[30],
                        text: FavoriteButtons[30] ? '12-30 ✔' : '12-30',
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body(
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