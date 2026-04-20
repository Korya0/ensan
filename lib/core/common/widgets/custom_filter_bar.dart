import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:flutter/material.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';

class CustomFilterBar extends StatefulWidget {
  final List<String> filters;
  final ValueChanged<String> onFilterSelected;
  final String initialFilter;

  const CustomFilterBar({
    super.key,
    required this.filters,
    required this.onFilterSelected,
    this.initialFilter = '',
  });

  @override
  State<CustomFilterBar> createState() => _CustomFilterBarState();
}

class _CustomFilterBarState extends State<CustomFilterBar> {
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = widget.initialFilter.isNotEmpty
        ? widget.initialFilter
        : widget.filters.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.filters.map((label) {
        final isSelected = selectedFilter == label;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = label;
              });
              widget.onFilterSelected(label);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 4,
              ), // spacing between filters
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextApp(
                text: label,
                textAlign: TextAlign.center,
                style: isSelected
                    ? CustomTextStyles.body16Medium
                    : CustomTextStyles.body14Regular,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
