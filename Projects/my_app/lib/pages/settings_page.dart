import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import '../models/home_page_model.dart';
import 'start_page.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({Key? key}) : super(key: key);

  @override
  State<SettingsPageWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageWidget> {
  bool _isDarkMode = false;
  Web3ModalThemeData? _themeData;
  late HomePageModel _model;
  late StartPage _startPage;
  late String privateKey;
  late String myAddress;
  


  @override
  void initState() {
    super.initState();
    _model = HomePageModel();
    _model.initState(context);
    setState(() {
      final platformDispatcher = View.of(context).platformDispatcher;
      final platformBrightness = platformDispatcher.platformBrightness;
      _isDarkMode = platformBrightness == Brightness.dark;
    });
    _startPage = StartPage(
      swapTheme: () => _swapTheme(),
      changeTheme: () => _changeTheme(),
    );
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSquare = Web3ModalTheme.radiusesOf(context).isSquare();
    final isCircular = Web3ModalTheme.radiusesOf(context).isCircular();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
            icon: isSquare || isCircular
                ? const Icon(Icons.yard)
                : const Icon(Icons.yard_outlined),
            onPressed: _changeTheme,
          ),
          IconButton(
            icon: Web3ModalTheme.maybeOf(context)?.isDarkMode ?? false
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
            onPressed: _swapTheme,
          ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _startPage.disconnect();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _startPage),
                );
              },
            child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }



  void _swapTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  } 

  void _changeTheme() {
    setState(() {
      _themeData = (_themeData == null)
          ? Web3ModalThemeData(
              lightColors: Web3ModalColors.lightMode.copyWith(
                accent100: Colors.red,
                background100: const Color.fromARGB(255, 187, 234, 255),
                background125: const Color.fromARGB(255, 187, 234, 255),
              ),
              darkColors: Web3ModalColors.darkMode.copyWith(
                accent100: Colors.orange,
                background100: const Color.fromARGB(255, 36, 0, 120),
                background125: const Color.fromARGB(255, 36, 0, 120),
              ),
              radiuses: Web3ModalRadiuses.circular,
            )
          : null;
    });
  }
}