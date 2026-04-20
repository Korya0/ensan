class FormValidators {
  // التحقق من البريد الإلكتروني
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

    final email = value.trim().toLowerCase();

    // ✅ الطول
    if (email.length < 5) {
      return 'البريد الإلكتروني قصير جدًا';
    }
    if (email.length > 30) {
      return 'البريد الإلكتروني طويل جدًا (الحد الأقصى 30)';
    }

    // ✅ Regex عملي: username + domain + TLD
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9]([._-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,10})+$',
    );

    if (!emailRegex.hasMatch(email)) {
      return 'أدخل بريد إلكتروني صحيح';
    }

    final parts = email.split('@');
    if (parts.length != 2) {
      return 'البريد الإلكتروني غير صالح';
    }

    final username = parts[0];
    final domain = parts[1];

    // ✅ username ما يبدأش/ينتهيش برمز
    if (username.startsWith('.') ||
        username.startsWith('-') ||
        username.startsWith('_') ||
        username.endsWith('.') ||
        username.endsWith('-') ||
        username.endsWith('_')) {
      return 'اسم المستخدم غير صالح';
    }

    // ✅ منع الرموز المتكررة
    if (username.contains('..') ||
        username.contains('__') ||
        username.contains('--')) {
      return 'اسم المستخدم يحتوي على رموز متكررة غير صالحة';
    }

    // ✅ domain لازم فيه نقطة
    if (!domain.contains('.')) {
      return 'النطاق غير صالح';
    }

    // ✅ domain ما يبدأش/ينتهيش بـ -
    if (domain.startsWith('-') || domain.endsWith('-')) {
      return 'النطاق غير صالح';
    }

    // ✅ TLD الطول من 2 لـ 10
    final tld = domain.split('.').last;
    if (tld.length < 2 || tld.length > 10) {
      return 'امتداد النطاق غير صالح';
    }

    return null; // ✅ Valid
  }

  // التحقق من الاسم (إنجليزي فقط + اسم ثنائي)
  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    }

    final username = value.trim();

    // التحقق من أن الاسم يحتوي على حروف إنجليزية ومسافة فقط
    final usernameRegex = RegExp(r'^[A-Za-z]+( [A-Za-z]+)+$');
    if (!usernameRegex.hasMatch(username)) {
      return 'الاسم يجب أن يكون بالإنجليزية وكلمتين على الأقل بدون أرقام أو رموز';
    }

    if (username.length < 3) {
      return 'الاسم قصير جدًا';
    }
    if (username.length > 30) {
      return 'الاسم يجب أن يكون أقل من 30 حرفًا';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    if (value.length > 128) return 'كلمة المرور طويلة جدًا';

    if (value.contains(' ')) {
      return 'كلمة المرور لا يمكن أن تحتوي على مسافات';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على رمز خاص واحد على الأقل';
    }
    if (RegExp(r'(.)\1{2,}').hasMatch(value)) {
      return 'كلمة المرور لا يمكن أن تحتوي على حروف متكررة بشكل متتابع';
    }
    if (_containsSequential(value)) {
      return 'كلمة المرور لا يمكن أن تحتوي على حروف أو أرقام متسلسلة';
    }

    final commonPasswords = [
      'password',
      '12345678',
      'password123',
      'admin123',
      'qwerty123',
      'letmein',
      'welcome123',
      'changeme',
    ];
    if (commonPasswords.contains(value.toLowerCase())) {
      return 'كلمة المرور شائعة جدًا، الرجاء اختيار كلمة أقوى';
    }

    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'مطلوب إدخال مبلغ التبرع';
    }
    final parsedValue = num.tryParse(value.trim());
    if (parsedValue == null) {
      return 'الرجاء إدخال رقم صالح';
    }
    if (parsedValue <= 0) {
      return 'المبلغ يجب أن يكون أكبر من صفر';
    }
    return null;
  }

  // التحقق من التسلسل
  static bool _containsSequential(String password) {
    final lower = password.toLowerCase();
    for (int i = 0; i < lower.length - 2; i++) {
      final char1 = lower.codeUnitAt(i);
      final char2 = lower.codeUnitAt(i + 1);
      final char3 = lower.codeUnitAt(i + 2);
      if (char2 == char1 + 1 && char3 == char2 + 1) {
        return true;
      }
    }
    final sequences = ['123', '234', '345', '456', '567', '678', '789', '890'];
    for (final seq in sequences) {
      if (lower.contains(seq)) return true;
    }
    return false;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    }

    final name = value.trim();

    if (name.length > 50) {
      return 'الاسم طويل جداً';
    }

    // التأكد أن الاسم يحتوي فقط على أحرف عربية ومسافات
    if (!RegExp(r'^[\u0600-\u06FF\u0750-\u077F\s]+$').hasMatch(name)) {
      return 'الاسم يجب أن يحتوي على حروف عربية فقط';
    }

    // تقسيم الاسم إلى كلمات
    final words = name
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();

    if (words.length < 3) {
      return 'الاسم يجب أن يتكون من ثلاث كلمات على الأقل';
    }

    // التأكد أن كل كلمة مكونة من حرفين على الأقل
    for (final word in words) {
      if (word.length < 2) {
        return 'كل كلمة يجب أن تتكون من حرفين على الأقل';
      }
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "رقم الهاتف مطلوب";
    }

    // Remove spaces and special characters for validation
    final cleanPhone = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // Check if it's all digits
    if (!RegExp(r'^\d+$').hasMatch(cleanPhone)) {
      return "رقم الهاتف يجب أن يحتوي على أرقام فقط";
    }

    // Egyptian phone number validation
    if (cleanPhone.length < 10) {
      return "رقم الهاتف قصير جداً";
    }

    if (cleanPhone.length > 15) {
      return "رقم الهاتف طويل جداً";
    }

    return null;
  }

  static String? validateAddress(String? value, {bool isRequired = true}) {
    if (!isRequired && (value == null || value.trim().isEmpty)) {
      return null; // الحقل اختياري
    }

    if (value == null || value.trim().isEmpty) {
      return 'العنوان مطلوب';
    }

    final address = value.trim();

    if (address.length < 5) {
      return 'العنوان قصير جداً';
    }

    if (address.length > 200) {
      return 'العنوان طويل جداً';
    }

    // يجب أن يحتوي العنوان على الأقل على كلمتين
    final words = address
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();
    if (words.length < 2) {
      return 'العنوان يجب أن يحتوي على كلمتين على الأقل';
    }

    // السماح بالأحرف العربية + الأرقام + بعض الرموز مثل - , . /
    if (!RegExp(r'^[\u0600-\u06FF0-9\s\-\.,/]+$').hasMatch(address)) {
      return 'العنوان يجب أن يحتوي على أحرف عربية وأرقام فقط';
    }

    return null;
  }
}
