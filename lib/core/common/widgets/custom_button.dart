// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.text,
    this.onTap,
    this.backgroundColor = AppColors.primary,
    this.padding,
    this.borderRadius = 12,
    super.key,
    this.isLoading = false,
    this.child,
    this.textColor,
    this.borderColor = AppColors.primary,
    this.enableBorder = false,
    this.width,
    this.height,
  });

  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final bool isLoading;
  final Widget? child;
  final Color? textColor;
  final Color? borderColor;
  final bool enableBorder;
  final double? width;
  final double? height;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.05,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _onTap() {
    if (!widget.isLoading) {
      widget.onTap?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _isPressed
        ? widget.backgroundColor.withOpacity(0.8)
        : widget.backgroundColor;

    final border = widget.enableBorder
        ? Border.all(
            color: widget.borderColor ?? widget.backgroundColor,
            width: 1.5,
          )
        : null;

    return GestureDetector(
      onTapDown: widget.onTap != null ? _onTapDown : null,
      onTapUp: widget.onTap != null ? _onTapUp : null,
      onTapCancel: widget.onTap != null ? _onTapCancel : null,
      onTap: widget.onTap != null && !widget.isLoading ? _onTap : null,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: widget.height ?? 48,
              width: widget.width ?? double.infinity,
              padding:
                  widget.padding ?? const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: border,
                boxShadow: _isPressed
                    ? []
                    : [
                        BoxShadow(
                          color: bgColor.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
              ),
              child: Center(
                child: widget.isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : widget.child ??
                          TextApp(
                            text: widget.text,
                            style: CustomTextStyles.body18Medium.copyWith(
                              color:
                                  widget.textColor ??
                                  AppColors.textAndIconPrimary,
                            ),
                          ),
              ),
            ),
          );
        },
      ),
    );
  }
}
