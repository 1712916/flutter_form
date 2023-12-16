import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_data.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/entity/user_answer_data.dart';
import 'package:flutter_form/widgets/column_start.dart';
import 'package:flutter_form/widgets/form_widget/paragraph_form_widget.dart';
import 'package:flutter_form/widgets/input_form_widget/multiple_input_form_widget.dart';
import 'package:flutter_form/widgets/text_field.dart';

import 'paragraph_input_form_widget.dart';
import 'single_input_form_widget.dart';

class InputFormWidget extends StatefulWidget {
  final FormData formData;

  const InputFormWidget({super.key, required this.formData});

  @override
  State<StatefulWidget> createState() {
    switch (FormType.getFormFromString(formData.type)) {
      case ParagraphForm():
        return ParagraphInputFormWidgetState();
      case SingleSelectForm():
        return SingleInputFormWidgetState();
      case MultipleSelectForm():
        return MultiSeInputFormWidgetState();
    }
  }
}

abstract class InputFormWidgetState<T extends InputFormWidget> extends State<T> {
  late final theme = Theme.of(context);

  FormData get formData => widget.formData;

  UserAnswerData get getUserAnswerData;

  final otherTextEditingController = TextEditingController();

  @override
  void dispose() {
    otherTextEditingController.dispose();
    super.dispose();
  }

  Widget buildQuestion() {
    return ColumnStart(
      children: [
        RichText(
          text: TextSpan(
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            children: [
              if (formData.isRequired)
                TextSpan(text: "* ", style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.error)),
              TextSpan(
                text: "Q: ${widget.formData.question}",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAnswer();

  Widget buildOtherAnswer() {
    if (!formData.isUseOtherAnswer) {
      return const SizedBox();
    }
    return ColumnStart(
      children: [
        Text(
          "Other answer:",
          style: theme.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        CustomTextField(controller: otherTextEditingController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColumnStart(
      children: [
        buildQuestion(),
        buildAnswer(),
        buildOtherAnswer(),
      ],
    );
  }
}
