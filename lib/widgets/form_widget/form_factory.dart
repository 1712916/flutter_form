import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';
import 'package:flutter_form/widgets/form_widget/multiple_form_widget.dart';
import 'package:flutter_form/widgets/form_widget/paragraph_form_widget.dart';
import 'package:flutter_form/widgets/form_widget/single_form_widget.dart';

class FormFactory extends StatelessWidget {
  const FormFactory({
    super.key,
    required this.type,
    required this.formKey,
  });

  final FormType type;
  final GlobalKey<FormWidgetState> formKey;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ParagraphForm():
        return ParagraphFormWidget(key: formKey);
      case SingleSelectForm():
        return SingleSelectionFormWidget(key: formKey);
      case MultipleSelectForm():
        return MultipleSelectionFormWidget(key: formKey);
    }
  }
}
