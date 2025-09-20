import 'package:flutter/material.dart';
import '../../constants/index.dart';
import '../animations.dart';

enum AppButtonType { primary, secondary, outline, text, icon }

enum AppButtonSize { small, medium, large }

class AppButton extends StatefulWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final AppButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Widget? child;
  final bool enableAnimation;
  final Duration animationDuration;

  const AppButton({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.child,
    this.enableAnimation = true,
    this.animationDuration = AppAnimations.fast,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.enableAnimation &&
        widget.onPressed != null &&
        !widget.isLoading) {
      setState(() {
        _isPressed = true;
      });
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.enableAnimation) {
      setState(() {
        _isPressed = false;
      });
      _animationController.reverse();
    }
  }

  void _onTapCancel() {
    if (widget.enableAnimation) {
      setState(() {
        _isPressed = false;
      });
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonChild = widget.child ?? _buildButtonChild();

    Widget button = GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.isLoading ? null : widget.onPressed,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  color: _getBackgroundColor(),
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? _getBorderRadius(),
                  ),
                  border: widget.type == AppButtonType.outline
                      ? Border.all(
                          color: widget.borderColor ?? _getBorderColor(),
                          width: 1.5,
                        )
                      : null,
                  boxShadow: _isPressed
                      ? [
                          BoxShadow(
                            color: _getBackgroundColor().withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : AppColors.cardShadow,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: widget.isLoading ? null : widget.onPressed,
                    borderRadius: BorderRadius.circular(
                      widget.borderRadius ?? _getBorderRadius(),
                    ),
                    child: Container(
                      padding: widget.padding ?? _getPadding(),
                      child: buttonChild,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

    if (widget.isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return IntrinsicWidth(child: button);
  }

  Widget _buildButtonChild() {
    if (widget.isLoading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
        ),
      );
    }

    if (widget.icon != null && widget.text != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, size: _getIconSize(), color: _getTextColor()),
          const SizedBox(width: AppSizes.space2),
          Flexible(
            child: Text(
              widget.text!,
              style: _getTextStyle(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    if (widget.icon != null) {
      return Icon(widget.icon, size: _getIconSize(), color: _getTextColor());
    }

    return Text(
      widget.text ?? '',
      style: _getTextStyle(),
      overflow: TextOverflow.ellipsis,
    );
  }

  Color _getBackgroundColor() {
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    switch (widget.type) {
      case AppButtonType.primary:
        return AppColors.primary;
      case AppButtonType.secondary:
        return AppColors.secondary;
      case AppButtonType.outline:
      case AppButtonType.text:
      case AppButtonType.icon:
        return Colors.transparent;
    }
  }

  Color _getTextColor() {
    if (widget.textColor != null) return widget.textColor!;

    switch (widget.type) {
      case AppButtonType.primary:
      case AppButtonType.secondary:
        return AppColors.textOnPrimary;
      case AppButtonType.outline:
        return AppColors.primary;
      case AppButtonType.text:
        return AppColors.primary;
      case AppButtonType.icon:
        return AppColors.textPrimary;
    }
  }

  Color _getBorderColor() {
    if (widget.borderColor != null) return widget.borderColor!;
    return AppColors.primary;
  }

  double _getBorderRadius() {
    switch (widget.size) {
      case AppButtonSize.small:
        return AppSizes.radiusS;
      case AppButtonSize.medium:
        return AppSizes.radiusM;
      case AppButtonSize.large:
        return AppSizes.radiusL;
    }
  }

  EdgeInsets _getPadding() {
    switch (widget.size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: AppSizes.space4,
          vertical: AppSizes.space2,
        );
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppSizes.space6,
          vertical: AppSizes.space3,
        );
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppSizes.space8,
          vertical: AppSizes.space4,
        );
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case AppButtonSize.small:
        return AppSizes.iconS;
      case AppButtonSize.medium:
        return AppSizes.iconM;
      case AppButtonSize.large:
        return AppSizes.iconL;
    }
  }

  TextStyle _getTextStyle() {
    switch (widget.size) {
      case AppButtonSize.small:
        return AppTextStyles.buttonSmall.copyWith(color: _getTextColor());
      case AppButtonSize.medium:
        return AppTextStyles.buttonMedium.copyWith(color: _getTextColor());
      case AppButtonSize.large:
        return AppTextStyles.buttonLarge.copyWith(color: _getTextColor());
    }
  }
}
