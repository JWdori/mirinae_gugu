import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/9_setting/9_Walkthrough.dart';


import '9_FontSize.dart';
import '9_Fontchoose.dart';
import '9_LanguageChoose.dart';

class Setting extends StatefulWidget{
  @override
  _Setting createState() => _Setting();
}

class _Setting extends State<Setting>{

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: Text("설정",style: TextStyle(fontSize: 20.sp,color: Colors.black,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),

      body:
      Container(

        padding: const EdgeInsets.all(10),
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            SizedBox(height: 1.h,),
            Row(
              children: [
                Icon(
                  Icons.app_settings_alt,
                  color: Colors.blue,
                  size: 25,
                ),
                SizedBox(width:3.w),
                Text("환경",style: TextStyle(fontSize: 18.sp+size,fontWeight: FontWeight.bold),)
              ],
            ),
            Divider(height: 5.h,thickness: 3,),
            SizedBox(height: 0.h,),
            buildLanguage(context, "언어 설정"),
            SizedBox(height: 1.h,),
            buildfontchoose(context, "글꼴 설정"),
            SizedBox(height: 1.h,),
            buildfontsize(context, "글자 크기 설정"),
            SizedBox(height: 5.h,),
            Row(
              children: [
                Icon(Icons.email_outlined, color: Colors.blue,size: 25,),
                SizedBox(width: 3.w,),
                Text("정보",style: TextStyle(
                    fontSize: 18.sp+size,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
            Divider(height: 5.h,thickness: 3,),
            SizedBox(height: 0.h,),
            buildcontact(context, "개발자 연락처"),
            SizedBox(height: 1.h,),
            buildAccountOption2(context, "버전 정보"),

            SizedBox(height: 5.h,),
            Row(
              children: [
                Icon(Icons.search_sharp, color: Colors.blue,size: 25,),
                SizedBox(width: 3.w,),
                Text("사용 안내", style: TextStyle(
                    fontSize: 18.sp+size,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
            Divider(height: 5.h,thickness: 3,),
            SizedBox(height: 0.h,),
            buildwalkthrough(context, "사용법 및 기능"),


          ],
        ),
      ),

    );
  }


  GestureDetector buildLanguage(BuildContext context, String title)
  {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Languagechoose(),
              ],
            ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("닫기",style: TextStyle(color: Colors.black,fontSize: 12.sp),),
              )
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,textScaleFactor: 1.0,style: TextStyle(
              fontSize: 14.sp+size,
              fontWeight: FontWeight.w600,
            ),),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), //모서리를 둥글게
                  border: Border.all(color: Colors.black12, width: 3)), //테두리
              child: Padding(
                padding: EdgeInsets.only(left:5,right: 5),
                child: Text("상세 보기",textScaleFactor: 1.0,style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp+size,
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


GestureDetector buildAccountOption2(BuildContext context, String title)
{
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
            fontSize: 14.sp+size,
            fontWeight: FontWeight.w600,

          ),),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left:3,right: 5),
              child: Text("1.0.1+3",style: TextStyle(
                  fontSize: 14.sp+size,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800]
              ),),
            ),
          ),

        ],
      ),
    ),
  );
}

GestureDetector buildcontact(BuildContext context, String title)
{
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 1.h),
              Text("이메일 주소\njaewan0114@naver.com"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("닫기",style: TextStyle(color: Colors.black,fontSize: 12.sp),),
            )
          ],
        );
      });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
            fontSize: 14.sp+size,
            fontWeight: FontWeight.w600,

          ),),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), //모서리를 둥글게
                border: Border.all(color: Colors.black12, width: 3)), //테두리
            child: Padding(
              padding: EdgeInsets.only(left:5,right: 5),
              child: Text("상세 보기",textScaleFactor: 1.0,style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp+size,
              ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget buildwalkthrough(BuildContext context, String title)
{
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => WalkthroughScreen()));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
            fontSize: 14.sp+size,
            fontWeight: FontWeight.w600,
          ),),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), //모서리를 둥글게
                border: Border.all(color: Colors.black12, width: 3)), //테두리
            //Colors.black12
            child: Padding(
              padding: EdgeInsets.only(left:5,right: 5),
              child: Text("상세 보기",textScaleFactor: 1.0,style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp+size,
              ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}





GestureDetector buildfontsize(BuildContext context, String title)
{
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyApp2()
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("닫기",style: TextStyle(color: Colors.black,fontSize: 12.sp),),
            )
          ],
        );
      });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
            fontSize: 14.sp+size,
            fontWeight: FontWeight.w600,

          ),),

          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), //모서리를 둥글게
                border: Border.all(color: Colors.black12, width: 3)), //테두리
            child: Padding(
              padding: EdgeInsets.only(left:5,right: 5),
              child: Text("상세 보기",textScaleFactor: 1.0,style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp+size,
              ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



GestureDetector buildfontchoose(BuildContext context, String title)
{
  int? _gropevalue = 2;
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Fontchoose(),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("닫기",style: TextStyle(color: Colors.black,fontSize: 12.sp),),
            )
          ],
        );
      });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
            fontSize: 14.sp+size,
            fontWeight: FontWeight.w600,

          ),),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), //모서리를 둥글게
                border: Border.all(color: Colors.black12, width: 3)), //테두리
            child: Padding(
              padding: EdgeInsets.only(left:5,right: 5),
              child: Text("상세 보기",textScaleFactor: 1.0,style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp+size,
              ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}