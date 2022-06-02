import 'package:flutter/material.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key,
      this.hintText,
      this.textEditingController,
      this.title,
      this.suffix})
      : super(key: key);
  final TextEditingController? textEditingController;
  final String? hintText;
  final String? title;
  final Widget? suffix;

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
        TextFormField(
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
      ],
    );
  }
}
