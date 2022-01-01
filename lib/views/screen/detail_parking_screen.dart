import 'package:bike_rental/controller/detail_parking/detail_parking_bloc.dart';
import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/entity/parking/parking.dart';
import 'package:bike_rental/utils/colors.dart';
import 'package:bike_rental/utils/images.dart';
import 'package:bike_rental/views/screen/confirm_rent_bike_screen.dart';
import 'package:bike_rental/views/widgets/bike_item.dart';
import 'package:bike_rental/views/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailParkingScreen extends StatefulWidget {
  final Parking parking;
  const DetailParkingScreen({Key? key, required this.parking})
      : super(key: key);

  @override
  State<DetailParkingScreen> createState() => _DetailParkingScreenState();
}

class _DetailParkingScreenState extends State<DetailParkingScreen> {
  final TextEditingController barCodeTextEditingController =
      TextEditingController();
  List<Bike> listBike = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailParkingBloc>(context)
        .add(GetAllBikeByParkingIdEvent(parkingId: widget.parking.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailParkingBloc, DetailParkingState>(
      listener: (context, state) {
        if (state is BikeLoadingState) {
          print("BikeLoadingState");
        } else if (state is BikeLoadedState) {
          print("BikeLoadedState");
          listBike = state.listBike;
        } else if (state is BikeFailState) {
          print("BikeFailState");
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          resizeToAvoidBottomInset: false,
          body: Column(
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
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                        ),
                        padding: EdgeInsets.all(30.w),
                        margin: EdgeInsets.only(right: 10.w),
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
                                          text: widget.parking.name,
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
                                          text: widget.parking.address,
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
                                    text: "Sức chứa:",
                                    fontSize: 24.sp,
                                    color: Colors.black),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                text: widget.parking.numSingle,
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
                                                text: widget.parking.numCouple,
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
                                                    widget.parking.numElectric,
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
                                    text: "Xe khả dụng:",
                                    fontSize: 24.sp,
                                    color: Colors.black),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                text: widget
                                                    .parking.numFreeSingle
                                                    .toString(),
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
                                                text: widget
                                                    .parking.numFreeCouple
                                                    .toString(),
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
                                                text: widget
                                                    .parking.numFreeElectric
                                                    .toString(),
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
        );
      },
    );
  }
}
