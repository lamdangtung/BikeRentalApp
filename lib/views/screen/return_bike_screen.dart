import 'package:bike_rental/entity/parking.dart';
import 'package:bike_rental/utils/colors.dart';
import 'package:bike_rental/utils/images.dart';
import 'package:bike_rental/views/widgets/return_bike_parking_item.dart';
import 'package:bike_rental/views/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'detail_parking_screen.dart';

class ReturnBikeScreen extends StatefulWidget {
  const ReturnBikeScreen({Key? key}) : super(key: key);

  @override
  State<ReturnBikeScreen> createState() => _ReturnBikeScreenState();
}

class _ReturnBikeScreenState extends State<ReturnBikeScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();
  List<Parking> parkingList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFefebe9),
      body: Container(
        child: Column(
          children: <Widget>[
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
                    child: TextHeader(
                      text: "Ecobike",
                      color: AppColors.pGreen,
                      fontSize: 48.sp,
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
                  Container(
                    height: 50.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF05ff2e),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Text(
                        "Tìm kiếm bãi xe",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 50.w),
                    child: Image.asset(
                      AppImages.imgRentBike,
                      width: 60.w,
                      height: 60.h,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(20.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: parkingList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 1,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                  ),
                  itemBuilder: (_, i) {
                    return ReturnParkingItem(
                        onTap: () {
                          // Navigator.pushNamed(context, "/detail_parking");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailParkingScreen(
                                        parking: parkingList[i],
                                      )));
                        },
                        parking: parkingList[i]);
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
