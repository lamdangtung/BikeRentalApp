import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/utils/colors.dart';
import 'package:bike_rental/utils/images.dart';
import 'package:bike_rental/views/handler/rent_bike/rent_bike_bloc.dart';
import 'package:bike_rental/views/screen/return_bike_screen.dart';
import 'package:bike_rental/views/widgets/normal_button.dart';
import 'package:bike_rental/views/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RentBikeScreen extends StatefulWidget {
  final int invoiceId;

  const RentBikeScreen({Key? key, required this.invoiceId}) : super(key: key);

  @override
  State<RentBikeScreen> createState() => _RentBikeScreenState();
}

class _RentBikeScreenState extends State<RentBikeScreen> {
  Bike? rentBike;
  RentalInvoice? rentalInvoice;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RentBikeBloc>(context)
        .add(GetRentBikeEvent(widget.invoiceId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RentBikeBloc, RentBikeState>(
      listener: (context, state) {
        if (state is RentBikeLoaded) {
          rentBike = state.res["rent_bike"];
          rentalInvoice = state.res["rental_invoice"];
        } else if (state is RentBikeFail) {}
      },
      builder: (context, state) {
        if (state is RentBikeLoaded || state is RentBikeFail) {
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
                          "Ecobike | Xe đang thuê",
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
                                                rentBike!.category),
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
                                            text: rentBike!.barcode,
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
                                            text: rentBike!.licenseplate,
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
                                            text: rentBike!.battery ?? "Không",
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
                                            text: rentBike!.deposite,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        rentBike!
                                            .caculateRentalAmount(60)
                                            .toString(),
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
                                      builder: (context) =>
                                          const ReturnBikeScreen()));
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
          );
        } else {
          return Container();
        }
      },
    );
  }
}
