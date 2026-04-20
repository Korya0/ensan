import 'package:ensan_app/core/common/widgets/custom_app_bar.dart';
import 'package:ensan_app/features/cart/presentation/widgets/cart_card.dart';
import 'package:ensan_app/features/cart/presentation/widgets/cart_summary_card.dart';
import 'package:ensan_app/features/cart/presentation/widgets/empty_cart_widget.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool emptycart = false;
    return Scaffold(
      appBar: const CustomAppBar(title: 'سلة'),
      body: SafeArea(
        bottom: false,
        child: emptycart == true
            ? EmptyCartWidget()
            : Stack(
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 160),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return CartCard(projectName: 'خدمة 1', projectPrice: 50);
                    },
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CartSummaryCard(
                      totalProjects: 1,
                      totalAmount: '1000 جنية مصري',
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
