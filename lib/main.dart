import 'package:bike_rental/views/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller/bloc.dart';
import 'controller/detail_parking/detail_parking_bloc.dart';
import 'controller/payment/payment_bloc.dart';
import 'repository/repository.dart';

Future<void> main() async {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => HomeBloc(HomeRepository()),
    ),
    BlocProvider(
        create: (context) => DetailParkingBloc(
            detailParkingRepository: DetailParkingRepository())),
    BlocProvider(create: (context) => PaymentBloc(PaymentRepository())),
    // BlocProvider(create: (context) => RentBikeBloc()),
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
