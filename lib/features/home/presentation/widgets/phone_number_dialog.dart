import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/color_style.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/splash_button.dart';
import '../screens/otp_screen.dart';

class PhoneNumberDialog extends StatefulWidget {
  const PhoneNumberDialog({
    super.key,
    this.phoneNumber,
  });

  final String? phoneNumber;

  @override
  State<PhoneNumberDialog> createState() => _PhoneNumberDialogState();
}

class _PhoneNumberDialogState extends State<PhoneNumberDialog> {
  TextEditingController phoneCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.phoneNumber != null) {
      phoneCtrl.text = widget.phoneNumber!;
    }
    super.initState();
  }

  @override
  void dispose() {
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Phone number',
                      style: KStyle.tTitle,
                    ),
                  ),
                ),
                SplashButton(
                  onTap: () {
                    context.pop();
                  },
                  iconSize: 32,
                  child: SvgPicture.asset('assets/icons/circle-close.svg'),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: CustomTextField(
                    hintText: 'Phone',
                    controller: phoneCtrl,
                    prefixIconPath: 'assets/icons/phone.svg',
                    keyboardType: TextInputType.number,
                    autoFocus: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }

                      if (!RegExp(r'^(099\d{8}|99\d{8})$').hasMatch(value)) {
                        return 'Only Ooredoo number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 142,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      if (widget.phoneNumber == null) {
                        context.pop();
                        context.push(OtpScreen.routeName, extra: {
                          'phoneNumber': phoneCtrl.text,
                        });
                      } else {
                        context.pop(phoneCtrl.text);
                      }
                    },
                    child: Text(
                      'CONTINUE',
                      style: KStyle.tButton.copyWith(
                        color: KStyle.cWhite,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
