

import 'package:flutter/cupertino.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'Read Some Books',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        );
      },

    );
  }
}
