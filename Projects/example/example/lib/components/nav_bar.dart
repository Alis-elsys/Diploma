import 'package:flutter/material.dart';
import 'package:walletconnect_flutter_dapp/home_page.dart';
//import 'dart:html';

// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'nav_bar.dart';
export 'nav_bar.dart';

class NavBarModel extends NavBarWidget {
  /// Initialization and dsposal methods.

  void initState(BuildContext context) {}

  void dispose() {}
}

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  // late NavBarModel _model;

  // @override
  // void setState(VoidCallbackAction callback) {
  //   super.setState(callback);
  //   _model.onUpdate();
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   _model = createModel(context, () => NavBarModel());
  // }

  // @override
  // void dispose() {
  //   _model.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: 
                    BorderRadius.vertical(
                      bottom: Radius.circular(0),
                      top: Radius.circular(20),
                    ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xfff1f4f8),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x1A57636C),
                        offset: Offset(0, -10),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: 
                      BorderRadius.vertical(
                        bottom: Radius.circular(0),
                        top: Radius.circular(20),
                      ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: (){ 
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const HomePageWidget())
                  ); 
                }, 
                icon: const Icon(
                  Icons.home_rounded,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                style: ButtonStyle(                  
                  fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(eccentricity: 30)),
                ),
              ),
              
              IconButton(
                onPressed:() {
                  //TODO
                },
                icon: const Icon(
                  Icons.chat_bubble_rounded,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(eccentricity: 30)),
                ),
                ),
               
               Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: IconButton(
                      onPressed: (){
                        //TODO
                      }, 
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                      style:ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(const Size(60, 60)),
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0x4b39ef)),
                        shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(eccentricity: 25)),
                      ),
                    ),
                  ),
                ],
              ),

              IconButton(
                onPressed: (){
                  //TODO
                },
                icon: const Icon(
                  Icons.person,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(eccentricity: 30)),
                ),
              ),

              IconButton(
                onPressed: () {
                  //TODO
                }, 
                icon: const Icon(
                  Icons.settings_sharp,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(eccentricity: 30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavBarWidget(); // Use the NavBarWidget directly
  }
}