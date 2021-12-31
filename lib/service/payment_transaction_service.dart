import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/entity/payment/payment_transaction.dart';

abstract class PaymentTransactionService {
  Future<bool?> createPaymentTransaction(
      {required PaymentTransaction paymentTransaction,
      required RentalInvoice rentalInvoice});
}
