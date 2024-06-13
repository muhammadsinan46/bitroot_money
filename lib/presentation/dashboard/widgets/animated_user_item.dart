import 'package:flutter/material.dart';


enum FadeInDirection { ttb, btt, ltr, rtl }

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({super.key, required this.child, required this.delay, required this.direction, required this.fadeOffset});

  final Widget child;
  final double delay;
  final double fadeOffset;
  final FadeInDirection direction;


  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with TickerProviderStateMixin {

late AnimationController animatedController;
late Animation<double>  opacity;
late Animation<double> inAnimation;

@override
  void initState() {
  
    super.initState();
        animatedController = AnimationController(
        duration: Duration(milliseconds: (500 * widget.delay).round()),
        vsync: this);
    inAnimation =
        Tween<double>(begin: -widget.fadeOffset, end: 0).animate(animatedController)
          ..addListener(() {
            setState(() {});
          });

    opacity = Tween<double>(begin: 0, end: 1).animate(animatedController)
      ..addListener(() {
        setState(() {});
      });

  }

  @override
  Widget build(BuildContext context) {

    animatedController.forward();
    return Transform.translate(offset: switch(widget.direction){

             FadeInDirection.ltr => Offset(inAnimation.value, 0),
        FadeInDirection.rtl => Offset(-inAnimation.value, 0),
        FadeInDirection.ttb => Offset(0, inAnimation.value),
        FadeInDirection.btt => Offset(0, 0 - inAnimation.value),

    },
    child: Opacity(opacity: opacity.value,
    child: widget.child,
    ),
    );
  }

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }
}