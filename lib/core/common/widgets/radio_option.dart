import 'package:ensan_app/core/common/ui_tools/image_with_shimmer.dart';
import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RadioOption {
  final String id;
  final String title;
  final String? imagePath;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? imageFit;
  final Color? imageColor;

  RadioOption({
    required this.id,
    required this.title,
    this.imagePath,
    this.imageWidth,
    this.imageHeight,
    this.imageFit,
    this.imageColor,
  });
}

class CustomRadioList extends StatefulWidget {
  final List<RadioOption> options;
  final String? selectedValue;
  final ValueChanged<String>? onChanged;
  final Color? selectedColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? titleStyle;
  final double? imageSize;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? enableShadow;

  const CustomRadioList({
    super.key,
    required this.options,
    this.selectedValue,
    this.onChanged,
    this.selectedColor,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.titleStyle,
    this.imageSize,
    this.mainAxisAlignment,
    this.enableShadow = true,
  });

  @override
  State<CustomRadioList> createState() => _CustomRadioListState();
}

class _CustomRadioListState extends State<CustomRadioList> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  void didUpdateWidget(CustomRadioList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue) {
      _selectedValue = widget.selectedValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisSize: MainAxisSize.min,
      children: widget.options.map((option) {
        return _buildRadioItem(option);
      }).toList(),
    );
  }

  Widget _buildRadioItem(RadioOption option) {
    return Container(
      padding: widget.padding ?? EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () => _selectOption(option.id),
        child: CustomCardBackground(
          shadowos: widget.enableShadow == true
              ? [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 20,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ]
              : [],
          padding: EdgeInsets.zero, // <- remove padding from card
          child: Row(
            mainAxisAlignment:
                widget.mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio<String>(
                value: option.id,
                groupValue: _selectedValue,
                onChanged: (value) {
                  if (value != null) _selectOption(value);
                },
                activeColor: widget.selectedColor ?? AppColors.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Expanded(
                child: TextApp(
                  text: option.title,
                  style: widget.titleStyle ?? CustomTextStyles.body14Regular,
                ),
              ),
              if (option.imagePath != null)
                SmartImageWithShimmer(
                  assetShimmerDuration: Duration.zero,
                  path: option.imagePath!,
                  height: 34,
                  width: 50,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectOption(String optionId) {
    setState(() {
      _selectedValue = optionId;
    });

    if (widget.onChanged != null) {
      widget.onChanged!(optionId);
    }
  }
}
