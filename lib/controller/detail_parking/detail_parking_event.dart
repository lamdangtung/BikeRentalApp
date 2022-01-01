part of 'detail_parking_bloc.dart';

abstract class DetailParkingEvent extends Equatable {
  const DetailParkingEvent();

  @override
  List<Object> get props => [];
}

class GetAllBikeByParkingIdEvent extends DetailParkingEvent {
  final String parkingId;

  const GetAllBikeByParkingIdEvent({required this.parkingId});
}
