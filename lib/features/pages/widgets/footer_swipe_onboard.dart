import 'package:flutter/material.dart';
import 'package:vidar_app/utils/constants/sizes.dart';

class FooterSwipeOnboard extends StatelessWidget {
  const FooterSwipeOnboard({
    super.key,
    required this.imagen
  });

  final String imagen;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: FadeTransition(
        opacity: AlwaysStoppedAnimation(0.5),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Icon(Icons.swipe_left_outlined,size: 50,)
          ],
        ),
      ),
      
    );
  }
}