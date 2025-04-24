import 'package:flutter/material.dart';
import 'package:itlectory4/widgets/animated_error.dart';
class ConnectErrorPage extends StatefulWidget {
  const ConnectErrorPage({super.key});

  @override
  State<ConnectErrorPage> createState() => _ConnectErrorPageState();
}

class _ConnectErrorPageState extends State<ConnectErrorPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints)
        {
          return const Stack(
            children: [
              Center(
                child: Positioned(
                  top: 250,
                  left: 0,
                  right: 0,
                  bottom: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PulsatingError(),

                    ],
                  ),
                ),
              ),


            ],
          );
        }
    );
  }
}
