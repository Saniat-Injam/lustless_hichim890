import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/payment/controller/payment_controller.dart';
import 'package:lustless_hichim890/features/payment/widget/custom_pricelist_widget.dart';
import 'package:lustless_hichim890/features/payment/widget/payment_bottom_sheet.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  IconPath.lustlesslogo,
                  width: 200,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Unlock Full Potential",
                    style: getTextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                SizedBox(
                  height: 450,
                  child: Obx(
                    () =>
                        controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : controller.errorMessage.value.isNotEmpty
                            ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.errorMessage.value,
                                    style: getTextStyle(
                                      fontSize: 16,
                                      color: AppColors.textWhite,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: controller.fetchPlans,
                                    child: Text(
                                      'Retry',
                                      style: getTextStyle(
                                        fontSize: 16,
                                        color: AppColors.darkBackground,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : controller.plans.isEmpty
                            ? Center(
                              child: Text(
                                'No subscription plans available',
                                style: getTextStyle(
                                  fontSize: 16,
                                  color: AppColors.textWhite,
                                ),
                              ),
                            )
                            : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.plans.length,
                              separatorBuilder:
                                  (context, index) => const SizedBox(width: 20),
                              itemBuilder: (context, index) {
                                final plan = controller.plans[index];
                                return Container(
                                  width: 350,
                                  height: 344,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      width: 2,
                                      color: AppColors.secondary,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.transparent,
                                        spreadRadius: 4,
                                        blurRadius: 5,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 74,
                                              ),
                                              child: Text(
                                                "\$${plan.amount.toStringAsFixed(2)}",
                                                style: getTextStyle(
                                                  fontSize: 48,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.textWhite,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 45,
                                              right: 0,
                                              child: Text(
                                                "/ ${plan.durationDays == 0 ? 'lifetime' : '${plan.durationDays} days'}",
                                                style: getTextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.blurTextColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "All Free features, plus: Advanced analytics",
                                          style: getTextStyle(
                                            fontSize: 10.7,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blurTextColor,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "(mood/sleep correlations)",
                                          style: getTextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blurTextColor,
                                          ),
                                        ),
                                        const SizedBox(height: 13),
                                        Divider(
                                          height: 1,
                                          color: AppColors.dividerColor,
                                        ),
                                        const SizedBox(height: 14),
                                        const CustomPriceListWidget(
                                          imagePath: IconPath.checkicon,
                                          text: 'Full Access',
                                        ),
                                        const SizedBox(height: 10),
                                        const CustomPriceListWidget(
                                          imagePath: IconPath.checkicon,
                                          text: 'Ad-free experience',
                                        ),
                                        const SizedBox(height: 10),
                                        const CustomPriceListWidget(
                                          imagePath: IconPath.checkicon,
                                          text: 'Live Chat Support',
                                        ),
                                        const SizedBox(height: 26),
                                        GestureDetector(
                                          onTap: () {
                                            showPaymentBottomSheet(
                                              context,
                                              planId: plan.id,
                                              amount: plan.amount,
                                              durationDays: plan.durationDays,
                                            );
                                          },
                                          child: Center(
                                            child: Container(
                                              width: double.infinity,
                                              height: 43,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      AppColors.textSecondary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color:
                                                    AppColors.primaryBackground,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Next",
                                                  style: getTextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        AppColors
                                                            .darkBackground,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
