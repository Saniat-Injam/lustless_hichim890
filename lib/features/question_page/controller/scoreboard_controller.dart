import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ScoreboardControllers extends GetxController {
  RxDouble progressValue = 0.0.obs;
  RxDouble firstBarValue = 1.00.obs; 
  RxDouble secondBarValue = 0.00.obs; 

  @override
  void onInit() {
    super.onInit();
    setFixedProgress(); 
  }

 
  void setFixedProgress() {
    progressValue.value = 0.75; 
  }
}
