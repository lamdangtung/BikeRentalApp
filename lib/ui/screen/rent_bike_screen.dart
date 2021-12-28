import 'package:bike_rental/configs/colors.dart';
import 'package:bike_rental/configs/images.dart';
import 'package:bike_rental/ui/screen/return_bike_screen.dart';
import 'package:bike_rental/ui/widgets/normal_button.dart';
import 'package:bike_rental/ui/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RentBikeScreen extends StatelessWidget {
  const RentBikeScreen({Key? key}) : super(key: key);

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
                      "Ecobike | Xe đang thuê",
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
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    TextHeader(
                        text: "Thông tin xe",
                        fontSize: 48.sp,
                        color: Colors.black),
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 150.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Loại xe: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Xe đạp đơn",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Mã vạch: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "ECO1234957472",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Biển số xe: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "ECO1234957472",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              // RichText(
                              //   text: TextSpan(
                              //       text: "Tên bãi xe: ",
                              //       style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 30.sp,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //       children: <TextSpan>[
                              //         TextSpan(
                              //           text: "Bãi xe Hài Bà Trưng",
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 26.sp,
                              //             fontWeight: FontWeight.normal,
                              //           ),
                              //         )
                              //       ]),
                              // ),
                              // SizedBox(
                              //   height: 20.h,
                              // ),

                              RichText(
                                text: TextSpan(
                                    text: "Lượng pin: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Không",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Thời gian: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "1 giờ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Đã đặt cọc: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "400.000",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Số tiền thuê: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "70.000",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50.h),
                      width: 270.w,
                      child: NormalButton(
                        text: "Trả xe",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReturnBikeScreen()));
                        },
                        color: Colors.green,
                        fontSize: 30.sp,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
