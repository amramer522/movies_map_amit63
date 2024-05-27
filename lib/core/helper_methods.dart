import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future navigateTo(
  Widget page, {
  bool keepHistory = true,
  bool isReplacement = false,
}) {
  if (isReplacement) {
    return Navigator.pushReplacement(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
  return Navigator.pushAndRemoveUntil(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ),
    (route) => keepHistory,
  );
}

enum MessageType { success, warning, error }

void showMessage(String msg, {MessageType messageType = MessageType.error}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      backgroundColor: messageType == MessageType.success
          ? Colors.green
          : messageType == MessageType.warning
              ? Colors.orange
              : Colors.red,
    ),
  );
}


