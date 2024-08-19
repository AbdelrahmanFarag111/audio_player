import 'package:aduio_player/bloc/theme/theme_bloc.dart';
import 'package:aduio_player/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/app_theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'PlayZilla',
              theme: AppThemeData.getTheme(),
              onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
            );
          },
        );
      },
    );
  }
}
