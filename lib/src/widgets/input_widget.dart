import 'package:flutter/material.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key,
      this.hintText,
      this.textEditingController,
      this.title,
      this.suffix,
      this.obscureText = false,
      this.inputType,
      this.mode,
      this.button,
      this.validator})
      : super(key: key);
  final TextEditingController? textEditingController;
  final String? hintText;
  final String? title;
  final Widget? suffix;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final AutovalidateMode? mode;
  final TextInputType? inputType;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: textEditingController,
                keyboardType: inputType,
                autovalidateMode: mode,
                validator: validator,
                obscureText: obscureText!,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: hintColor, fontSize: 12),
                  hintText: hintText,
                  suffix: suffix,
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: hintColor)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: hintColor)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: hintColor)),
                ),
              ),
            ),
            if (button != null) button!
          ],
        ),
      ],
    );
  }
}
