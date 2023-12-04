import 'package:flutter/material.dart';
import 'package:my_app/utils/routes.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:my_app/homescreen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = "pk_test_51OFkVyJqYgKx7O77UgiYQUNWUM5KuUgivQWN3RwGPtBBHB0wTwcLlm5Rc6GAv3dlYGkWxCBm0STS0XkHn0fjuLcw00elCQ6JEu";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

