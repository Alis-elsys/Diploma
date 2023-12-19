import 'package:flutter/material.dart';

//simple home Page

class HomePageWidget extends StatefulWidget{
  const HomePageWidget({super.key});
  
  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('WalletConnect Flutter Dapp'),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
