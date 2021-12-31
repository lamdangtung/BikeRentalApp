import 'package:bike_rental/entity/invoice/rental_invoice.dart';

abstract class RentalInvoiceSerVice {
  Future<RentalInvoice?> createRentalInvoice(
      {required RentalInvoice rentalInvoice});
}
