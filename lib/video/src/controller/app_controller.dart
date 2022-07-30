import 'package:get/get.dart';

enum RouteName {Home,Record,Add}

class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    //if(RouteName.values[index] == RouteName.Add){
    //  _showBottomSheet();
    //}else{
    currentIndex(index);
    //}
  }
//void _showBottomSheet(){
//  Get.bottomSheet(YoutubeBottomSheet());
//}
}