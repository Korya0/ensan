// ignore_for_file: deprecated_member_use

import 'package:ensan_app/core/common/widgets/custom_card_background.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String? value;
  final String hintText;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final Color? selectedColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? height;

  const CustomDropdown({
    super.key,
    this.value,
    required this.hintText,
    required this.items,
    this.onChanged,
    this.selectedColor,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.textStyle,
    this.padding,
    this.height,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isExpanded = false;
  String? _selectedValue;
  final GlobalKey _dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          key: _dropdownKey,
          onTap: _toggleDropdown,
          child: Container(
            height: widget.height ?? 50,
            padding:
                widget.padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? AppColors.backgroundPrimary,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
              border: Border.all(
                color: widget.borderColor ?? AppColors.borederEnable,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextApp(
                    text: _selectedValue ?? widget.hintText,
                    style:
                        widget.textStyle ??
                        CustomTextStyles.body14Regular.copyWith(
                          color: _selectedValue != null
                              ? AppColors.textAndIconPrimary
                              : AppColors.hintColor,
                          fontWeight: _selectedValue != null
                              ? FontWeight.w400
                              : FontWeight.normal,
                        ),
                    textAlign: TextAlign.right,
                  ),
                ),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.borederEnable,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded) _buildDropdownItems(),
      ],
    );
  }

  Widget _buildDropdownItems() {
    final List<Widget> children = [];
    for (int i = 0; i < widget.items.length; i++) {
      final item = widget.items[i];
      final isSelected = item == _selectedValue;
      children.add(
        InkWell(
          onTap: () => _selectItem(item),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? (widget.selectedColor ?? AppColors.primary)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            ),
            child: Text(
              item,
              style:
                  widget.textStyle?.copyWith(
                    color: Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.w500
                        : FontWeight.normal,
                  ) ??
                  CustomTextStyles.body18Medium.copyWith(
                    fontWeight: isSelected
                        ? FontWeight.w500
                        : FontWeight.normal,
                  ),

              textAlign: TextAlign.right,
            ),
          ),
        ),
      );
      // Add divider between items (except last)
      if (i != widget.items.length - 1) {
        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              height: 1,
              thickness: 1,
              color: AppColors.borederEnable.withOpacity(0.5),
            ),
          ),
        );
      }
    }

    return CustomCardBackground(
      enableboreder: true,
      borderRadius: widget.borderRadius ?? 12,
      color: widget.backgroundColor ?? AppColors.backgroundPrimary,

      child: Column(children: children),
    );
  }

  void _toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _selectItem(String item) {
    setState(() {
      _selectedValue = item;
      _isExpanded = false;
    });

    if (widget.onChanged != null) {
      widget.onChanged!(item);
    }
  }
}
