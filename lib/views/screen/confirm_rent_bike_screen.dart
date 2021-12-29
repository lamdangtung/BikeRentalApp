import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/entity/parking.dart';
import 'package:bike_rental/utils/colors.dart';
import 'package:bike_rental/utils/images.dart';
import 'package:bike_rental/views/screen/payment_screen.dart';
import 'package:bike_rental/views/widgets/normal_button.dart';
import 'package:bike_rental/views/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmRentBikeScreen extends StatefulWidget {
  final Bike bike;
  const ConfirmRentBikeScreen({Key? key, required this.bike}) : super(key: key);

  @override
  State<ConfirmRentBikeScreen> createState() => _ConfirmRentBikeScreenState();
}

class _ConfirmRentBikeScreenState extends State<ConfirmRentBikeScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
                      "Ecobike | Thuê xe",
                      style: TextStyle(
                        fontSize: 48.sp,
                        color: const Color(0xFF05ff2e),
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
                                        text: Bike.getBikeType(
                                            widget.bike.category),
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
                                        text: widget.bike.barcode,
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
                                    text: "Tên bãi xe: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: Parking.getParkingName(
                                            widget.bike.parkingId),
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
                                    text: "Lượng pin: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: widget.bike.battery ?? "Không",
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
                                    text: "Biển số xe: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: widget.bike.licenseplate,
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
                                    text: "Đặt cọc: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: widget.bike.deposite,
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
                                    "Giá thuê: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "< 10 phút: Miễn phí\n30 phút đầu: 15.000 VND\n15 phút tiếp ( lũy tiến): ${widget.bike.rentalPrice}.000 VND",
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
                        text: "Thuê xe",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentScreen()));
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
