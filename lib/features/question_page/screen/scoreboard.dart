// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/question_page/controller/scoreboard_controller.dart';
import 'package:lustless_hichim890/features/question_page/widget/gradinet_circular_progress.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/scoreboard_symtom_screen.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    final ScoreboardControllers scoreboardController = Get.put(
      ScoreboardControllers(),
    );
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.imageback),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.099),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'Analysis complete',
                  style: getTextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25),
              Obx(() {
                return Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CustomPaint(
                          painter: GradientCircularProgressPainter(
                            progress: scoreboardController.progressValue.value,
                          ),
                        ),
                      ),
                      Text(
                        "${(scoreboardController.progressValue.value * 100).toStringAsFixed(0)}%", 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xffF4A84B),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 25),
SizedBox(
  height: 213,
  child: LayoutBuilder(
    builder: (context, constraints) {
      final barChartHeight = constraints.maxHeight;
      final barChartWidth = constraints.maxWidth;

      final firstBarHeight = scoreboardController.firstBarValue.value * barChartHeight;
      final secondBarHeight = scoreboardController.secondBarValue.value * barChartHeight;

      final firstBarLeft = (barChartWidth / 2) - (67 + 15);
      final secondBarLeft = (barChartWidth / 2) + 15;

     
      const double fixedTextOffsetFromBarTop = 8;

   
      final firstBarTop = barChartHeight - firstBarHeight;
      final secondBarTop = barChartHeight - secondBarHeight;

    
      double firstBarTextTop = firstBarTop + fixedTextOffsetFromBarTop;
      double secondBarTextTop = secondBarTop + fixedTextOffsetFromBarTop;


      const double textHeight = 28;
      if (firstBarHeight < textHeight + fixedTextOffsetFromBarTop) {
        firstBarTextTop = barChartHeight - textHeight; 
      }
      if (secondBarHeight < textHeight + fixedTextOffsetFromBarTop) {
        secondBarTextTop = barChartHeight - textHeight;
      }

      return Stack(
        children: [
          BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: scoreboardController.firstBarValue.value,
                      width: 67,
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffEA0000),
                    ),
                    BarChartRodData(
                      toY: 0,
                      width: 31,
                      color: Colors.transparent,
                    ),
                    BarChartRodData(
                      toY: scoreboardController.secondBarValue.value,
                      width: 62,
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff008CFF),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            left: firstBarLeft,
            top: firstBarTextTop,
            width: 67,
            child: Container(
              height: textHeight,
              alignment: Alignment.center,
              child: Text(
                "${(scoreboardController.firstBarValue.value * 100).toStringAsFixed(0)}%",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Second Bar Percentage Text
          Positioned(
            left: secondBarLeft,
            top: secondBarTextTop,
            width: 62,
            child: Container(
              height: textHeight,
              alignment: Alignment.center,
              child: Text(
                "${(scoreboardController.secondBarValue.value * 100).toStringAsFixed(0)}%",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    },
  ),
),



              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Score',
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(width: 25),
                  Text(
                    ' Average',
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Text(
                      "${(scoreboardController.firstBarValue * 100).toStringAsFixed(0)}%", // Show percentage
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFF00000),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'higher dependence on porn',
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 31),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'This result is an indication only, not a medical diagnosis. For a definitive assessment, please contact your health care provider',
                  maxLines: 4,
                  style: getTextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    lineHeight: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {
                    Get.to(() => ScoreboardSymtomScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    height: screenHeight * 0.070,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Check your symptoms',
                        style: getTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff282828),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
