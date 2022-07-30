import 'package:get/get.dart';
import 'package:mirinae_gugu/video/src/controller/app_controller.dart';

class InitBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(AppController());
  }
}