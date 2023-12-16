import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';

class SingleSelectionFormWidget extends StatefulWidget {
  const SingleSelectionFormWidget({super.key});

  @override
  State<SingleSelectionFormWidget> createState() => SingleSelectionFormWidgetState();
}

class SingleSelectionFormWidgetState extends FormWidgetState<SingleSelectionFormWidget> {
  @override
  String get type => SingleSelectForm().name;

  @override
  int? get maxAnswer => 5;
}
