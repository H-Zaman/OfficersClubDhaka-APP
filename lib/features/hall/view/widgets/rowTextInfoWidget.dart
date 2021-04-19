import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextAlign alignment;
  final Color? textColor;
  final double? size;

  const RowTextWidget({Key? key,
    required this.title,
    required this.subTitle,
    this.alignment = TextAlign.start,
    this.textColor = Colors.black,
    this.size = 14
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 37,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: size,
                        fontWeight: FontWeight.bold,
                        color: textColor
                      ),
                    ),
                  ),
                  Text(
                    ':  ',
                    style: TextStyle(
                      fontSize: size,
                      fontWeight: FontWeight.bold,
                      color: textColor
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 63,
              child: Text(
                subTitle,
                textAlign: alignment,
                style: TextStyle(
                  fontSize: size,
                  color: textColor
                ),
              )
            )
          ]
      ),
    );
  }
}