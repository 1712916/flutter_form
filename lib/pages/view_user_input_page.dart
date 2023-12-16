import 'package:flutter/material.dart';
import 'package:flutter_form/entity/user_answer_data.dart';
import 'package:flutter_form/widgets/column_start.dart';

class ViewUserInputPage extends StatelessWidget {
  const ViewUserInputPage({Key? key, required this.userAnswers}) : super(key: key);

  final List<UserAnswerData> userAnswers;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your answers"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final userAnswer = userAnswers[index];
          return ColumnStart(
            children: [
              Text(
                "${userAnswer.question}",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              ...userAnswer.answers.map((a) => Text(a)),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 18),
        itemCount: userAnswers.length,
      ),
    );
  }
}
