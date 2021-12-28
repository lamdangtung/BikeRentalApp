part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ParkingLoadingState extends HomeState {}

class ParkingLoadedState extends HomeState {
  final List<Parking> listParking;

  const ParkingLoadedState(this.listParking);
}

class ParkingFailState extends HomeState {}

class ParkingErrorState extends HomeState {
  final String error;
  ParkingErrorState({required this.error});
}
