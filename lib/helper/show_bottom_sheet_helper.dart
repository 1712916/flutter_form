import 'package:flutter/material.dart';

mixin ShowBottomSheet<T> on Widget {
  Future<T?> showBottomSheet(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    return showModalBottomSheet<T>(
      context: context,
      builder: (context) => this,
      isScrollControlled: true,
      useSafeArea: true,
    );
  }
}
