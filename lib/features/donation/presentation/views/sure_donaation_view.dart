import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:ensan_app/features/donation/presentation/widgets/sure_donate/sure_donaation_form.dart';
import 'package:flutter/material.dart';

class SureDonaationView extends StatelessWidget {
  final String paymentMethod;

  const SureDonaationView({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _getPaymentMethodTitle(), showArrow: true),
      body: SafeArea(
        child: AppAnimations.fadeInUp(
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: SureDonationForm(paymentMethod: paymentMethod),
          ),
          duration: Duration(milliseconds: 600),
        ),
      ),
    );
  }

  String _getPaymentMethodTitle() {
    switch (paymentMethod) {
      case 'instapay':
        return 'التبرع عبر انستاباى';
      case 'vodafone_cache':
        return 'التبرع عبر فودافون كاش';
      case 'cash_delivery':
        return 'طلب تبرع كاش';
      default:
        return 'طريقة الدفع';
    }
  }
}
