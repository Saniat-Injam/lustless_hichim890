import 'package:get/get.dart';
import 'package:lustless_hichim890/features/question_page/screen/recovery_plan.dart';
import 'package:lustless_hichim890/features/question_page/widget/question.dart';

class QuestionController extends GetxController {
  RxDouble sliderValue = 0.5.obs;
  RxInt questionNumber = 1.obs;

  List<Question> questions = [
    Question(
      questionText: 'At what age did you start watching porn regularly?',
      options: ['Before 13', '13-17', '18 or older'],
    ),
    Question(
      questionText: 'How often do you typically view pornography?',
      options: ['Always Daily', 'Weekly', 'Rarely'],
    ),
    Question(
      questionText:
          'How has your frequency of viewing explicit content changed over time?',
      options: ['Increased', 'Stayed the Same', 'Decreased'],
    ),
    Question(
      questionText:
          'Have you noticed a shift towards more extreme or graphic material?',
      options: ['Yes', 'No', 'Not Sure'],
    ),
    Question(
      questionText: 'How is your intimate life going?',
      options: ['Satisfying', 'Struggling', 'Nonexistent'],
    ),
    Question(
      questionText: 'What is your gender?',
      options: ['Male', 'Female', 'Other'],
    ),
    Question(
      questionText:
          'Do you use pornography as a way to cope with emotional discomfort or pain?',
      options: ['Yes,Often', 'Sometimes', 'Never'], //7
    ),
    Question(
      questionText:
          'Do you turn to pornography when you feel a lack of love in your life?',
      options: ['Yes', 'Sometimes', 'No'],
    ),
    Question(
      questionText: 'Do you watch pornography out of boredom?',
      options: ['Yes', 'Sometimes', 'No'],
    ),
    Question(
      questionText: 'Have you ever spent money on accessing explicit content?',
      options: ['Yes', 'No', 'Prefer not to say'],
    ),
    Question(
      questionText: 'Have you noticed a weird change in your attraction?',
      options: ['Yes Signigicantly', 'Slightly', 'No'],
    ),
    Question(
      questionText: 'Do you think your brain is damaged from pornography?',
      options: ['Yes', 'Maybe', 'No'],
    ),
    Question(
      questionText:
          'Do you feel lazy in the morning after masturbating the night before?',
      options: ['Yes', 'Sometimes', 'No'],
    ),
    Question(
      questionText:
          'Have you noticed growth in gynecomastia (male breast tissue)?',
      options: ['Yes', 'Sometimes', 'No'],
    ),
    Question(
      questionText:
          'Do you feel hopeless about your clean journey (trying to quit)?',
      options: ['Yes', 'Sometimes', 'No'],
    ),
  ];

  RxList<int> selectedOptions = RxList<int>(List.generate(15, (_) => -1));

  void selectOption(int optionIndex) {
    selectedOptions[questionNumber.value - 1] = optionIndex;

    if (questionNumber.value < questions.length) {
      questionNumber.value += 1;
      sliderValue.value = (questionNumber.value - 1).toDouble();
    } else {
      Get.off(RecoveryPlan());
    }
  }
}
