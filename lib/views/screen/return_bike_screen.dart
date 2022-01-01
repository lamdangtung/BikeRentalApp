import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/entity/parking/parking.dart';
import 'package:bike_rental/utils/colors.dart';
import 'package:bike_rental/utils/images.dart';
import 'package:bike_rental/views/screen/payment_screen.dart';
import 'package:bike_rental/views/widgets/return_bike_parking_item.dart';
import 'package:bike_rental/views/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturnBikeScreen extends StatefulWidget {
  final Bike rentBike;
  final RentalInvoice rentalInvoice;
  const ReturnBikeScreen(
      {Key? key, required this.rentBike, required this.rentalInvoice})
      : super(key: key);

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
      backgroundColor: const Color(0xFFefebe9),
      body: Column(
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
                        widget.rentalInvoice.parkingId =
                            int.parse(parkingList[i].id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                    refundAmount:
                                        int.parse(widget.rentBike.deposite),
                                    rentalInvoice: widget.rentalInvoice)));
                      },
                      parking: parkingList[i]);
                }),
          ))
        ],
      ),
    );
  }
}
