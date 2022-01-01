part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PayLoading extends PaymentState {}

class PaySuccess extends PaymentState {}

class PayFail extends PaymentState {}

class PayError extends PaymentState {
  final String error;

  const PayError(this.error);
}

class RefundLoading extends PaymentState {}

class RefundSuccess extends PaymentState {}

class RefundFail extends PaymentState {}

class RefundError extends PaymentState {
  final String error;

  const RefundError(this.error);
}
