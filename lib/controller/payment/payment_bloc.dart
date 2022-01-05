import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/repository/repository.dart';
import 'package:bike_rental/utils/api.dart';
import 'package:bike_rental/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository paymentRepository;
  PaymentBloc(this.paymentRepository) : super(PaymentInitial());

  @override
  mapEventToState(PaymentEvent event) async* {
    if (event is PayOrderEvent) {
      yield* _mapPayOrderEventToState(event);
    } else if (event is RefundEvent) {
      yield* _mapRefundEventToState(event);
    }
  }

  Stream<PaymentState> _mapPayOrderEventToState(PayOrderEvent event) async* {
    yield PayLoading();
    try {
      final res = await paymentRepository.payOrder(
          command: event.command,
          card: event.creditCard,
          contents: event.contents,
          amount: event.amount);
      if (res != null) {
        final rentalInvoice = await paymentRepository.createRentalInvoice(
            rentalInvoice: event.rentalInvoice);
        if (rentalInvoice != null) {
          final createdPaymentTransaction =
              await paymentRepository.createPaymentTransaction(
                  paymentTransaction: res, rentalInvoice: rentalInvoice);
          if (createdPaymentTransaction!) {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            if (event.contents == API.rentBikeContent) {
              await sharedPreferences.setInt(
                  Utils.invoiceId, rentalInvoice.id!);
            } else if (event.contents == API.returnBikeContent) {
              await sharedPreferences.clear();
            }
            yield PaySuccess();
          }
        }
      } else {
        yield PayFail();
      }
    } catch (e) {
      yield PayError(e.toString());
    }
  }

  Stream<PaymentState> _mapRefundEventToState(RefundEvent event) async* {
    yield RefundLoading();
    try {
      final res = await paymentRepository.refund(
          command: event.command,
          card: event.creditCard,
          contents: event.contents,
          amount: event.amount);
      if (res != null) {
        final rentalInvoice = await paymentRepository.createRentalInvoice(
            rentalInvoice: event.rentalInvoice);
        if (rentalInvoice != null) {
          final createdPaymentTransaction =
              await paymentRepository.createPaymentTransaction(
                  paymentTransaction: res, rentalInvoice: rentalInvoice);
          if (createdPaymentTransaction!) {
            yield RefundSuccess();
          }
        }
      } else {
        yield RefundFail();
      }
    } catch (e) {
      yield RefundError(e.toString());
    }
  }
}
