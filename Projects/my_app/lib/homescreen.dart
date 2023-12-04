import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('Buy Now'),
              onPressed: () async {
                await makePayment();
              },
            ),
          ],
        ),
      ),
    );
  }


  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'sk_test_51OFkVyJqYgKx7O77RVpAx9s5YtJiULJ5KJIoe6YYhUkPT3NA1F7dTH3crGBOePymU8PndeiCiu1hSdzx2ouefr6o0026Wbl3l5',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> makePayment() async {
    try{
      paymentIntent = await createPaymentIntent('1', 'LV');

      var gpay = const PaymentSheetGooglePay(merchantCountryCode: "BG",
      currencyCode: "LV",
      testEnv: true);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: 
          paymentIntent!['client_secret'], //Gotten from payment intent
          style: ThemeMode.dark,
          merchantDisplayName: 'Example Inc.',
          googlePay: gpay))
      .then((value) {});
    }
    catch(e){
      print(e);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Payment Successfully");
      });
    } catch (e) {
      print('$e');
    }
  }

}
