import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/colors.dart';

class CustomTextFieldRapport extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final maxLines;
  const CustomTextFieldRapport(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: textWhite,
            hintText: hintText,
            hintStyle: TextStyle(color: secondary.withOpacity(0.3)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Entrez ${hintText}";
            }
          },
          maxLines: maxLines,
        ),
      ),
    );
  }
}
