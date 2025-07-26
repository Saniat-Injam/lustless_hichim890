import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/payment/controller/payment_controller.dart';
import 'package:lustless_hichim890/services/stripe_service.dart';

void showPaymentBottomSheet(
  BuildContext context, {
  required String planId,
  required double amount,
  required int durationDays,
}) {
  try {
    final PaymentController controller = Get.find<PaymentController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: AppColors.secondary,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 204, 200, 200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Duration: $durationDays days',
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBackground,
                      ),
                    ),
                    Text(
                      'Amount: \$${amount.toStringAsFixed(2)}',
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBackground,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Note: ',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'This gmail is also use for registration.',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) => controller.setEmail(value),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter Gmail Address',
                  labelStyle: getTextStyle(fontSize: 14, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.textSecondary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primaryBackground),
                  ),
                  filled: true,
                  // ignore: deprecated_member_use
                  fillColor: AppColors.darkBackground.withOpacity(0.1),
                  hintStyle: getTextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                style: getTextStyle(fontSize: 16, color: AppColors.textWhite),
              ),
              const SizedBox(height: 16),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        controller.isEmailValid.value &&
                                !controller.isLoading.value
                            ? () async {
                              controller.isLoading.value = true;
                              try {
                                bool hasSubscription = await controller
                                    .checkSubscription(controller.email.value);
                                if (hasSubscription) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(
                                        child: Text(
                                          'This user already has an active plan.',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      backgroundColor: Colors.red[600],
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.only(
                                        top: 60,
                                        left: 16,
                                        right: 16,
                                        bottom:
                                            // ignore: use_build_context_synchronously
                                            MediaQuery.of(context).size.height -
                                            100,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 8,
                                      duration: const Duration(seconds: 3),
                                    ),
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pop();
                                } else {
                                  await StripeService.instance.makePayment(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    planId: planId,
                                    amount: amount,
                                    email: controller.email.value,
                                    durationDays: durationDays,
                                  );
                                }
                              } catch (e) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Error checking subscription: $e',
                                    ),
                                  ),
                                );
                              } finally {
                                controller.isLoading.value = false;
                              }
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          controller.isEmailValid.value &&
                                  !controller.isLoading.value
                              ? Colors.green
                              // ignore: deprecated_member_use
                              : AppColors.textSecondary.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Obx(
                      () =>
                          controller.isLoading.value
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              )
                              : Text(
                                'Pay Now',
                                style: getTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      controller.isEmailValid.value &&
                                              !controller.isLoading.value
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: Please ensure PaymentController is initialized'),
      ),
    );
  }
}
