import 'package:coin_pay/core/routing/app_router.dart';
import 'package:coin_pay/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinPayApp extends StatelessWidget {
  final AppRouter appRouter;
  const CoinPayApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 851.28),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}
