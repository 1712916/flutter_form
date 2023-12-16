import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/entity/user_answer_data.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';
import 'package:flutter_form/widgets/input_form_widget/input_form_widget.dart';
import 'package:flutter_form/widgets/selection.dart';

class MultiSeInputFormWidgetState extends InputFormWidgetState<InputFormWidget> {
  Set<String> _selectedList = {};

  @override
  Widget buildAnswer() {
    return MultiSelectionWidget(
      list: formData.answers,
      builder: (item, isSelected) {
        return Row(
          children: [
            IgnorePointer(
              child: Checkbox(
                value: isSelected,
                onChanged: (value) {},
              ),
            ),
            Text(item),
          ],
        );
      },
      onSelected: (value, isSelected) {
        if (isSelected) {
          _selectedList.add(value);
        } else {
          _selectedList.remove(value);
        }
      },
    );
  }

  @override
  UserAnswerData get getUserAnswerData => UserAnswerData(
        question: formData.question,
        answers: [
          ..._selectedList,
          if (formData.isUseOtherAnswer && otherTextEditingController.text.trim().isNotEmpty)
            otherTextEditingController.text,
        ],
      );
}
