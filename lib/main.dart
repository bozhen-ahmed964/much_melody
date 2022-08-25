import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:muchmelody/providers/user_provider.dart';
import 'package:muchmelody/responsive/mobile_screenlayout.dart';
import 'package:muchmelody/responsive/responsive_layoutscreen.dart';
import 'package:muchmelody/responsive/web_screenlayout.dart';
import 'package:muchmelody/screen/login.dart';
import 'package:muchmelody/screen/signup.dart';
import 'package:muchmelody/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCbDlsxx-9rFk12gyrqAoIzfoOutKHQSQQ',
          appId: '1:39914802260:web:6a90a28bb8bed18f45f1c1',
          messagingSenderId: '39914802260',
          projectId: 'much-melody',
          storageBucket: 'much-melody.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Much Melody',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.data == null) {
              return Text('null');
            }

            //TODO: set the user on the provider
            Provider.of<UserProvider>(context, listen: false)
                .refreshUser(snapshot.data!);

            return const responsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            );

            // return LoginScreen();
          },
        ),
      ),
    );
  }
}
