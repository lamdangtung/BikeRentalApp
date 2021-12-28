import 'package:bike_rental/configs/colors.dart';
import 'package:bike_rental/configs/images.dart';
import 'package:bike_rental/ui/screen/result_screen.dart';
import 'package:bike_rental/ui/widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedValue = 0;

  var cardNumberTextEditingController = TextEditingController();

  var secretNumberTextEditingController;

  var expiredDateTextEditingController;
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
            Expanded(
              child: Container(
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 100.w),
                            child: Text(
                              "Phương thức thanh toán",
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 120.w),
                            child: Row(children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Radio<int>(
                                  value: 1,
                                  groupValue: selectedValue,
                                  onChanged: (value) =>
                                      setState(() => selectedValue = 1),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Thẻ tín dụng",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Số thẻ:",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24.sp,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey,
                                        style: BorderStyle.solid)),
                                width: 500.w,
                                child: TextFormField(
                                  controller: secretNumberTextEditingController,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ngày hết hạn:",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24.sp,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                width: 500.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey,
                                        style: BorderStyle.solid)),
                                child: TextFormField(
                                  controller: secretNumberTextEditingController,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Số thẻ:",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24.sp,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                width: 500.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey,
                                        style: BorderStyle.solid)),
                                child: TextFormField(
                                  controller: secretNumberTextEditingController,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mã bảo mật:",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24.sp,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                width: 500.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey,
                                        style: BorderStyle.solid)),
                                child: TextFormField(
                                  controller: secretNumberTextEditingController,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50.h),
                    alignment: Alignment.center,
                    width: 400.w,
                    child: NormalButton(
                      text: "Xác nhận thanh toán",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen()));
                      },
                      fontSize: 30.sp,
                      color: Colors.green,
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
