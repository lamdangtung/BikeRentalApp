import 'package:bike_rental/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const BikeRentalApp());
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
