import 'package:flutter/material.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key, this.hintText, this.textEditingController, this.title})
      : super(key: key);
  final TextEditingController? textEditingController;
  final String? hintText;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: hintColor, fontSize: 12),
            hintText: hintText,
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
