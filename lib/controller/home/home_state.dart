import 'package:bike_rental/data/models/parking.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ParkingLoadingState extends HomeState {}

class ParkingLoadedState extends HomeState {
  final List<Parking> listParking;

  ParkingLoadedState(this.listParking);
}

class ParkingFailState extends HomeState {}

class ParkingErrorState extends HomeState {
  final String error;
  ParkingErrorState({required this.error});
}
