import "package:flutter/material.dart";

class AnimationWrapper extends StatefulWidget {
  final Widget child;
  final bool shouldAnimate;
  final bool shouldAnimateBack;

  const AnimationWrapper({
    Key? key,
    required this.child,
    this.shouldAnimate = false,
    this.shouldAnimateBack = false// Default to true if not specified
  }) : super(key: key);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();
}

class _AnimationWrapperState extends State<AnimationWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(widget.shouldAnimateBack ? -1 : 1, 0.0),  // Start position (off-screen to the left)
      end: Offset.zero,          // End position (center of the screen)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.shouldAnimate || widget.shouldAnimateBack) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (!widget.shouldAnimate && !widget.shouldAnimateBack) {
      return widget.child;
    }

    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}

