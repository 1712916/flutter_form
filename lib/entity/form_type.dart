sealed class FormType {
  final String name;

  FormType(this.name);
}

class ParagraphForm extends FormType {
  ParagraphForm() : super("paragraph");
}

class SingleSelectForm extends FormType {
  SingleSelectForm() : super("single_select");
}

class MultipleSelectForm extends FormType {
  MultipleSelectForm() : super("multiple_select");
}
