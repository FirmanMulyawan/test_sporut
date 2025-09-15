import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sizer/sizer.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'component/config/app_const.dart';
import 'component/config/app_route.dart';
import 'component/config/app_style.dart';
import 'component/util/storage_util.dart';

final logger = Logger(
  level: kDebugMode ? Level.all : Level.warning,
  output: MultiOutput([
    ConsoleOutput(),
  ]),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await dotenv.load(fileName: '.env');
  await _dependencyInjection();

  runApp(const AppInitializer());
}

Future _dependencyInjection() async {
  final storage = StorageUtil(SecureStorage());
  Get.lazyPut(() => storage, fenix: true);
}

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  Future<void> _setOrientation(BuildContext context) async {
    final isTablet = _isTablet(context);

    await SystemChrome.setPreferredOrientations(
      isTablet
          ? [
              DeviceOrientation.portraitUp,
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]
          : [
              DeviceOrientation.portraitUp,
            ],
    );
  }

  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setOrientation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: AppStyle.dialogBgColor,
      child: Sizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            title: AppConst.appName,
            theme: AppStyle.themeData(context),
            initialRoute: AppRoute.defaultRoute,
            unknownRoute: GetPage(
                name: AppRoute.notFound, page: () => const UnknownRoutePage()),
            getPages: AppRoute.pages,
          );
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConst.appName,
      initialRoute: AppRoute.defaultRoute,
      // theme: AppTheme.themeLight,
      theme: AppStyle.themeData(context),
      unknownRoute: GetPage(
          name: AppRoute.notFound, page: () => const UnknownRoutePage()),
      getPages: AppRoute.pages,
    );
  }
}

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('No route defined for this page')),
    );
  }
}
