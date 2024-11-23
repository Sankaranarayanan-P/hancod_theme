import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hancod_theme/hancod_theme.dart';

class AppTheme {
  const AppTheme._();

  static const double textFieldBorderRadius = 12;

  static final lightTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: 'Lato',
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bgColor,
  );

  static final darkTheme = ThemeData(useMaterial3: true);

  static Brightness get currentSystemBrightness =>
      PlatformDispatcher.instance.platformBrightness;

  static const _inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.inputOutline,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static final defaultInputDecoration = InputDecoration(
    focusedBorder: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    enabledBorder: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    hintStyle: AppText.text16W500.copyWith(color: AppColors.greyText),
    border: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    errorBorder: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.primary),
    ),
  );

  static final largeScreenInputDecoration = InputDecoration(
    focusedBorder: _inputBorder,
    enabledBorder: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    border: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    errorBorder: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.primary),
    ),
  );

  static final screenInputDecoration = InputDecoration(
    fillColor: AppColors.fillColor,
    filled: true,
    enabledBorder: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    border: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    errorBorder: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.errorBorder),
    ),
  );

  static final screenInputDecorationWithPrefixIcon = InputDecoration(
    // prefixIcon: Assets.icons.searchIcon1.svg(),
    fillColor: AppColors.fillColor,
    filled: true,
    enabledBorder: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    border: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    errorBorder: _inputBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.errorBorder),
    ),
    // Add shadow effect
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    isDense: true,
    constraints: const BoxConstraints(minHeight: 50),
    // Use BoxDecoration for shadow
    // decoration: BoxDecoration(
    //   color: AppColors.fillColor,
    //   borderRadius: BorderRadius.circular(12),
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.black.withOpacity(0.1),
    //       blurRadius: 8,
    //       offset: const Offset(0, 2),
    //     ),
    //   ],
    // ),
  );

  static void setStatusBarAndNavigationBarColors() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }
}
