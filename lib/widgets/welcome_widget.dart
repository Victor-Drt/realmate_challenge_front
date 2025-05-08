import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height * 0.5,
      width: MediaQuery.sizeOf(context).width * 0.7,
      padding: const EdgeInsets.all(32),
      color: Colors.grey,
      child: SvgPicture.asset('assets/images/messages.svg'),
    );
  }
}
