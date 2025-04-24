import 'package:flutter/material.dart';
import 'package:itlectory4/widgets/style_text.dart';

class InfoBanner extends StatefulWidget {
  final String infoTxt;
  final String countInfo;

  const InfoBanner({super.key, required this.countInfo, required this.infoTxt});

  @override
  State<InfoBanner> createState() => _InfoBannerState();
}

class _InfoBannerState extends State<InfoBanner> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 150,
        height: 150,
        color: const Color.fromRGBO(32, 32, 32, 1.0),
        child: Stack(
          children: [
            // Линия по правому краю с скруглением
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Container(
                  width: 5,
                  color: const Color.fromRGBO(16, 64, 99, 1),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Container(
                  height: 5,
                  color: const Color.fromRGBO(16, 64, 99, 1),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.countInfo, style: TextStylesMain.apptxt),
                  Text(widget.infoTxt, style: TextStylesMain.apptxt),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
 class Info extends StatefulWidget {
  final String inf1;
  final String inf2;
   const Info({super.key,
   required this.inf1,
   required this.inf2});

   @override
   State<Info> createState() => _InfoState();
 }

 class _InfoState extends State<Info> {
   @override
   Widget build(BuildContext context) {
     return ClipRRect(
       borderRadius: BorderRadius.circular(10),
       child: Container(
         width: 300,
         height: 200,
         color: const Color.fromRGBO(32, 32, 32, 1.0),
         child: Stack(
           children: [
             Positioned(
               right: 0,
               top: 0,
               bottom: 0,
               child: ClipRRect(
                 borderRadius: const BorderRadius.only(
                   topRight: Radius.circular(10),
                   bottomRight: Radius.circular(10),
                 ),
                 child: Container(
                   width: 5,
                   color: const Color.fromRGBO(16, 64, 99, 1),
                 ),
               ),
             ),
             Positioned(
               left: 0,
               right: 0,
               bottom: 0,
               child: ClipRRect(
                 borderRadius: const BorderRadius.only(
                   bottomLeft: Radius.circular(10),
                   bottomRight: Radius.circular(10),
                 ),
                 child: Container(
                   height: 5,
                   color: const Color.fromRGBO(16, 64, 99, 1),
                 ),
               ),
             ),
             Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(widget.inf1, style: TextStylesMain.apptxt),
                   Text(widget.inf2, style: TextStylesMain.apptxt),
                 ],
               ),
             )
           ],
         ),
       ),
     );
   }
 }

