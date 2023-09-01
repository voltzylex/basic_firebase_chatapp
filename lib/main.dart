import 'package:firebase_chat_app/Services/auth/auth_services.dart';
import 'package:firebase_chat_app/firebase_options.dart';
import 'package:firebase_chat_app/imports.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    // Single Provider
    /* ChangeNotifierProvider(
       create: (context) => AuthServices(),
       child: const MainApp(),
     ), */
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthServices()
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.grey.shade300,
      ),
      home: const AuthGate(),
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => const LoginPage(),
      //   "register": (context) => const RegisterPage(),
      // },
    );
  }
}
