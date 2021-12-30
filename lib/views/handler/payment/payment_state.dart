part of 'payment_controller.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {}

class PaymentFail extends PaymentState {}

class PaymentError extends PaymentState {
  final String error;

  PaymentError(this.error);
}
