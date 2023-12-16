import 'package:flutter/material.dart';
import 'package:flutter_form/pages/create_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forms")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          CreateFormPage().showBottomSheet(context);
        },
        label: Text("Add Question"),
      ),
    );
  }
}
