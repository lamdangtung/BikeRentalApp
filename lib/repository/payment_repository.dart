import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';
import 'package:bike_rental/service/payment_transaction_remote_service.dart';
import 'package:bike_rental/service/payment_transaction_service.dart';
import 'package:bike_rental/service/rental_invoice_remote_service.dart';
import 'package:bike_rental/service/rental_invoice_service.dart';
import 'package:bike_rental/subsystem/interbank_interface.dart';
import 'package:bike_rental/subsystem/interbank_subsystem.dart';

class PaymentRepository
    implements
        InterbankInterface,
        RentalInvoiceSerVice,
        PaymentTransactionService {
  final InterbankSubsystem interbankSubsystem = InterbankSubsystem();
  final RentalInvoiceSerVice rentalInvoiceSerVice =
      RentalInvoiceRemoteService();
  final PaymentTransactionService paymentTransactionService =
      PaymentTransactionRemoteService();
  PaymentRepository();

  @override
  Future<PaymentTransaction?> payOrder(
      {required CreditCard card,
      required int amount,
      required String contents}) async {
    return await interbankSubsystem.payOrder(
      amount: amount,
      card: card,
      contents: contents,
    );
  }

  @override
  Future<RentalInvoice?> createRentalInvoice(
      {required RentalInvoice rentalInvoice}) async {
    return await rentalInvoiceSerVice.createRentalInvoice(
        rentalInvoice: rentalInvoice);
  }

  @override
  Future<bool?> createPaymentTransaction(
      {required PaymentTransaction paymentTransaction,
      required RentalInvoice rentalInvoice}) async {
    return await paymentTransactionService.createPaymentTransaction(
        paymentTransaction: paymentTransaction, rentalInvoice: rentalInvoice);
  }
}
