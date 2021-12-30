import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/repository/payment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository paymentRepository;
  PaymentBloc(this.paymentRepository) : super(PaymentInitial());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is PayOrderEvent) {
      yield PaymentLoading();
      try {
        final res = await paymentRepository.payOrder(
            card: event.creditCard,
            contents: event.contents,
            amount: event.amount);
        if (res != null) {
          yield PaymentSuccess();
        } else {
          yield PaymentFail();
        }
      } catch (e) {
        yield PaymentError(e.toString());
      }
    }
  }
}
