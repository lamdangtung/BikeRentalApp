part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class GetAllParkingEvent extends HomeEvent {}

class GetRentBikeEvent extends HomeEvent {
  final int invoiceId;
  const GetRentBikeEvent(this.invoiceId);
}
