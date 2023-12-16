import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';
import 'package:flutter_form/widgets/input_form_widget/input_form_widget.dart';
import 'package:flutter_form/widgets/selection.dart';

class MultiSeInputFormWidgetState extends InputFormWidgetState<InputFormWidget> {
  @override
  Widget buildAnswer() {
    return MultiSelectionWidget(
      list: formData.answers,
      builder: (item, isSelected) {
        return Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (value) {},
            ),
            Text(item),
          ],
        );
      },
      onSelected: (item, isSelected) {},
    );
  }
}
