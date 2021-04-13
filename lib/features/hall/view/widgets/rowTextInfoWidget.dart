import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextAlign alignment;

  const RowTextWidget({Key? key,required this.title,required this.subTitle, this.alignment = TextAlign.start}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 37,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text(
                    ':  ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
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
                  ),
                )
            )
          ]
      ),
    );
  }
}