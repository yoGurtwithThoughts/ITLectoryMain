import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlectory4/widgets/style_text.dart';

class TestCard extends StatelessWidget {
  final String titleTest;
  final void Function()? onTap;

  const TestCard({super.key, required this.titleTest, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70, 
        width: 365,
        margin: const EdgeInsets.symmetric(vertical: 10), 
        decoration: BoxDecoration(
          color: const Color.fromRGBO(53, 51, 51, 1),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2), 
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/play.svg', 
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Text(
                  titleTest,
                  style: TextStylesMain.themetxt.copyWith(
                    color: Colors.white, 
                    fontSize: 16, 
                  ),
                  overflow: TextOverflow.ellipsis, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}