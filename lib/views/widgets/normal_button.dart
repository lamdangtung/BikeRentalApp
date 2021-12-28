import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  Color? color;
  double? fontSize;
  double? height;
  NormalButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color,
      this.fontSize,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? Color(0xFF05ff2e),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Text(
            text,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: fontSize ?? 24.sp,
            ),
          ),
        ),
      ),
    );
  }
}
