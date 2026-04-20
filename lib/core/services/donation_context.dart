class DonationContextService {
  static String? lastDonationTypeName;
  static String? lastProjectName;
  static String? lastCategoryId;

  static void setContext({
    required String? categoryId,
    required String? donationTypeName,
    required String? projectName,
  }) {
    lastCategoryId = categoryId;
    lastDonationTypeName = donationTypeName;
    lastProjectName = projectName;
  }
}
