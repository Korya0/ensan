import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalListView<T> extends StatelessWidget {
  final List<T> items;
  final double height;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final ScrollPhysics? physics;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  final double? separatorSize;

  const HorizontalListView({
    super.key,
    required this.items,
    required this.height,
    required this.itemBuilder,
    this.separatorSize,
    this.padding,
    this.itemExtent,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: TextApp(text: "لا توجد عناصر", style: CustomTextStyles.h1Bold),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        physics: physics ?? const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final child = itemBuilder(context, items[index], index);
          return itemExtent != null
              ? SizedBox(width: itemExtent, child: child)
              : child;
        },
        separatorBuilder: (context, index) =>
            SizedBox(width: separatorSize ?? 0.w),
      ),
    );
  }
}
