import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';

class CategoryConstantID {
  static const String missionsOfHope = 'missions_of_hope';
  static const String guestHouse = 'guest_house';
  static const String livery = 'livery';
  static const String medrar = 'medrar';
  static const String zad = 'zad';
}

class CategoryDisplayName {
  static String arabicName(String categoryId) {
    switch (categoryId) {
      case CategoryConstantID.missionsOfHope:
        return 'بُعثاء الأمل';
      case CategoryConstantID.guestHouse:
        return 'دار الضيافة';
      case CategoryConstantID.livery:
        return 'كسوه';
      case CategoryConstantID.medrar:
        return 'مدرار';
      case CategoryConstantID.zad:
        return 'زاد';
      default:
        return 'تبرع';
    }
  }
}

class CategoryModel {
  final String iconPath; // Home icon
  final String imagePath; // Details header image
  final String title;
  final String subtitle;
  final String route;
  final String id;

  CategoryModel({
    required this.id,
    required this.iconPath,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.route,
  });
}

class HomeCardItem {
  final String id;
  final String categoryId;
  final String imagePath;
  final String title;
  final String subtitle;
  final String route;
  final double? price;

  const HomeCardItem({
    required this.id,
    required this.categoryId,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.route,
    this.price,
  });
}

class UnifiedHomeData {
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: CategoryConstantID.missionsOfHope,
      iconPath: AppAssets.homeCategoriesSvgs[0],
      imagePath: AppAssets.homeNewsPngs,
      title: 'بُعثاء الأمل',
      route: AppRoutes.categoryDetail,
      subtitle: 'هدفنا مساندة أطفال السرطان وأسرهم...'.padRight(160, '...'),
    ),
    CategoryModel(
      id: CategoryConstantID.guestHouse,
      iconPath: AppAssets.homeCategoriesSvgs[1],
      imagePath: AppAssets.homeNewsPngs,
      title: 'دار الضيافة',
      route: AppRoutes.categoryDetail,
      subtitle: 'دار ضيافة إنسان حضن دافي...'.padRight(160, '...'),
    ),
    CategoryModel(
      id: CategoryConstantID.livery,
      iconPath: AppAssets.homeCategoriesSvgs[2],
      imagePath: AppAssets.homeNewsPngs,
      title: 'كسوه',
      route: AppRoutes.categoryDetail,
      subtitle: 'مشروع كسوة...'.padRight(160, '...'),
    ),
    CategoryModel(
      id: CategoryConstantID.medrar,
      iconPath: AppAssets.homeCategoriesSvgs[3],
      imagePath: AppAssets.homeNewsPngs,
      title: 'مدرار',
      route: AppRoutes.categoryDetail,
      subtitle: 'الصّدقة الجارية: سقيا الماء والأسقف...'.padRight(160, '...'),
    ),
    CategoryModel(
      id: CategoryConstantID.zad,
      iconPath: AppAssets.homeCategoriesSvgs[4],
      imagePath: AppAssets.homeNewsPngs,
      title: 'زاد',
      route: AppRoutes.categoryDetail,
      subtitle: 'كفالة الأيتام وأمهاتهم...'.padRight(160, '...'),
    ),
  ];

  static List<HomeCardItem> servicesItems() => List.generate(10, (i) {
    return HomeCardItem(
      id: 'service_$i',
      categoryId: CategoryConstantID.medrar,
      imagePath: AppAssets.homeNewsPngs,
      title: 'خدمة رقم ${i + 1}',
      subtitle: 'وصف تفصيلي للخدمة رقم ${i + 1}'.padRight(100, '...'),
      route: AppRoutes.servicesDetail,
      price: 50.0 + (i * 10),
    );
  });

  static List<HomeCardItem> seasonalItems() => List.generate(10, (i) {
    return HomeCardItem(
      id: 'seasonal_$i',
      categoryId: CategoryConstantID.livery,
      imagePath: AppAssets.homeNewsPngs,
      title: 'حملة موسمية ${i + 1}',
      subtitle: 'تفاصيل حملة موسمية ${i + 1}'.padRight(100, '...'),
      route: AppRoutes.donation,
    );
  });

  static List<HomeCardItem> shareThingsItems() => List.generate(10, (i) {
    return HomeCardItem(
      id: 'share_$i',
      categoryId: CategoryConstantID.zad,
      imagePath: AppAssets.homeNewsPngs,
      title: 'شارك بما لا تحتاجه ${i + 1}',
      subtitle: 'تفاصيل عنصر مشاركه ${i + 1}'.padRight(100, '...'),
      route: AppRoutes.menu,
    );
  });

  static List<HomeCardItem> itemsForCategory(String categoryId) {
    if (categoryId == CategoryConstantID.medrar) return servicesItems();
    if (categoryId == CategoryConstantID.livery) return seasonalItems();
    return shareThingsItems();
  }
}
