part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PayOrderEvent extends PaymentEvent {
  final CreditCard creditCard;
  final int amount;
  final String contents;
  final RentalInvoice rentalInvoice;
  const PayOrderEvent(
      {required this.creditCard,
      required this.amount,
      required this.contents,
      required this.rentalInvoice});
}
