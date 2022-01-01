import 'package:bike_rental/entity/parking/parking.dart';
import 'package:bike_rental/views/widgets/normal_button.dart';
import 'package:bike_rental/views/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturnParkingItem extends StatefulWidget {
  final Parking parking;
  final GestureTapCallback onTap;
  const ReturnParkingItem({
    Key? key,
    required this.parking,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ReturnParkingItem> createState() => _ReturnParkingItemState();
}

class _ReturnParkingItemState extends State<ReturnParkingItem> {
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
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextHeader(
                          text: "Vị trí trống",
                          fontSize: 24.sp,
                          color: Colors.black),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: RichText(
                          text: TextSpan(
                              text: "Xe đạp đơn:  ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: (int.parse(widget.parking.numSingle) -
                                          widget.parking.numFreeSingle)
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: RichText(
                          text: TextSpan(
                              text: "Xe đạp đôi:  ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: (int.parse(widget.parking.numCouple) -
                                          widget.parking.numFreeCouple)
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: RichText(
                          text: TextSpan(
                              text: "Xe đạp điện:  ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: (int.parse(widget.parking.numElectric) -
                                          widget.parking.numFreeElectric)
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 20.w),
                    child: NormalButton(
                      height: 35.h,
                      text: "Xác nhận trả xe",
                      onTap: () {
                        if ((int.parse(widget.parking.numElectric) -
                                    widget.parking.numFreeElectric) >=
                                1 ||
                            (int.parse(widget.parking.numCouple) -
                                        widget.parking.numFreeCouple) >=
                                    1 &&
                                (int.parse(widget.parking.numSingle) -
                                        widget.parking.numFreeSingle) >=
                                    1) widget.onTap();
                      },
                      fontSize: 18.sp,
                      color: Colors.green,
                    ),
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
