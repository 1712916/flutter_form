import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';

class MultipleSelectionFormWidget extends StatefulWidget {
  const MultipleSelectionFormWidget({super.key});

  @override
  State<MultipleSelectionFormWidget> createState() => MultipleSelectionFormWidgetState();
}

class MultipleSelectionFormWidgetState extends FormWidgetState<MultipleSelectionFormWidget> {
  @override
  String get type => SingleSelectForm().name;

  @override
  int? get maxAnswer => 5;
}
