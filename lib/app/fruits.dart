import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/app_cubit/app_cubit.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/features/splash/presention/views/splash_view.dart';
import '../generated/l10n.dart';

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getIt.allReady(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        return BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {

            // أثناء التحقق من الحالة
            if (state is AppInitial) {
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashView(),
              );
            }

            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
             routerConfig: AppRotuer.router(context),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: const Locale('ar'),
            );
          },
        );
      },
    );
  }
}