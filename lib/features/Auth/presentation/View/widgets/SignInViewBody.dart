

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomFormField.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTopBar.dart';

class Signinviewbody extends StatelessWidget {
  const Signinviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            CustomTopBar(title: AuthStrings.loginTitle),
            Customformfield(),
          ]),
        ),
      ],
    );
  }
}