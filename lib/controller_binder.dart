import 'package:api_getx/controllers/add_new_task_screen.dart';
import 'package:api_getx/controllers/login_controllers.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(NewTaskController());
  }
}