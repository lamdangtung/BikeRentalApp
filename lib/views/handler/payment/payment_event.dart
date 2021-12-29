part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PayOrderEvent extends PaymentEvent {
  CreditCard creditCard;
  String command;
  int amount;
  String createdAt;

  PayOrderEvent(this.creditCard, this.command, this.amount, this.createdAt);
}
