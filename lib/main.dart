import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wisata_solo/controllers/home.dart';
import 'package:wisata_solo/view/detail.dart';
import 'package:wisata_solo/view/home.dart';
import 'package:wisata_solo/view/splash.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  // timeDilation = 5.0;

  WidgetsFlutterBinding.ensureInitialized();
  FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(const _MyApp());
}

class _MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControllerHome(), fenix: true);
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(
      const AssetImage('images/splash_screen.jpg'),
      context,
    );

    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.getTextTheme('Poppins'),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      initialBinding: _MyBindings(),
      getPages: [
        GetPage(name: '/splash', page: () => const ViewSplash()),
        GetPage(name: '/', page: () => const ViewHome()),
        GetPage(name: '/detail', page: () => const ViewDetail()),
      ],
    );
  }
}
