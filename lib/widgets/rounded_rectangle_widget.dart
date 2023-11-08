import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_man/widgets/text_widget.dart';

class RoundedRectangleWidget extends StatelessWidget {
  const RoundedRectangleWidget({super.key, required this.label, this.color = Colors.amber});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: label.length == 11 ? 95.w : 80.w,
      height: 30,
      margin: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Center(
          child: TextWidget(
        label: label,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      )),
    );
  }
}
