import 'package:bike_rental/configs/images.dart';
import 'package:bike_rental/models/parking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParkingItem extends StatefulWidget {
  final Parking parking;
  final GestureTapCallback onTap;
  const ParkingItem({
    Key? key,
    required this.parking,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ParkingItem> createState() => _ParkingItemState();
}

class _ParkingItemState extends State<ParkingItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 15.h),
            Text(
              widget.parking.name,
              style: TextStyle(
                fontSize: 24.sp,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              widget.parking.address,
              style: TextStyle(
                fontSize: 20.sp,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.img_logo,
                    width: 100.w,
                    height: 100.h,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Xe đạp đơn:  ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${widget.parking.singleBike}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Xe đạp đôi:  ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${widget.parking.coupleBike}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Xe đạp điện:  ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${widget.parking.electricBike}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ]),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
