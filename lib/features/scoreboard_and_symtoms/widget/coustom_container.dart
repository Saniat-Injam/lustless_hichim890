import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';

class CoustomContainer extends StatelessWidget {
  final String image;
  final String text;
  final int groupValue;
  final int value;
  final void Function(int? value) onChanged;
  final Color? color;
  const CoustomContainer({
    super.key,
    required this.image,
    required this.text,
    required this.onChanged,
    required this.value,
    required this.groupValue,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.only(left: 10),
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image, fit: BoxFit.cover, height: 28),
                SizedBox(width: 8),
                Text(
                  text,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBackground,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Radio(
              hoverColor: Colors.amberAccent,
              toggleable: true,
              activeColor: AppColors.primaryBackground,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
