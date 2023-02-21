import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/5_Education/5_2_body/5_2video_body.dart';
import 'package:mirinae_gugu/video/src/widget/learn_level_button_f.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Vocab_Screen_52 extends StatefulWidget {
  @override
  _Vocab_Screen_52 createState() => _Vocab_Screen_52();
}

class _Vocab_Screen_52 extends State<Vocab_Screen_52>{
  List<bool> FavoriteButtons = <bool>[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
  List<String> FavoriteButton =      ["false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false","false"];
  Future<void> loadFavorite() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      FavoriteButtons = (prefs.getStringList("favorite_2") ?? <bool>[]).map((value) => value == 'true').toList();
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
                          child: Text('  낱말 2단원 (18)',style: TextStyle(fontSize: 20.0.sp+size,fontWeight: FontWeight.bold))
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LearnLevelButton(
                              state: FavoriteButtons[1],
                              text: FavoriteButtons[1] ? "2-1" : '2-1',
                              onTap: () async {
                                await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                  index:1,
                                ),));
                              }
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[2],
                            text: FavoriteButtons[2] ? '2-2' : '2-2',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 2,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[3],
                            text: FavoriteButtons[3] ? '2-3' : '2-3',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
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
                            text: FavoriteButtons[4] ? '2-4' : '2-4',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 4,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[5],
                            text: FavoriteButtons[5] ? '2-5' : '2-5',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 5,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[6],
                            text: FavoriteButtons[6] ? '2-6' : '2-6',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
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
                            text: FavoriteButtons[7] ? '2-7' : '2-7',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 7,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[8],
                            text: FavoriteButtons[8] ? '2-8' : '2-8',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 8,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[9],
                            text: FavoriteButtons[9] ? '2-9' : '2-9',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
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
                            text: FavoriteButtons[10] ? '2-10' : '2-10',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 10,
                              ),));
                            },
                          ),

                          LearnLevelButton(
                            state: FavoriteButtons[11],
                            text: FavoriteButtons[11] ? '2-11' : '2-11',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 11,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[12],
                            text: FavoriteButtons[12] ? '2-12' : '2-12',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
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
                            text: FavoriteButtons[13] ? '2-13' : '2-13',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 13,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[14],
                            text: FavoriteButtons[14] ? '2-14' : '2-14',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 14,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[15],
                            text: FavoriteButtons[15] ? '2-15' : '2-15',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
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
                            text: FavoriteButtons[16] ? '2-16' : '2-16',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 16,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[17],
                            text: FavoriteButtons[17] ? '2-17' : '2-17',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 17,
                              ),));
                            },
                          ),
                          LearnLevelButton(
                            state: FavoriteButtons[18],
                            text: FavoriteButtons[18] ? '2-18' : '2-18',
                            onTap: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_2(
                                index: 18,
                                //Level newLevel = await gameBloc.setLevel(index + 1);
                                //Navigator.of(context).push(GamePage.route(newLevel));
                              ),));
                            },
                          ),
                        ],
                      ),  //16~18
                     //19~21
//22~24
 //25~27
                    ]
                )
            )
        )
    );

  }

}