// import 'package:flutter/material.dart';
// import 'package:walletconnect_flutter_dapp/home_page.dart';

// class NavBarModel extends NavBarWidget {
//   void initState(BuildContext context) {}

//   void dispose() {}
// }

// class NavBarWidget extends StatefulWidget {
//   const NavBarWidget({super.key});

//   @override
//   _NavBarWidgetState createState() => _NavBarWidgetState();
// }

// class _NavBarWidgetState extends State<NavBarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 90,
//       decoration: BoxDecoration(
//         color: Color(0x00EEEEEE),
//       ),
//       child: Stack(
//         children: [
//           Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Material(
//                 color: Colors.transparent,
//                 elevation: 0,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.vertical(
//                     bottom: Radius.circular(0),
//                     top: Radius.circular(20),
//                   ),
//                 ),
//                 child: Container(
//                   width: double.infinity,
//                   height: 80,
//                   decoration: const BoxDecoration(
//                     color: Color(0xfff1f4f8),
//                     boxShadow: [
//                       BoxShadow(
//                         blurRadius: 10,
//                         color: Color(0x1A57636C),
//                         offset: Offset(0, -10),
//                         spreadRadius: 0.1,
//                       )
//                     ],
//                     borderRadius: BorderRadius.vertical(
//                       bottom: Radius.circular(0),
//                       top: Radius.circular(20),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               buildIconButton(Icons.home_rounded, () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const HomePageWidget()),
//                 );
//               }),
//               buildIconButton(Icons.chat_bubble_rounded, () {
//                 // TODO: Implement chat functionality
//               }),
//               buildAddButton(() {
//                 // TODO: Implement add functionality
//               }),
//               buildIconButton(Icons.person, () {
//                 // TODO: Implement user profile functionality
//               }),
//               buildIconButton(Icons.settings_sharp, () {
//                 // TODO: Implement settings functionality
//               }),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   IconButton buildIconButton(IconData icon, VoidCallback onPressed) {
//     return IconButton(
//       onPressed: onPressed,
//       icon: Icon(
//         icon,
//         color: Color(0xFF9299A1),
//         size: 24,
//       ),
//       style: ButtonStyle(
//         fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
//         backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
//         shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(eccentricity: 1)),
//       ),
//     );
//   }

//   Widget buildAddButton(VoidCallback onPressed) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
//           child: IconButton(
//             onPressed: onPressed,
//             icon: Icon(
//               Icons.add,
//               color: Colors.white,
//               size: 30,
//             ),
//             style: ButtonStyle(
//               fixedSize: MaterialStateProperty.all<Size>(const Size(60, 60)),
//               backgroundColor: MaterialStateProperty.all<Color>(Color(0x4b39ef)),
//               shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(eccentricity: 25)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CustomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return NavBarWidget(); // Use the NavBarWidget directly
//   }
// }







import 'package:flutter/material.dart';
import '../home_page.dart';
import '../createNFT_page.dart';
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  void initState(BuildContext context) {}

  void dispose() {}
  
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
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
                //color: Colors.transparent,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
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
                    borderRadius: BorderRadius.vertical(
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
              buildIconButton(Icons.home_rounded, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePageWidget()),
                );
              }),
              buildIconButton(Icons.chat_bubble_rounded, () {
                // TODO: Implement chat functionality
              }),
              buildAddButton(() {}),
              buildIconButton(Icons.person, () {
                // TODO: Implement user profile functionality
              }),
              buildIconButton(Icons.settings_sharp, () {
                // TODO: Implement settings functionality
              }),
            ],
          ),
        ],
      ),
    );
  }

  IconButton buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Color(0xFF9299A1),
        size: 24,
      ),
      iconSize: 50, // Fixed icon size
      padding: EdgeInsets.zero, // No padding
    );
  }

  Widget buildAddButton(VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: IconButton(
                iconSize: 60,
                color: Colors.indigoAccent,
                focusColor: Colors.indigoAccent,
                hoverColor: Colors.indigoAccent,
                highlightColor: Colors.indigoAccent,
                splashColor: Colors.indigoAccent,
                disabledColor: Colors.indigoAccent,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  print('Add button pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreatePageWidget()),
                  );
                },
              ),
            ),
          ],
        );
    // return Padding(
    //   padding: const EdgeInsets.only(bottom: 10),
    //   child: Align(
    //   alignment: Alignment.bottomCenter,
    //  child: Ink(
    //     decoration: const ShapeDecoration(
    //       color: Colors.indigoAccent,
    //       shape: CircleBorder(),
    //     ),
    //     child: IconButton(
    //       onPressed: onPressed,
    //       icon: Icon(
    //         Icons.add,
    //         color: Colors.white,
    //         size: 30,
    //       ),
    //       iconSize: 60, // Fixed icon size
    //       padding: const EdgeInsets.all(15), // Adjust padding as per requirement
    //     ),
    //   ),
    // ),
    // );
  }
}

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavBar(); // Use the NavBar directly
  }
}






