import 'package:bike_rental/utils/colors.dart';
import 'package:bike_rental/utils/images.dart';
import 'package:bike_rental/views/widgets/normal_button.dart';
import 'package:bike_rental/views/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatefulWidget {
  final String message;
  const ResultScreen({Key? key, required this.message}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 150.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: Image.asset(
                      AppImages.imgLogo,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Text(
                      "Ecobike | Thanh toán",
                      style: TextStyle(
                        fontSize: 48.sp,
                        color: Color(0xFF05ff2e),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            TextHeader(
                text: "Thanh toán thành công",
                fontSize: 48.sp,
                color: AppColors.pGreen),
            SizedBox(
              height: 150.h,
            ),
            Text(
              widget.message,
              style: TextStyle(
                fontSize: 30.sp,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Container(
                height: 60.h,
                width: 200.w,
                child: NormalButton(
                    text: "OK",
                    onTap: () {
                      Navigator.pushNamed(context, "/home");
                    })),
          ],
        ),
      ),
    );
  }
}
