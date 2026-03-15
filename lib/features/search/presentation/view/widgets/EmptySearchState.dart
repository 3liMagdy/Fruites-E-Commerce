import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class EmptySearchState extends StatelessWidget {
  const EmptySearchState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'لا توجد نتائج بحث',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'حاول البحث بكلمة أخرى أو مراجعة التهجئة',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
