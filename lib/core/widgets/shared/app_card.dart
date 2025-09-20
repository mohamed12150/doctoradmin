import 'package:flutter/material.dart';
import '../../constants/index.dart';
import '../animations.dart';

enum AnimationType {
  fadeIn,
  fadeInUp,
  fadeInDown,
  fadeInLeft,
  fadeInRight,
  scaleIn,
  slideInUp,
  slideInDown,
  slideInLeft,
  slideInRight,
}

class AppCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? elevation;
  final Color? shadowColor;
  final Border? border;
  final VoidCallback? onTap;
  final bool isClickable;
  final List<BoxShadow>? boxShadow;
  final bool enableAnimation;
  final Duration animationDuration;
  final AnimationType animationType;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.border,
    this.onTap,
    this.isClickable = false,
    this.boxShadow,
    this.enableAnimation = true,
    this.animationDuration = AppAnimations.normal,
    this.animationType = AnimationType.fadeInUp,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _offsetAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _offsetAnimation =
        Tween<Offset>(begin: _getInitialOffset(), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    if (widget.enableAnimation) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Offset _getInitialOffset() {
    switch (widget.animationType) {
      case AnimationType.fadeInUp:
      case AnimationType.slideInUp:
        return const Offset(0, 30);
      case AnimationType.fadeInDown:
      case AnimationType.slideInDown:
        return const Offset(0, -30);
      case AnimationType.fadeInLeft:
      case AnimationType.slideInLeft:
        return const Offset(-30, 0);
      case AnimationType.fadeInRight:
      case AnimationType.slideInRight:
        return const Offset(30, 0);
      case AnimationType.fadeIn:
      case AnimationType.scaleIn:
        return Offset.zero;
    }
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.isClickable || widget.onTap != null) {
      setState(() {
        _isPressed = true;
      });
    }
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      margin: widget.margin ?? const EdgeInsets.all(AppSizes.space2),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? AppSizes.radiusL,
        ),
        border: widget.border != null
            ? (widget.border is BorderSide
                  ? Border.all(color: (widget.border as BorderSide).color)
                  : null)
            : Border.all(color: AppColors.borderLight),
        boxShadow: _isPressed
            ? AppColors.cardShadowHover
            : widget.boxShadow ?? AppColors.cardShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isClickable || widget.onTap != null
              ? widget.onTap
              : null,
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? AppSizes.radiusL,
          ),
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(AppSizes.space4),
            child: widget.child,
          ),
        ),
      ),
    );

    if (widget.enableAnimation) {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          Widget animatedCard = card;

          // Apply offset animation
          if (widget.animationType == AnimationType.fadeInUp ||
              widget.animationType == AnimationType.fadeInDown ||
              widget.animationType == AnimationType.fadeInLeft ||
              widget.animationType == AnimationType.fadeInRight ||
              widget.animationType == AnimationType.slideInUp ||
              widget.animationType == AnimationType.slideInDown ||
              widget.animationType == AnimationType.slideInLeft ||
              widget.animationType == AnimationType.slideInRight) {
            animatedCard = Transform.translate(
              offset: _offsetAnimation.value,
              child: animatedCard,
            );
          }

          // Apply scale animation
          if (widget.animationType == AnimationType.scaleIn) {
            animatedCard = Transform.scale(
              scale: _scaleAnimation.value,
              child: animatedCard,
            );
          }

          // Apply opacity animation
          if (widget.animationType == AnimationType.fadeIn ||
              widget.animationType == AnimationType.fadeInUp ||
              widget.animationType == AnimationType.fadeInDown ||
              widget.animationType == AnimationType.fadeInLeft ||
              widget.animationType == AnimationType.fadeInRight) {
            animatedCard = Opacity(
              opacity: _opacityAnimation.value,
              child: animatedCard,
            );
          }

          return animatedCard;
        },
      );
    }

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: card,
    );
  }
}
