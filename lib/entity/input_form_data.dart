import 'package:flutter_form/entity/form_data.dart';

class InputFormData extends FormData {
  InputFormData({
    required super.type,
    required super.question,
    required super.answers,
    required super.isUseOtherAnswer,
    required super.isRequired,
    required this.otherAnswer,
  });

  final String otherAnswer;
}
