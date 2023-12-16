import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_data.dart';
import 'package:flutter_form/entity/form_type.dart';
import 'package:flutter_form/helper/show_bottom_sheet_helper.dart';
import 'package:flutter_form/widgets/dropdown_button.dart';
import 'package:flutter_form/widgets/form_widget/form_factory.dart';
import 'package:flutter_form/widgets/form_widget/form_widget.dart';

List<FormType> getFormList() {
  return [
    ParagraphForm(),
    SingleSelectForm(),
    MultipleSelectForm(),
  ];
}

class CreateFormPage extends StatefulWidget with ShowBottomSheet {
  const CreateFormPage({Key? key, required this.onSubmit}) : super(key: key);

  final ValueChanged<FormData> onSubmit;

  @override
  State<CreateFormPage> createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> {
  final List<FormType> formTypes = getFormList();

  FormType? _currentType;

  GlobalKey<FormWidgetState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select form type:",
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 10),
                      CustomDropdownButton<FormType>(
                        initial: _currentType == null ? null : formTypes.indexOf(_currentType!),
                        items: formTypes,
                        itemBuilder: (item, isSelected) {
                          return Text(
                            item.name,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: isSelected ? theme.primaryColor : null,
                            ),
                          );
                        },
                        title: (item) {
                          return Text(
                            item?.name ?? "",
                            style: theme.textTheme.bodyMedium,
                          );
                        },
                        onChange: (index) {
                          _currentType = formTypes[index];
                          formKey = GlobalKey();
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      if (_currentType != null)
                        FormFactory(
                          key: ObjectKey(_currentType),
                          type: _currentType!,
                          formKey: formKey,
                        )
                    ],
                  ),
                ),
              ),
              if (_currentType != null)
                ElevatedButton(
                  onPressed: () {
                    //todo: handle submit
                    print(formKey.currentState?.getFormData().toMap());
                    try {
                      if (formKey.currentState!.isValid()) {
                        widget.onSubmit(formKey.currentState!.getFormData());
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).clearSnackBars();

                        const snackBar = SnackBar(
                          content: Text('Your input is invalid! Please check again!'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } catch (e) {}
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Submit"),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
