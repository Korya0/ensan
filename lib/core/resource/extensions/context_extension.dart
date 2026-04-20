import 'package:flutter/material.dart';

extension ContextExt on BuildContext {}

extension ContextUtils on BuildContext {
  void unFocus() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.unfocus();
    }
  }
}
