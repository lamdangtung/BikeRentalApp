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
  List<Parking> parkingList = Parking.listParking;
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
                      text: "Ecobike | Trả xe",
                      color: AppColors.pGreen,
                      fontSize: 48.sp,
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
