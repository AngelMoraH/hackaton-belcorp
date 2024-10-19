import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lumea/map/views/map_view.dart';
import 'package:lumea/recommendation/viewmodels/recommendation_viewmodel.dart';
import 'package:lumea/recommendation/views/recommendation_view.dart';
import 'package:lumea/user/viewmodels/user_viewmodel.dart';
import 'package:lumea/user/views/user_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.last;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => RecommendationViewmodel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const UserView(),
          '/recommendation': (context) => RecommendationView(
                camera: camera,
              ),
          '/map': (context) => const MapView(),
        },
      ),
    );
  }
}
