import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';

class ParagraphFormWidget extends StatefulWidget {
  const ParagraphFormWidget({super.key});

  @override
  State<ParagraphFormWidget> createState() => ParagraphFormWidgetState();
}

class ParagraphFormWidgetState extends FormWidgetState<ParagraphFormWidget> {
  @override
  String get type => ParagraphForm().name;

  @override
  int get defaultAnswer => 0;

  @override
  Widget buildOtherAnswer() {
    return const SizedBox();
  }

  @override
  Widget buildAddAnswer() {
    return const SizedBox();
  }

  @override
  Widget buildAnswers() {
    return const SizedBox();
  }
}
