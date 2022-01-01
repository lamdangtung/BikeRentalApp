import 'package:bike_rental/entity/bike/bike.dart';
import 'package:bike_rental/repository/detail_parking_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_parking_event.dart';
part 'detail_parking_state.dart';

class DetailParkingBloc extends Bloc<DetailParkingEvent, DetailParkingState> {
  final DetailParkingRepository detailParkingRepository;
  DetailParkingBloc({required this.detailParkingRepository})
      : super(DetailParkingInitial());

  @override
  Stream<DetailParkingState> mapEventToState(DetailParkingEvent event) async* {
    if (event is GetAllBikeByParkingIdEvent) {
      yield BikeLoadingState();
      try {
        final res = await detailParkingRepository
            .getAllBikeByParkingId(event.parkingId);
        if (res != null) {
          yield BikeLoadedState(listBike: res);
        } else {
          yield BikeFailState();
        }
      } catch (e) {
        yield BikeErrorState(error: e.toString());
      }
    }
  }
}
