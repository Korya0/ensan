// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';

class SmartImageWithShimmer extends StatefulWidget {
  const SmartImageWithShimmer({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.isNetwork = false,
    this.fadeDuration = const Duration(milliseconds: 300),
    this.shimmerSpeed = const Duration(milliseconds: 1500),
    this.assetShimmerDuration = const Duration(milliseconds: 600),
    this.enableZoom = false,
    this.onTap,
    this.errorIcon = Icons.broken_image_rounded,
    this.errorIconColor,
    this.errorBorderColor,
  });

  final String path;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final bool isNetwork;
  final Duration fadeDuration;
  final Duration shimmerSpeed;
  final Duration assetShimmerDuration;
  final bool enableZoom;
  final VoidCallback? onTap;

  final IconData errorIcon;
  final Color? errorIconColor;
  final Color? errorBorderColor;

  @override
  State<SmartImageWithShimmer> createState() => _SmartImageWithShimmerState();
}

class _SmartImageWithShimmerState extends State<SmartImageWithShimmer> {
  bool _loaded = false;
  bool _showShimmer = true;

  @override
  void initState() {
    super.initState();

    if (!widget.isNetwork) {
      // For asset images: show shimmer for specified duration
      Future.delayed(widget.assetShimmerDuration, () {
        if (mounted) {
          setState(() {
            _showShimmer = false;
            _loaded = true;
          });
        }
      });
    }
  }

  void _showImageZoom(BuildContext context) {
    if (!widget.enableZoom || !_loaded) return;

    showGeneralDialog(
      context: context,
      barrierColor: Colors.black87,
      barrierDismissible: true,
      barrierLabel: 'إغلاق',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return AppAnimations.zoomIn(
          Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () => context.pop(),
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 0.5,
                maxScale: 4.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: widget.isNetwork
                      ? Image.network(
                          widget.path,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => _errorContainer(),
                        )
                      : Image.asset(
                          widget.path,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => _errorContainer(),
                        ),
                ),
              ),
            ),
          ),
          duration: const Duration(milliseconds: 400),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: () {
        if (widget.enableZoom && _loaded) {
          HapticFeedback.vibrate();
          _showImageZoom(context);
        }
      },
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
        child: Stack(
          children: [
            // Shimmer placeholder
            if (_showShimmer)
              SizedBox(
                height: widget.height,
                width: widget.width,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!.withOpacity(0.35),
                  highlightColor: Colors.grey[100]!.withOpacity(0.8),
                  period: widget.shimmerSpeed,
                  child: Container(color: Colors.grey[300]),
                ),
              ),

            // Image widget
            if (widget.isNetwork)
              Image.network(
                widget.path,
                height: widget.height,
                width: widget.width,
                fit: widget.fit,
                frameBuilder: (context, child, frame, wasSync) {
                  if (!_loaded && frame != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() {
                          _loaded = true;
                          _showShimmer = false;
                        });
                      }
                    });
                  }
                  return AnimatedOpacity(
                    duration: widget.fadeDuration,
                    opacity: _loaded ? 1 : 0,
                    child: child,
                  );
                },
                errorBuilder: (_, __, ___) => _errorContainer(),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(); // Transparent while shimmer shows
                },
              )
            else
              AnimatedOpacity(
                duration: widget.fadeDuration,
                opacity: _loaded ? 1 : 0,
                child: Image.asset(
                  widget.path,
                  height: widget.height,
                  width: widget.width,
                  fit: widget.fit,
                  errorBuilder: (_, __, ___) => _errorContainer(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _errorContainer() {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
        border: Border.all(
          color: widget.errorBorderColor ?? Colors.red.withOpacity(0.25),
        ),
      ),
      alignment: Alignment.center,
      child: Icon(
        widget.errorIcon,
        color: widget.errorIconColor ?? Colors.grey.withOpacity(0.7),
      ),
    );
  }
}
