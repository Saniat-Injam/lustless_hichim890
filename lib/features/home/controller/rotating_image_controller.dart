import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotatingImageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;

  Animation<double> get rotationAnimation => _animationController.view;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
