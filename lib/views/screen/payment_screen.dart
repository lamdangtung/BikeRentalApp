import 'package:bike_rental/controller/payment/payment_bloc.dart';
import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/utils/api.dart';
import 'package:bike_rental/utils/colors.dart';
import 'package:bike_rental/utils/images.dart';
import 'package:bike_rental/views/screen/result_screen.dart';
import 'package:bike_rental/views/widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  final int? refundAmount;
  final RentalInvoice rentalInvoice;
  const PaymentScreen(
      {Key? key, required this.rentalInvoice, this.refundAmount})
      : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedValue = 0;

  final TextEditingController cardNumberTextEditingController =
      TextEditingController();

  final TextEditingController secretNumberTextEditingController =
      TextEditingController();

  final TextEditingController expiredDateTextEditingController =
      TextEditingController();

  final TextEditingController ownerTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.refundAmount);
    print(widget.rentalInvoice.toString());
    cardNumberTextEditingController.text = "kscq1_group14_2021";
    ownerTextEditingController.text = "Group 14";
    secretNumberTextEditingController.text = "786";
    expiredDateTextEditingController.text = "1125";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state is PayLoading) {
          print("PayLoading");
        } else if (state is PaySuccess) {
          print("PaySuccess");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ResultScreen(
                        message: "Th??nh c??ng",
                      )));
        } else if (state is PayFail) {
          print("PayFail");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ResultScreen(
                        message: "Th???t b???i",
                      )));
        } else if (state is RefundLoading) {
          print("RefundLoading");
        } else if (state is RefundSuccess) {
          print("RefundSuccess");
        } else if (state is RefundFail) {
          print("RefundFail");
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 150.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 50.w),
                        child: Image.asset(
                          AppImages.imgLogo,
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Text(
                          "Ecobike | Thanh to??n",
                          style: TextStyle(
                            fontSize: 48.sp,
                            color: const Color(0xFF05ff2e),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 100.w),
                                    child: Text(
                                      "Ph????ng th???c thanh to??n",
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 120.w),
                                    child: Row(children: [
                                      Transform.scale(
                                        scale: 1.5,
                                        child: Radio<int>(
                                          value: 1,
                                          groupValue: selectedValue,
                                          onChanged: (value) =>
                                              setState(() => selectedValue = 1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "Th??? t??n d???ng",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "S??? th???:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 24.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey,
                                                style: BorderStyle.solid)),
                                        width: 500.w,
                                        child: TextFormField(
                                          controller:
                                              cardNumberTextEditingController,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ng??y h???t h???n:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 24.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 500.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey,
                                                style: BorderStyle.solid)),
                                        child: TextFormField(
                                          controller:
                                              expiredDateTextEditingController,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ch??? th???:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 24.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 500.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey,
                                                style: BorderStyle.solid)),
                                        child: TextFormField(
                                          controller:
                                              ownerTextEditingController,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "M?? b???o m???t:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 24.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 500.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey,
                                                style: BorderStyle.solid)),
                                        child: TextFormField(
                                          controller:
                                              secretNumberTextEditingController,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 50.h),
                            alignment: Alignment.center,
                            width: 400.w,
                            child: NormalButton(
                              text: "X??c nh???n thanh to??n",
                              onTap: () {
                                CreditCard card = CreditCard(
                                    cardCode:
                                        cardNumberTextEditingController.text,
                                    cvvCode:
                                        secretNumberTextEditingController.text,
                                    dateExpired:
                                        expiredDateTextEditingController.text,
                                    owner: ownerTextEditingController.text);
                                if (card.checkCreditCardFormat()) {
                                  if (widget.refundAmount != null) {
                                    BlocProvider.of<PaymentBloc>(context)
                                        .add(RefundEvent(
                                      rentalInvoice: widget.rentalInvoice,
                                      command: API.commandRefund,
                                      contents: "refund",
                                      amount: widget.refundAmount!,
                                      creditCard: card,
                                    ));
                                    BlocProvider.of<PaymentBloc>(context)
                                        .add(PayOrderEvent(
                                      command: API.commandPay,
                                      creditCard: card,
                                      contents: "return bike",
                                      amount: widget.rentalInvoice.totalPrice,
                                      rentalInvoice: widget.rentalInvoice,
                                    ));
                                  } else {
                                    BlocProvider.of<PaymentBloc>(context)
                                        .add(PayOrderEvent(
                                      command: API.commandPay,
                                      creditCard: card,
                                      contents: "rent bike",
                                      amount: widget.rentalInvoice.totalPrice,
                                      rentalInvoice: widget.rentalInvoice,
                                    ));
                                  }
                                }
                              },
                              fontSize: 30.sp,
                              color: Colors.green,
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
