import 'package:bike_rental/repository/detail_parking_repository.dart';
import 'package:bike_rental/repository/payment_repository.dart';
import 'package:bike_rental/service/detail_parking_remote_service.dart';
import 'package:bike_rental/views/handler/detail_parking/detail_parking_bloc.dart';
import 'package:bike_rental/views/handler/payment/payment_bloc.dart';
import 'package:bike_rental/views/handler/rent_bike/rent_bike_bloc.dart';
import 'package:bike_rental/views/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'repository/home_repository.dart';
import 'service/home_remote_service.dart';
import 'views/handler/home/home_bloc.dart';

Future<void> main() async {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) =>
          HomeBloc(HomeRepository(homeService: HomeRemoteService())),
    ),
    BlocProvider(
        create: (context) => DetailParkingBloc(
            detailParkingRepository: DetailParkingRepository(
                detailParkingRemoteService: DetailParkingRemoteService()))),
    BlocProvider(create: (context) => PaymentBloc(PaymentRepository())),
    BlocProvider(create: (context) => RentBikeBloc()),
  ], child: const BikeRentalApp()));
}

class BikeRentalApp extends StatelessWidget {
  const BikeRentalApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1336, 768),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bike Rental App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: <String, WidgetBuilder>{
          "/home": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
