enum _FormTypeString {
  paragraph,
  single_select,
  multiple_select,
}

Map<String, FormType> _mappingFormTypes = {
  _FormTypeString.paragraph.name: ParagraphForm(),
  _FormTypeString.single_select.name: SingleSelectForm(),
  _FormTypeString.multiple_select.name: MultipleSelectForm(),
};

sealed class FormType {
  final String name;

  FormType(this.name);

  factory FormType.getFormFromString(String name) {
    return _mappingFormTypes[name]!;
  }
}

class ParagraphForm extends FormType {
  ParagraphForm() : super(_FormTypeString.paragraph.name);
}

class SingleSelectForm extends FormType {
  SingleSelectForm() : super(_FormTypeString.single_select.name);
}

class MultipleSelectForm extends FormType {
  MultipleSelectForm() : super(_FormTypeString.multiple_select.name);
}
