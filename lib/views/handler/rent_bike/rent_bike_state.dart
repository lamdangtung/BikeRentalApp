part of 'rent_bike_bloc.dart';

abstract class RentBikeState extends Equatable {
  const RentBikeState();
  @override
  List<Object> get props => [];
}

class RentBikeInitial extends RentBikeState {}

class RentBikeLoading extends RentBikeState {}

class RentBikeLoaded extends RentBikeState {
  Map<String, dynamic> res;
  RentBikeLoaded(this.res);
}

class RentBikeFail extends RentBikeState {}

class RentBikeError extends RentBikeState {}
