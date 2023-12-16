import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/widgets/column_start.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';
import 'package:flutter_form/widgets/input_form_widget/input_form_widget.dart';
import 'package:flutter_form/widgets/text_field.dart';

class ParagraphInputFormWidgetState extends InputFormWidgetState<InputFormWidget> {
  @override
  Widget buildAnswer() {
    return ColumnStart(
      children: [
        // Text("A:"),
        const SizedBox(height: 8),
        CustomTextField(controller: TextEditingController()),
      ],
    );
  }
}
