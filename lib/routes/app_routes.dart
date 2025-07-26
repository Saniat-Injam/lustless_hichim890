import 'package:get/get.dart';
import 'package:lustless_hichim890/features/checkin/screen/h_checkin.dart';
import 'package:lustless_hichim890/features/community/screen/community_screen.dart';
import 'package:lustless_hichim890/features/home/screen/h_relapsed.dart';
import 'package:lustless_hichim890/features/home/screen/home.dart';
import 'package:lustless_hichim890/features/journal_screen/screen/jurnal_save_confirmation.dart';
import 'package:lustless_hichim890/features/question_page/screen/final_question.dart';
import 'package:lustless_hichim890/features/question_page/screen/recovery_plan.dart';
import 'package:lustless_hichim890/features/question_page/screen/scoreboard.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/screens/mood_check.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/screens/sleep_plan_today.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/screens/sleep_priority.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/screens/sleep_tracking.dart';
import 'package:lustless_hichim890/features/splasho_screen/screen/splasho_screen.dart';

class AppRoute {
  static String splashoScreen = "/splashoScreen";
  static String newFinalQuestion = '/newFinalQuestion';
  static String recoveryPlan = '/recoveryPlan';
  static String scoreboard = '/scoreboard';
  static String home = '/home';
  static String homerelapsed = '/homerelapsed';
  static String communityScreen = '/communityScreen';

  static String homeCheckIn = '/homecheckIn';

  static String moodCheck = '/moodCheck';
  static String sleepTracking = '/sleepTracking';
  static String sleepPriority = '/sleepPriority';
  static String sleepPlanToday = '/sleepPlanToday';
  static String saveConfirmation = '/saveConfirmation';

  static String getsplashoScreen() => splashoScreen;
  static String getcommunityScreen() => communityScreen;
  static String getmoodCheck() => moodCheck;
  static String getsleepTracking() => sleepTracking;
  static String getsleepPriority() => sleepPriority;
  static String getsleepPlanToday() => sleepPlanToday;

  static List<GetPage> routes = [
    GetPage(name: splashoScreen, page: () => const SplashoScreen()),
    GetPage(name: newFinalQuestion, page: () => const FinalQuestion()),
    GetPage(name: recoveryPlan, page: () => const RecoveryPlan()),
    GetPage(name: scoreboard, page: () => const Scoreboard()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: homerelapsed, page: () => HomeRelapesd()),
    GetPage(name: communityScreen, page: () => CommunityScreen()),

    GetPage(name: homeCheckIn, page: () => HomeCheckIn()),

    GetPage(name: moodCheck, page: () => MoodCheck()),
    GetPage(name: sleepTracking, page: () => SleepTracking()),
    GetPage(name: sleepPriority, page: () => SleepPriority()),
    GetPage(name: sleepPlanToday, page: () => SleepPlanToday()),
    GetPage(
      name: saveConfirmation,
      page: () => JurnalSaveConfirmation(time: '', message: ''),
    ),
  ];
}
