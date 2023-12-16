import 'package:flutter/material.dart';
import 'package:flutter_form/entity/form_data.dart';
import 'package:flutter_form/pages/create_form_page.dart';
import 'package:flutter_form/widgets/column_start.dart';
import 'package:flutter_form/widgets/input_form_widget/input_form_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FormData> formDataList = [];

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
                    CreateFormPage(
                      onSubmit: (formData) {
                        formDataList.add(formData);
                        setState(() {});
                      },
                    ).showBottomSheet(context);
                  },
                  label: Text("Review My Answer"),
                ),
              ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                      InputFormWidget(formData: formDataList[i]),
                    ],
                  ),
                )
            ],
          ],
        ),
      ),
    );
  }
}
