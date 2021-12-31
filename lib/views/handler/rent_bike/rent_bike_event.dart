part of 'rent_bike_bloc.dart';

abstract class RentBikeEvent extends Equatable {
  const RentBikeEvent();

  @override
  List<Object> get props => [];
}

class GetRentBikeEvent extends RentBikeEvent {
  int invoiceId;
  GetRentBikeEvent(this.invoiceId);
}
