import 'package:bike_rental/controller/bloc.dart';
import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/entity/parking/parking.dart';
import 'package:bike_rental/utils/colors.dart';
import 'package:bike_rental/utils/images.dart';
import 'package:bike_rental/utils/utils.dart';
import 'package:bike_rental/views/screen/detail_parking_screen.dart';
import 'package:bike_rental/views/screen/rent_bike_screen.dart';
import 'package:bike_rental/views/widgets/parking_item.dart';
import 'package:bike_rental/views/widgets/text_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();
  List<Parking> parkingList = [];
  late Bike rentBike;
  late RentalInvoice rentalInvoice;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetAllParkingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ParkingLoadingState) {
          print("ParkingLoadingState");
        } else if (state is ParkingLoadedState) {
          print("ParkingLoadedState");
          parkingList = state.listParking;
          Parking.listParking = parkingList;
        } else if (state is ParkingFailState) {
          print("ParkingErrorState");
        } else if (state is RentBikeLoading) {
          print("RentBikeLoading");
        } else if (state is RentBikeLoaded) {
          print("RentBikeLoaded");
          rentBike = state.res["rent_bike"];
          rentalInvoice = state.res["rental_invoice"];
          if (rentBike != null && rentalInvoice != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RentBikeScreen(
                          rentBike: rentBike,
                          rentalInvoice: rentalInvoice,
                        )));
          }
        } else if (state is RentBikeFail) {
          print("RentBikeFail");
        }
      },
      builder: (context, state) {
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
                        decoration: const InputDecoration(
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
                        color: const Color(0xFF05ff2e),
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
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        int? invoiceId =
                            sharedPreferences.getInt(Utils.invoiceId);
                        if (invoiceId != null) {
                          BlocProvider.of<HomeBloc>(context)
                              .add(GetRentBikeEvent(invoiceId));
                        } else {
                          Fluttertoast.showToast(
                              msg: "No Rent Bike",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.00);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 50.w),
                        child: Image.asset(
                          AppImages.imgRentBike,
                          width: 60.w,
                          height: 60.h,
                        ),
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
                      return ParkingItem(
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
        );
      },
    );
  }
}
