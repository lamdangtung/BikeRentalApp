import 'package:bike_rental/entity/invoice/rental_invoice.dart';
import 'package:bike_rental/entity/payment/credit_card.dart';
import 'package:bike_rental/utils/colors.dart';
import 'package:bike_rental/utils/images.dart';
import 'package:bike_rental/views/handler/payment/payment_bloc.dart';
import 'package:bike_rental/views/screen/result_screen.dart';
import 'package:bike_rental/views/widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  final RentalInvoice rentalInvoice;
  const PaymentScreen({Key? key, required this.rentalInvoice})
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
    cardNumberTextEditingController.text = "kscq1_group14_2021";
    ownerTextEditingController.text = "Group 14";
    secretNumberTextEditingController.text = "786";
    expiredDateTextEditingController.text = "1125";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state is PaymentLoading) {
        } else if (state is PaymentSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ResultScreen(
                        message: "Thành công",
                      )));
        } else if (state is PaymentFail) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ResultScreen(
                        message: "Thất bại",
                      )));
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
                          "Ecobike | Thanh toán",
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
                                      "Phương thức thanh toán",
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
                                        "Thẻ tín dụng",
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
                                        "Số thẻ:",
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
                                        "Ngày hết hạn:",
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
                                        "Chủ thẻ:",
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
                                        "Mã bảo mật:",
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
                              text: "Xác nhận thanh toán",
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
                                  BlocProvider.of<PaymentBloc>(context)
                                      .add(PayOrderEvent(
                                    creditCard: card,
                                    contents: "rent bike",
                                    amount: widget.rentalInvoice.totalPrice,
                                    rentalInvoice: widget.rentalInvoice,
                                  ));
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

    void confirmPayment() {}
  }
}
