import 'package:bike_rental/repository/rent_bike_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rent_bike_event.dart';
part 'rent_bike_state.dart';

class RentBikeBloc extends Bloc<RentBikeEvent, RentBikeState> {
  final RentBikeRepository rentBikeRepository = RentBikeRepository();

  RentBikeBloc() : super(RentBikeInitial());

  @override
  Stream<RentBikeState> mapEventToState(RentBikeEvent event) async* {
    if (event is GetRentBikeEvent) {
      try {
        final res = await rentBikeRepository.getRentBike(event.invoiceId);
        if (res != null) {
          yield RentBikeLoaded(res);
        } else {
          yield RentBikeFail();
        }
      } catch (e) {
        print("GetRentBikeEvent -> error:${e.toString()}");
      }
    }
  }
}
