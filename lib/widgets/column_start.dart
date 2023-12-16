import 'package:flutter/material.dart';

class ColumnStart extends StatelessWidget {
  const ColumnStart({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
