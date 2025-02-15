import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:litplay/splash/Splashscreen.dart";

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();


  await dotenv.load();
  print(dotenv.env); //

  runApp(const Litplay());
}
class Litplay extends StatelessWidget {
  const Litplay({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
