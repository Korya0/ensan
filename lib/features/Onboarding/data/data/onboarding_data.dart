import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/features/Onboarding/data/model/onboarding_model.dart';

class OnboardingData {
  static List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      image: AppAssets.onboarding1,
      title: 'معًا نصنع الخير',
      description:
          'انضم إلينا بمساهمة في دعم الأيتام المحتاجة والمشروعات الخيرية بسهولة من خلال تطبيقنا',
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: 'شارك البهجة',
      description:
          'ساعد في رسم الابتسامة على وجوه الأطفال والاسر المحتاجة، وكن سببًا في سعادتهم',
    ),
  ];
}
