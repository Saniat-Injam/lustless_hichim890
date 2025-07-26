import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';

class HCheckinoption extends StatelessWidget {
  final String number;
  final String labels;
  final Color circleColor;
  final Color textColor;
  final bool isSelected;
  final VoidCallback onTap;

  const HCheckinoption({
    required this.number,
    required this.labels,
    required this.circleColor,
    required this.textColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isSelected
                      ? Colors.white
                      : Color(0xff133663), // Border color white when selected
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Color(0xff071123),
            boxShadow: [BoxShadow(blurRadius: 30)],
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: circleColor,
                child: Text(
                  number,
                  style: getTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Text(
                labels,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
