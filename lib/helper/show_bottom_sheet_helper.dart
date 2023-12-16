import 'package:flutter/material.dart';

mixin ShowBottomSheet<T> on Widget {
  Future<T?> showBottomSheet(BuildContext context) {
    return showModalBottomSheet<T>(
      context: context,
      builder: (context) => this,
      isScrollControlled: true,
      useSafeArea: true,
    );
  }
}
