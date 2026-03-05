

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class OfferTextBox extends StatelessWidget {
  const OfferTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth * .90,
            minWidth: 100,
            
          ),
          child: Padding(
            
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
               
                Text(
                 AppStrings.seasonalOffers,
                  style: CustomTextStyles.Cairo400style13
                      .copyWith(color: AppColors.white),
                ),
                  
                const SizedBox(height: 8),
                  
              
                Text(
                AppStrings.discount,
                  style: CustomTextStyles.Cairo700style19
                      .copyWith(color: AppColors.white),
                ),
                  
                const SizedBox(height: 14),
                  
               
                SizedBox(
                  width: double.infinity,
                  child: Container(
                   
                    padding: const EdgeInsets.symmetric(
                       horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                     AppStrings.shopNow,
                      style: CustomTextStyles.Cairo700style13
                          .copyWith(color: AppColors.primaryColor),textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}