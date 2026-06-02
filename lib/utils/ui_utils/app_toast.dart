import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

void showAppToast(
  String title,
  String message, {
  SnackPosition? snackPosition,
  EdgeInsets? margin,
  Duration? duration,
  ToastificationType type = ToastificationType.info,
}) {
  final top = margin?.top ?? 16;
  final bottom = margin?.bottom ?? 16;
  final alignment = snackPosition == SnackPosition.BOTTOM
      ? Alignment.bottomCenter
      : Alignment.topCenter;

  toastification.show(
    title: Text(title),
    description: Text(message),
    type: type,
    style: ToastificationStyle.flatColored,
    alignment: alignment,
    autoCloseDuration: duration ?? const Duration(seconds: 2),
    showProgressBar: true,
    closeButton: const ToastCloseButton(showType: CloseButtonShowType.always),
    dragToClose: true,
    applyBlurEffect: true,
    margin: EdgeInsets.fromLTRB(12, top, 12, bottom),
    borderRadius: BorderRadius.circular(14),
  );
}
