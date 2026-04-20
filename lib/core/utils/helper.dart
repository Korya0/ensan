import 'package:ensan_app/features/home/data/unified_home_data.dart';

class CategoryHelper {
  /// ================== Helpers ==================
  static const Set<String> donationCategories = {
    CategoryConstantID.missionsOfHope,
    CategoryConstantID.guestHouse,
  };

  static const Set<String> contactCategories = {
    CategoryConstantID.missionsOfHope,
    CategoryConstantID.guestHouse,
    CategoryConstantID.livery,
  };

  static const Set<String> borderedContactCategories = {
    CategoryConstantID.missionsOfHope,
    CategoryConstantID.guestHouse,
  };

  static const Set<String> cardsCategories = {
    CategoryConstantID.medrar,
    CategoryConstantID.zad,
  };
}
