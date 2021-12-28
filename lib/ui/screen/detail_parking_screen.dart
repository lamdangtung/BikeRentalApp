import 'package:bike_rental/configs/colors.dart';
import 'package:bike_rental/configs/images.dart';
import 'package:bike_rental/data/models/bike.dart';
import 'package:bike_rental/data/models/parking.dart';
import 'package:bike_rental/ui/screen/confirm_rent_bike_screen.dart';
import 'package:bike_rental/ui/widgets/bike_item.dart';
import 'package:bike_rental/ui/widgets/normal_button.dart';
import 'package:bike_rental/ui/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailParkingScreen extends StatefulWidget {
  final Parking parking;
  const DetailParkingScreen({Key? key, required this.parking})
      : super(key: key);

  @override
  State<DetailParkingScreen> createState() => _DetailParkingScreenState();
}

class _DetailParkingScreenState extends State<DetailParkingScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();
  List<Bike> listBike = [];
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
                      "Ecobike | Bãi xe",
                      style: TextStyle(
                        fontSize: 48.sp,
                        color: Color(0xFF05ff2e),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    margin: EdgeInsets.only(left: 50.w, right: 20.w),
                    height: 50.h,
                    width: 500.w,
                    child: TextFormField(
                      controller: searchTextEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  NormalButton(
                    text: 'Thuê xe',
                    onTap: () {},
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: ScreenUtil.defaultSize.height,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      width: 520.w,
                      child: Column(
                        children: [
                          TextHeader(
                              text: "Thông tin bãi xe",
                              fontSize: 28.sp,
                              color: Colors.black),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Tên bãi xe: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "${widget.parking.name}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Địa chỉ: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "${widget.parking.address}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Diện tích: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "${widget.parking.area} m2",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextHeader(
                                  text: "Xe đang có:",
                                  fontSize: 24.sp,
                                  color: Colors.black),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: "Xe đạp đơn: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "${widget.parking.numSingle}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "Xe đạp đôi: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "${widget.parking.numCouple}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "Xe đạp điện: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "${widget.parking.numElectric}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextHeader(
                                  text: "Vị trí trống:",
                                  fontSize: 24.sp,
                                  color: Colors.black),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: "Xe đạp đơn: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "${widget.parking.emptySingle}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "Xe đạp đôi: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "${widget.parking.emptyCouple}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "Xe đạp điện: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "${widget.parking.emptyElectric}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: listBike.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 1,
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 10.w),
                            itemBuilder: (_, i) {
                              return BikeItem(
                                bike: listBike[i],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ConfirmRentBikeScreen(
                                                  bike: listBike[i])));
                                },
                              );
                            }),
                      ),
                    )
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
