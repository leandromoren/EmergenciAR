import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vidar_app/features/pages/phone_number_page.dart';
import 'package:vidar_app/utils/constants/styles.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 260.0,
          height: 260.0,
          decoration: const BoxDecoration(
            color: Color(0xFFFEDAD3),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 210.0,
          height: 210.0,
          decoration: const BoxDecoration(
            color: Color(0xFFFCBAAD),
            shape: BoxShape.circle,
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                PhoneNumberPage.routeName,
              );
            },
            child: Container(
              width: 160.0,
              height: 160.0,
              decoration: const BoxDecoration(
                color: Color(0xFFF52800),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              PhoneNumberPage.routeName,
            );
          },
          child: const Icon(Iconsax.call, size: 60.0, color: Colors.white,)
        ),
      ],
    );
  }
}