import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_order_test/constants/color_style.dart';
import 'package:food_order_test/features/home/presentation/screens/order_success.dart';
import 'package:food_order_test/features/home/presentation/widgets/phone_number_dialog.dart';
import 'package:food_order_test/widgets/custom_rich_text.dart';
import 'package:food_order_test/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phoneNumber});

  static const String routeName = '/otp';

  final String phoneNumber;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String phoneNumber = '';
  bool isWrong = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController otpCtrl = TextEditingController();

  Timer? timer;
  int secondsRemaining = 60;
  bool enableResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    phoneNumber = widget.phoneNumber;
  }

  void startTimer() {
    enableResend = false;
    secondsRemaining = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining == 0) {
          enableResend = true;
          timer.cancel();
        } else {
          secondsRemaining--;
        }
      });
    });
  }

  void resendCode() {
    startTimer();
  }

  @override
  void dispose() {
    otpCtrl.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CURRENT PHONE NUMBER',
                      style: KStyle.tInputLabel.copyWith(
                        color: KStyle.cBlack,
                      ),
                    ),
                    Text(
                      phoneNumber,
                      style: KStyle.tTextMain.copyWith(
                        color: KStyle.cGray,
                      ),
                    )
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    var number = await showDialog(
                        context: context,
                        builder: (context) {
                          return PhoneNumberDialog(phoneNumber: phoneNumber);
                        });

                    if (number != phoneNumber) {
                      setState(() {
                        phoneNumber = number;
                      });
                    }
                  },
                  child: Text(
                    'CHANGE',
                    style: KStyle.tButton.copyWith(
                      color: KStyle.cRed,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'PLEASE ENTER OTP',
              style: KStyle.tInputLabel.copyWith(
                color: KStyle.cBlack,
              ),
            ),
            const SizedBox(height: 4),
            Form(
              key: formKey,
              child: CustomTextField(
                controller: otpCtrl,
                autoFocus: true,
                style: KStyle.tInputFont,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                suffixText: secondsRemaining == 0 ? '' : '${secondsRemaining}s',
                suffixStyle: KStyle.tInputFont,
                validator: (value) {
                  if (value == null || value == '') {
                    return '';
                  }
                  if (value.length != 6) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            isWrong
                ? InkWell(
                    onTap: () {
                      setState(() {
                        otpCtrl.clear();
                        isWrong = false;
                      });
                    },
                    child: const SimpleAndUnderScoreText(
                        simpleText: 'Wrong OTP.  ',
                        underScoreText: 'Try Again'),
                  )
                : secondsRemaining == 0
                    ? InkWell(
                        onTap: () {
                          resendCode();
                        },
                        child: const SimpleAndUnderScoreText(
                            simpleText: 'Didn\’t received? ',
                            underScoreText: 'Resend'),
                      )
                    : const SizedBox.shrink(),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: TextButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    setState(() {
                      isWrong = true;
                    });
                    return;
                  }
                  context.pop();
                  context.push(OrderSuccessScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'CONTINUE',
                    style: KStyle.tButton.copyWith(
                      color: KStyle.cWhite,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
