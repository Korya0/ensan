import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/core/common/widgets/text_button_link.dart';
import 'package:ensan_app/core/resource/style/font/custom_font_text_style.dart';
import 'package:ensan_app/core/resource/style/theme/app_colors.dart';
import 'package:ensan_app/core/utils/helper.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/widgets/category_detail/action_button_category_detail.dart';
import 'package:ensan_app/features/home/presentation/widgets/category_detail/categories_services_card.dart';
import 'package:ensan_app/features/home/presentation/widgets/category_detail/imag_header_with_back.dart';
import 'package:ensan_app/features/home/presentation/widgets/category_detail/title_sub_title_category_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryDetailView extends StatelessWidget {
  final CategoryModel category;

  const CategoryDetailView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header Section with fade animation
          SliverToBoxAdapter(
            child: ImageHeaderWithBack(imagePath: category.imagePath),
          ),

          // Content
          const SliverToBoxAdapter(child: Gap(16)),

          // Content with staggered animations
          SliverToBoxAdapter(
            child: AppAnimations.fadeInUp(
              Column(
                children: [
                  // Title and Subtitle section
                  AppAnimations.fadeInRight(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TitleSubTitleCategoryDetailWidget(
                        category: category,
                      ),
                    ),
                    duration: Duration(milliseconds: 500),
                    delay: Duration(milliseconds: 100),
                  ),

                  const Gap(24),

                  // Actions Button with slide animation
                  AppAnimations.slideInUp(
                    ActionButtonCategoryDetail(
                      categoryId: category.id,
                      donationTypeName: CategoryDisplayName.arabicName(
                        category.id,
                      ),
                      projectName: category.title,
                      showDonationCartButton: CategoryHelper.donationCategories
                          .contains(category.id),
                      showContactUsButton: CategoryHelper.contactCategories
                          .contains(category.id),
                      enableBorderContactUsButton: CategoryHelper
                          .borderedContactCategories
                          .contains(category.id),
                      child: category.id == CategoryConstantID.guestHouse
                          ? const _GuestHouseCondtion()
                          : CategoryHelper.cardsCategories.contains(category.id)
                          ? AppAnimations.fadeIn(
                              CategoriesServicesSection(
                                categoryId: category.id,
                              ),
                              duration: Duration(milliseconds: 600),
                              delay: Duration(milliseconds: 200),
                            )
                          : null,
                    ),
                    duration: Duration(milliseconds: 500),
                    delay: Duration(milliseconds: 200),
                  ),
                  Gap(24),
                ],
              ),
              duration: Duration(milliseconds: 600),
            ),
          ),
        ],
      ),
    );
  }
}

class _GuestHouseCondtion extends StatelessWidget {
  const _GuestHouseCondtion();

  @override
  Widget build(BuildContext context) {
    return AppAnimations.fadeIn(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextButtonLink(
          text: 'تقديم طلب للاستضافة',
          onTap: () => ToastMessage.warning(
            context,
            'Comming Soon...',
            position: ToastPosition.top,
          ),
          underline: true,
          textStyle: CustomTextStyles.body18Medium.copyWith(
            color: AppColors.textAndIconSecondary,
            decorationColor: AppColors.textAndIconSecondary,
          ),
        ),
      ),
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: 300),
    );
  }
}
