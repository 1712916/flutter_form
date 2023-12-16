/*
* format:
* {
* "type": "multiple_select",
* "question": "This is question"
* "answers": [],
* "other_answer": "This is other answer"
* "required": true,
* }
* */

class FormData {
  FormData({
    required this.type,
    required this.question,
    required this.answers,
    required this.isUseOtherAnswer,
    required this.isRequired,
  });

  final String type;
  final String question;
  final List<String> answers;
  final bool isUseOtherAnswer;
  final bool isRequired;

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'question': question,
      'answers': answers,
      'isUseOtherAnswer': isUseOtherAnswer,
      'isRequired': isRequired,
    };
  }

  factory FormData.fromMap(Map<String, dynamic> map) {
    return FormData(
      type: map['type'] as String,
      question: map['question'] as String,
      answers: map['answers'] as List<String>,
      isUseOtherAnswer: map['isUseOtherAnswer'] as bool,
      isRequired: map['isRequired'] as bool,
    );
  }
}
