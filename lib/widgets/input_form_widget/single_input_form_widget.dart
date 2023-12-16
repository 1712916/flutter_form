import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/entity/user_answer_data.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';
import 'package:flutter_form/widgets/input_form_widget/input_form_widget.dart';
import 'package:flutter_form/widgets/selection.dart';

class SingleInputFormWidget extends InputFormWidget {
  const SingleInputFormWidget({super.key, required super.formData});

  @override
  State<StatefulWidget> createState() => SingleInputFormWidgetState();
}

class SingleInputFormWidgetState extends InputFormWidgetState<SingleInputFormWidget> {
  String? _currentSelect;

  @override
  Widget buildAnswer() {
    return SingleSelectionWidget(
      list: formData.answers,
      builder: (item, isSelected) {
        return Row(
          children: [
            IgnorePointer(
              child: Radio(
                value: isSelected,
                onChanged: (value) {},
                groupValue: true,
              ),
            ),
            Text(item),
          ],
        );
      },
      onSelected: (value) {
        _currentSelect = value;
      },
    );
  }

  @override
  UserAnswerData get getUserAnswerData => UserAnswerData(
        question: formData.question,
        answers: [
          if (_currentSelect != null) _currentSelect!,
          if (formData.isUseOtherAnswer && otherTextEditingController.text.trim().isNotEmpty)
            otherTextEditingController.text,
        ],
      );
}
