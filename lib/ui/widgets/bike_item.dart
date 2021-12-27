import 'package:bike_rental/models/bike.dart';
import 'package:bike_rental/ui/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BikeItem extends StatefulWidget {
  final Bike bike;
  final GestureTapCallback onTap;
  const BikeItem({
    Key? key,
    required this.bike,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BikeItem> createState() => _BikeItemState();
}

class _BikeItemState extends State<BikeItem> {
  late final String bikeType;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 10.h),
        height: 200.h,
        color: Colors.grey.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextHeader(
                text: "Xe đạp đơn", fontSize: 28.sp, color: Colors.black),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  text: TextSpan(
                      text: "Mã vạch: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${widget.bike.barcode}",
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
                      text: "Loại xe: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Xe đạp đơn",
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
                      text: "Lượng pin: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Không",
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    switch (widget.bike.category) {
      case "XE_DAP_DON":
        bikeType = "Xe đạp đơn";
        break;
      case "XE_DAP_DOI":
        bikeType = "Xe đạp đôi";
        break;
      case "XE_DAP_DIEN":
        bikeType = "Xe đạp điện";
        break;
    }
  }
}
