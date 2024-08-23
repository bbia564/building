import 'package:construction_roofing/pages/roofing_first/roofing_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class InputWidget extends StatelessWidget {
  InputWidget({required this.title, required this.content, this.unit,this.onChange, Key? key})
      : super(key: key);
  final String title;
  String content;
  String? unit;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: <Widget>[
            Expanded(
                child: RoofingTextField(
                  isNumber:true,
                  padding: EdgeInsets.zero,
                    maxLength: 6,
                    value: content,
                    onChange: (value) {
                      onChange?.call(value);
                    })),
            Visibility(
              visible: unit != null,
              child: Text(
                unit ?? '',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ).marginOnly(left: 10),
            )
          ].toRow(),
        ),
        Divider(
          height: 15,
          color: Colors.grey[300],
        )
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ).marginOnly(bottom: 10);
  }
}
