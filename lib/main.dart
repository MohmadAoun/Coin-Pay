import 'package:coin_pay/coin_pay_app.dart';
import 'package:coin_pay/core/routing/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CoinPayApp(
      appRouter: AppRouter(),
    ),
  );
}
