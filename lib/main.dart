import 'package:bike_rental/controller/home/home_bloc.dart';
import 'package:bike_rental/data/repository/home_repository.dart';
import 'package:bike_rental/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/service/home_remote_service.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) =>
          HomeBloc(HomeRepository(homeService: HomeRemoteService())),
    ),
  ], child: const BikeRentalApp()));
}

class BikeRentalApp extends StatelessWidget {
  const BikeRentalApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1336, 768),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bike Rental App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: <String, WidgetBuilder>{
          "/home": (context) => HomeScreen(),
        },
      ),
    );
  }
}
