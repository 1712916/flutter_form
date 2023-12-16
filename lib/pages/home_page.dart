import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_data.dart';
import 'package:flutter_form/pages/create_form_page.dart';
import 'package:flutter_form/pages/view_user_input_page.dart';
import 'package:flutter_form/widgets/column_start.dart';
import 'package:flutter_form/widgets/input_form_widget/input_form_factory.dart';
import 'package:flutter_form/widgets/input_form_widget/input_form_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FormData> formDataList = [];
  final List<GlobalKey<InputFormWidgetState>> keys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Forms")),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                onPressed: () {
                  CreateFormPage(
                    onSubmit: (formData) {
                      formDataList.add(formData);
                      keys.add(GlobalKey());
                      setState(() {});
                    },
                  ).showBottomSheet(context);
                },
                label: Text("Add Question"),
              ),
              if (formDataList.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ViewUserInputPage(
                            userAnswers: keys.map((key) => key.currentState!.getUserAnswerData).toList(),
                          ),
                        ),
                      );
                    },
                    label: Text("Review My Answer"),
                  ),
                ),
            ],
          ),
        ),
        body: formDataList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 100,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      "Form is empty!\nClick *Add Question to create your form <3",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ColumnStart(
                  children: [
                    ...[
                      for (int i = 0; i < formDataList.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: ColumnStart(
                            children: [
                              Text("Question ${i + 1}:"),
                              const SizedBox(height: 8),
                              InputFormFactory(
                                formKey: keys[i],
                                data: formDataList[i],
                              ),
                            ],
                          ),
                        )
                    ],
                  ],
                ),
              ));
  }
}
