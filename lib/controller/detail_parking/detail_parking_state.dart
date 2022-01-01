part of 'detail_parking_bloc.dart';

abstract class DetailParkingState extends Equatable {
  const DetailParkingState();
  @override
  List<Object> get props => [];
}

class DetailParkingInitial extends DetailParkingState {}

class BikeLoadingState extends DetailParkingState {}

class BikeLoadedState extends DetailParkingState {
  final List<Bike> listBike;

  const BikeLoadedState({required this.listBike});
}

class BikeFailState extends DetailParkingState {}

class BikeErrorState extends DetailParkingState {
  final String error;
  const BikeErrorState({required this.error});
}
