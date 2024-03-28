import 'package:flutter/material.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

import '../utils/hexcolor.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;

  final String textEntry;

  final String? labelText;

  final bool obscureText;

  final bool fromLogin;

  final double? inputHeight;

  final TextInputType? keyboardType;

  final bool enabled;

  final String? Function(String?)? validator;

  TextInput(
      {Key? key,
      required this.controller,
      required this.textEntry,
      this.labelText,
      this.inputHeight,
      this.keyboardType,
      this.obscureText = false,
      this.fromLogin = false,
      this.enabled = true,
      this.validator})
      : super(key: key);

  @override
  State<TextInput> createState() => _TextInputWithIconState();
}

class _TextInputWithIconState extends State<TextInput> {
  late TextEditingController controller;
  late String textEntry;
  late String? labelText;
  late bool obscureText;
  late bool visible = false;
  late double? inputHeight;

  @override
  void initState() {
    super.initState();

    controller = widget.controller;

    textEntry = widget.textEntry;

    labelText = widget.labelText;

    inputHeight = widget.inputHeight;

    obscureText = widget.obscureText;

    visible = obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (labelText != null)
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(labelText!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: SmartpayColors.smartpayBlack,
                      fontWeight: FontWeight.w500)),
            ),
          SizedBox(
              height: inputHeight,
              child: TextFormField(
                validator: widget.validator ?? (value) {
                  final passwordRegex = RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^\w\d\s:])(.{8,})$');

                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                  if ((value?.isNotEmpty ?? false) &&
                      obscureText &&
                      !widget.fromLogin) {
                    if (!passwordRegex.hasMatch(value!)) {
                      return "Password must contain at least 8 Characters, \na Capital letter, a symbol or a number";
                    }
                  } else if ((labelText?.toLowerCase().contains("email") ??
                          false) &&
                      (value?.isNotEmpty ?? false)) {
                    if (!emailRegex.hasMatch(value!)) {
                      return "Value must be a valid email";
                    }
                  } else if ((value?.isEmpty ?? false)) {
                    // if field is empty and not organisation url input

                    return "Field must not be empty";
                  }

                  return null;
                },
                controller: controller,
                obscureText: visible,
                cursorColor: SmartpayColors.smartpayPrimaryColor,
                enabled: widget.enabled,
                keyboardType: widget.keyboardType,
                decoration: InputDecoration(
                  filled: true,

                  fillColor: Colors.white,

                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 15),

                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(7)),

                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(7)),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: HexColor("#2E2F38")),
                      borderRadius: BorderRadius.circular(7)),

                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: SmartpayColors.smartpayBorderColor, width: 1),
                      borderRadius: BorderRadius.circular(9)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: SmartpayColors.smartpayBorderColor, width: 1),
                      borderRadius: BorderRadius.circular(9)),

                  hintText: textEntry,

                  hintStyle: context.textSize.titleMedium?.copyWith(
                      color: HexColor("#B9B9B9"), fontWeight: FontWeight.w400),

                  errorStyle: TextStyle(
                      backgroundColor: Colors.white,
                      height: 0.9,
                      overflow: TextOverflow.visible),

                  // prefixIcon: Icon(iconType, weight: 0.4),
                  suffixIcon: obscureText
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                          child: visible
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ))
                      : Container(
                          color: Colors.transparent,
                          width: 0,
                        ),
                ),
              ))
        ]));
  }
}
