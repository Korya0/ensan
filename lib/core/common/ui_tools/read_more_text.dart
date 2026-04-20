import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ReadMoreTextApp extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? style;
  final String readMoreText;
  final String readLessText;
  final Color linkColor;

  const ReadMoreTextApp({
    super.key,
    required this.text,
    this.trimLines = 3,
    this.style,
    this.readMoreText = "اقرأ المزيد",
    this.readLessText = "عرض أقل",
    this.linkColor = AppColors.textAndIconBlue,
  });

  @override
  State<ReadMoreTextApp> createState() => _ReadMoreTextAppState();
}

class _ReadMoreTextAppState extends State<ReadMoreTextApp> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final span = TextSpan(text: widget.text, style: widget.style);
    final tp = TextPainter(
      text: span,
      maxLines: widget.trimLines,
      textDirection: TextDirection.rtl,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    final isOverflow = tp.didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: widget.text,
          style: widget.style,
          maxLines: isExpanded ? null : widget.trimLines,
          textOverflow: TextOverflow.fade,
          textAlign: TextAlign.start,
        ),
        if (isOverflow)
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextApp(
                text: isExpanded ? widget.readLessText : widget.readMoreText,
                style:
                    widget.style?.copyWith(
                      color: widget.linkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ) ??
                    TextStyle(
                      color: widget.linkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
      ],
    );
  }
}
