import 'package:ensan_app/core/common/widgets/custom_section_title.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/features/menu/presentation/widgets/aboutUs/contact_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _InfoSection(
          title: 'معلومات عن المؤسسة',
          content:
              'مؤسسة إنسان الخيرية، المشهرة برقم 63 لسنة 2017، هي مؤسسة أهلية غير ربحية، أسسها مجموعة من الشباب المؤمنين بدور العمل التطوعي في خدمة المجتمع. تعمل المؤسسة على تقديم المساعدات الإنسانية والتنموية باحترافية، مع الحفاظ على كرامة المستفيدين وترسيخ قيم التكافل والتعاون.',
        ),
        const _InfoSection(
          title: 'رؤيتنــــا',
          content:
              'تقديم عمل خيري تطوعي باحترافية، مع الحفاظ على كرامة الإنسان.',
        ),
        const _InfoSection(
          title: 'رسالتنــــا',
          content:
              'رعاية الأطفال الأكثر احتياجًا، وخاصة الأيتام ومرضى الأورام، من خلال برامج متكاملة توفر لهم الدعم النفسي، التعليمي، والصحي، بما يضمن لهم حياة كريمة وأملًا في مستقبل أفضل.',
        ),
        const _InfoSection(
          title: 'قيمنــــا',
          content:
              '• الإنسانية: الحفاظ على كرامة الطفل واحترام مشاعره.\n• الأمل: بث التفاؤل وروح الحياة في نفوس الأطفال.\n• الشفافية: وضوح في العمل والتعامل مع التبرعات.\n• العمل الجماعي: إيمان بدور الشباب والمتطوعين في صناعة الأثر.\n• الاحترافية: تنفيذ البرامج الخيرية بمعايير عالية لضمان الأثر الفعّال.',
        ),
        const CustomSectionTitle(title: 'وسائل التواصل معنا', heading: true),
        const Gap(8),

        const Gap(16),
        const CustomSectionTitle(title: 'يمكنك الاتصال بنا', heading: true),
        const ContactSection(
          branchName: 'كفر الشيخ الرئيسي',
          phones: ['01006090616'],
        ),
        const ContactSection(
          branchName: 'دار إنسان للأورام - كفر الشيخ',
          phones: ['0473131335', '01016649593'],
        ),
        const ContactSection(
          branchName: 'دار إنسان للأورام - الغربية',
          phones: ['0403299166', '01026017236'],
        ),
        const Gap(24),
      ],
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final String content;

  const _InfoSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSectionTitle(title: title, heading: true),
        TextApp(text: content, style: CustomTextStyles.body14Regular),
        const Gap(16),
      ],
    );
  }
}
