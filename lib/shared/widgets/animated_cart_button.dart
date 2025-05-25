import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landmark_assignment/core/util/value/images.dart';

class AnimatedCartButton extends StatefulWidget {
  final int itemCount;
  final VoidCallback? onPressed;

  const AnimatedCartButton({
    Key? key,
    required this.itemCount,
    this.onPressed,
  }) : super(key: key);

  @override
  State<AnimatedCartButton> createState() => _AnimatedCartButtonState();
}

class _AnimatedCartButtonState extends State<AnimatedCartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  int _prevCount = 0;

  @override
  void initState() {
    super.initState();
    _prevCount = widget.itemCount;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    if (_prevCount > 0) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedCartButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.itemCount != _prevCount) {
      _controller.reset();
      _controller.forward();
      _prevCount = widget.itemCount;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              Images.bag,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ?? Colors.black,
                BlendMode.srcIn,
              ),
              placeholderBuilder: (context) => const Icon(Icons.shopping_bag),
            ),
            onPressed: widget.onPressed,
          ),
          if (widget.itemCount >= 0)
            Positioned(
              right: 4,
              top: 4,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text(
                  '${widget.itemCount}',
                  style: TextStyle(
                    color: widget.itemCount == 0 ? Colors.black : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
