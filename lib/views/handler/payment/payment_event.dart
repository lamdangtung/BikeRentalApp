part of 'payment_controller.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PayOrderEvent extends PaymentEvent {
  CreditCard creditCard;
  int amount;
  String contents;

  PayOrderEvent(
      {required this.creditCard, required this.amount, required this.contents});
}
