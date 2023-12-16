import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_data.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/widgets/column_start.dart';
import 'package:flutter_form/widgets/text_field.dart';

abstract class FormWidgetState<T extends StatefulWidget> extends State<T> {
  late final theme = Theme.of(context);

  final TextEditingController _qController = TextEditingController();

  final List<TextEditingController> _ansController = [];

  int get defaultAnswer => 1;

  int? get maxAnswer => null;

  bool _isRequired = false;

  void setRequired(bool required) {
    _isRequired = required;
  }

  bool _isUseOtherAnswer = false;

  void setUseOtherAnswer(bool useOtherAnswer) {
    _isUseOtherAnswer = useOtherAnswer;
  }

  @override
  void initState() {
    _ansController.addAll(List.generate(defaultAnswer, (_) => TextEditingController()));
    super.initState();
  }

  @override
  void dispose() {
    _qController.dispose();
    for (var c in _ansController) {
      c.dispose();
    }
    super.dispose();
  }

  String get type;

  FormData getFormData() {
    return FormData(
      type: type,
      question: _qController.text,
      answers: [for (var c in _ansController) c.text],
      isRequired: _isRequired,
      isUseOtherAnswer: _isUseOtherAnswer,
    );
  }

  Widget buildQuestion() {
    return ColumnStart(
      children: [
        Text(
          "Question:",
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        CustomTextField(controller: _qController),
      ],
    );
  }

  Widget buildAnswers() {
    return ColumnStart(
      children: [
        const SizedBox(height: 16),
        Text(
          "Answers:",
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        ...[
          for (int i = 0; i < _ansController.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Stack(
                children: [
                  CustomTextField(controller: _ansController[i]),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        _ansController[i].dispose();
                        _ansController.removeAt(i);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete_forever),
                    ),
                  )
                ],
              ),
            )
        ],
      ],
    );
  }

  Widget buildRequired() {
    return Row(
      children: [
        Checkbox(
          value: _isRequired,
          onChanged: (value) {
            _isRequired = value!;
            setState(() {});
          },
        ),
        Text("This field is required"),
      ],
    );
  }

  Widget buildOtherAnswer() {
    return Row(
      children: [
        Checkbox(
          value: _isUseOtherAnswer,
          onChanged: (value) {
            _isUseOtherAnswer = value!;
            setState(() {});
          },
        ),
        Text("Allow user to specify their own answer"),
      ],
    );
  }

  Widget buildAddAnswer() {
    if ((maxAnswer != null && maxAnswer! <= _ansController.length)) {
      return const SizedBox();
    }

    return TextButton(
      onPressed: () {
        _ansController.add(TextEditingController());
        setState(() {});
      },
      child: const Row(
        children: [
          Icon(Icons.add),
          SizedBox(width: 8),
          Text("Add another answer"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColumnStart(
      children: [
        buildQuestion(),
        buildAnswers(),
        buildAddAnswer(),
        buildOtherAnswer(),
        buildRequired(),
      ],
    );
  }
}
