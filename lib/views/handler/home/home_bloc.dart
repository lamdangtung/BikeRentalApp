import 'dart:async';

import 'package:bike_rental/entity/parking/parking.dart';
import 'package:bike_rental/repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetAllParkingEvent) {
      yield* _mapGetAllParkingEventToState(event);
    }
  }

  Stream<HomeState> _mapGetAllParkingEventToState(
      GetAllParkingEvent event) async* {
    yield ParkingLoadingState();
    try {
      final List<Parking>? res = await homeRepository.getAllParking();
      if (res != null) {
        yield ParkingLoadedState(res);
      } else {
        yield ParkingFailState();
      }
    } catch (e) {
      yield ParkingErrorState(error: e.toString());
    }
  }
}
