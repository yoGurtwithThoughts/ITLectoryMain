import 'package:flutter/material.dart';
import 'package:itlectory4/widgets/style_text.dart';
class AppBarWidget extends StatelessWidget {
  final isBack;
  final text;
  const AppBarWidget({
    super.key,
    required this.text,
    required this.isBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBack
            ? InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(0, 85, 150, 1),)
        )
            : const SizedBox(width: 24),
        Text(
          text,
          style: TextStylesMain.apptxt
          ),
        const SizedBox(width: 24),
      ],
    );
  }
}
