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
  const ParkingErrorState({required this.error});
}

class RentBikeLoading extends HomeState {}

class RentBikeLoaded extends HomeState {
  Map<String, dynamic> res;
  RentBikeLoaded(this.res);
}

class RentBikeFail extends HomeState {}

class RentBikeError extends HomeState {
  final String error;
  const RentBikeError({required this.error});
}
