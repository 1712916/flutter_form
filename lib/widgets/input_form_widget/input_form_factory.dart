import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_data.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';
import 'package:flutter_form/widgets/form_widget/multiple_form_widget.dart';
import 'package:flutter_form/widgets/form_widget/paragraph_form_widget.dart';
import 'package:flutter_form/widgets/form_widget/single_form_widget.dart';
import 'package:flutter_form/widgets/input_form_widget/input_form_widget.dart';

import 'multiple_input_form_widget.dart';
import 'paragraph_input_form_widget.dart';
import 'single_input_form_widget.dart';

class InputFormFactory extends StatelessWidget {
  const InputFormFactory({
    super.key,
    required this.data,
    required this.formKey,
  });

  final FormData data;
  final GlobalKey<InputFormWidgetState> formKey;

  @override
  Widget build(BuildContext context) {
    switch (FormType.getFormFromString(data.type)) {
      case ParagraphForm():
        return ParagraphInputFormWidget(key: formKey, formData: data);
      case SingleSelectForm():
        return SingleInputFormWidget(key: formKey, formData: data);
      case MultipleSelectForm():
        return MultiSeInputFormWidget(key: formKey, formData: data);
    }
  }
}
