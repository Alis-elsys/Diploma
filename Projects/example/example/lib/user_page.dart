
// import '/flutter_flow/random_data_util.dart' as random_data;
// import 'package:badges/badges.dart' as badges;
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';


// class UserPageWidget extends StatefulWidget {
//   const UserPageWidget({super.key});

//   @override
//   State<UserPageWidget> createState() => _UserPageWidgetState();
// }

// class _UserPageWidgetState extends State<UserPageWidget>
//     with TickerProviderStateMixin {

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   final animationsMap = {
//     'containerOnPageLoadAnimation': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         VisibilityEffect(duration: 1.ms),
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: 0,
//           end: 1,
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: Offset(0, 20),
//           end: Offset(0, 0),
//         ),
//         TiltEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: Offset(0.698, 0),
//           end: Offset(0, 0),
//         ),
//       ],
//     ),
//   };

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: scaffoldKey,
//         backgroundColor: Color(0xFFF1F4F8),
//         //add appbar
//         body: SafeArea(
//           top: true,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 4,
//                       color: Color(0x33000000),
//                       offset: Offset(0, 2),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 12),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 44,
//                             height: 44,
//                             decoration: BoxDecoration(
//                               color: Color(0x4C4B39EF),
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Color(0xFF4B39EF),
//                                 width: 2,
//                               ),
//                             ),
//                             child: Container(
//                               width: 120,
//                               height: 120,
//                               clipBehavior: Clip.antiAlias,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Image.network(
//                                 'https://picsum.photos/seed/847/600',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         0, 0, 0, 4),
//                                     child: Text(
//                                       'Welcome',
//                                       style: FlutterFlowTheme.of(context)
//                                           .headlineMedium
//                                           .override(
//                                             fontFamily: 'Outfit',
//                                             color: Color(0xFF14181B),
//                                             fontSize: 24,
//                                             fontWeight: FontWeight.normal,
//                                           ),
//                                     ),
//                                   ),
//                                   Text(
//                                     'address',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .override(
//                                           fontFamily: 'Plus Jakarta Sans',
//                                           color: Color(0xFF14181B),
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.normal,
//                                         ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
//                                 child: Icon(
//                                   Icons.radio_button_checked,
//                                   color: Color(0xFF4B39EF),
//                                   size: 16,
//                                 ),
//                               ),
//                               Text(
//                                 'Bought',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Plus Jakarta Sans',
//                                       color: Color(0xFF14181B),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
//                                 child: Icon(
//                                   Icons.radio_button_checked,
//                                   color: Color(0xFF39D2C0),
//                                   size: 16,
//                                 ),
//                               ),
//                               Text(
//                                 'Sold',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Plus Jakarta Sans',
//                                       color: Color(0xFF14181B),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Container(
//                         width: double.infinity,
//                         height: 200,
//                         child: FlutterFlowLineChart(
//                           data: [
//                             FFLineChartData(
//                               xData: List.generate(
//                                   random_data.randomInteger(0, 0),
//                                   (index) => random_data.randomInteger(0, 10)),
//                               yData: List.generate(
//                                   random_data.randomInteger(0, 0),
//                                   (index) => random_data.randomInteger(0, 10)),
//                               settings: LineChartBarData(
//                                 color: Color(0xFF4B39EF),
//                                 barWidth: 2,
//                                 isCurved: true,
//                                 preventCurveOverShooting: true,
//                                 dotData: FlDotData(show: false),
//                                 belowBarData: BarAreaData(
//                                   show: true,
//                                   color: Color(0x4C4B39EF),
//                                 ),
//                               ),
//                             ),
//                             FFLineChartData(
//                               xData: List.generate(
//                                   random_data.randomInteger(0, 0),
//                                   (index) => random_data.randomInteger(0, 200)),
//                               yData: List.generate(
//                                   random_data.randomInteger(0, 0),
//                                   (index) => random_data.randomInteger(0, 200)),
//                               settings: LineChartBarData(
//                                 color: Color(0xFF39D2C0),
//                                 barWidth: 2,
//                                 isCurved: true,
//                                 preventCurveOverShooting: true,
//                                 dotData: FlDotData(show: false),
//                                 belowBarData: BarAreaData(
//                                   show: true,
//                                   color: Color(0x3239D2C0),
//                                 ),
//                               ),
//                             )
//                           ],
//                           chartStylingInfo: ChartStylingInfo(
//                             enableTooltip: true,
//                             backgroundColor: Colors.white,
//                             showBorder: false,
//                           ),
//                           axisBounds: AxisBounds(),
//                           xAxisLabelInfo: AxisLabelInfo(
//                             title: 'Last 30 Days',
//                             titleTextStyle: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Plus Jakarta Sans',
//                                   color: Color(0xFF14181B),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                           ),
//                           yAxisLabelInfo: AxisLabelInfo(
//                             title: 'Avg. Grade',
//                             titleTextStyle: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Plus Jakarta Sans',
//                                   color: Color(0xFF14181B),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         blurRadius: 3,
//                         color: Color(0x33000000),
//                         offset: Offset(0, 1),
//                       )
//                     ],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 4),
//                           child: Text(
//                             'Summary',
//                             style: FlutterFlowTheme.of(context)
//                                 .headlineMedium
//                                 .override(
//                                   fontFamily: 'Outfit',
//                                   color: Color(0xFF14181B),
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
//                           child: Text(
//                             'A summary of all transactions.',
//                             style:
//                                 FlutterFlowTheme.of(context).bodySmall.override(
//                                       fontFamily: 'Plus Jakarta Sans',
//                                       color: Color(0xFF14181B),
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//                           child: ListView(
//                             padding: EdgeInsets.zero,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.vertical,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                                 child: Container(
//                                   width: 100,
//                                   height: 120,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                         blurRadius: 0,
//                                         color: Color(0xFFE0E3E7),
//                                         offset: Offset(0, 1),
//                                       )
//                                     ],
//                                   ),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         0, 0, 0, 2),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   16, 8, 0, 8),
//                                           child: Container(
//                                             width: 4,
//                                             height: 100,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xFF4B39EF),
//                                               borderRadius:
//                                                   BorderRadius.circular(4),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     12, 12, 12, 0),
//                                             child: Column(
//                                               mainAxisSize: MainAxisSize.max,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(0, 0, 0, 4),
//                                                   child: Text(
//                                                     'Titile',
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodySmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF14181B),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.normal,
//                                                         ),
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   ' Description here this one is really long and it goes over maybe? And goes to two lines.',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         fontFamily:
//                                                             'Plus Jakarta Sans',
//                                                         color:
//                                                             Color(0xFF14181B),
//                                                         fontSize: 14,
//                                                         fontWeight:
//                                                             FontWeight.normal,
//                                                       ),
//                                                 ),
//                                                 Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(0, 8, 0, 0),
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     children: [
//                                                       Padding(
//                                                         padding:
//                                                             EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                                     0, 0, 4, 0),
//                                                         child: Text(
//                                                           'Date',
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodySmall
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'Plus Jakarta Sans',
//                                                                 color: Color(
//                                                                     0xFF14181B),
//                                                                 fontSize: 12,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal,
//                                                               ),
//                                                         ),
//                                                       ),
//                                                       Expanded(
//                                                         child: Text(
//                                                           '20.20.2024',
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodyMedium
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'Plus Jakarta Sans',
//                                                                 color: Color(
//                                                                     0xFF14181B),
//                                                                 fontSize: 14,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal,
//                                                               ),
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                                     0, 0, 8, 0),
//                                                         child: badges.Badge(
//                                                           badgeContent: Text(
//                                                             '1',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Colors
//                                                                       .white,
//                                                                   fontSize: 14,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .normal,
//                                                                 ),
//                                                           ),
//                                                           showBadge: true,
//                                                           shape: badges
//                                                               .BadgeShape
//                                                               .circle,
//                                                           badgeColor:
//                                                               Color(0xFF4B39EF),
//                                                           elevation: 4,
//                                                           padding:
//                                                               EdgeInsets.all(8),
//                                                           position: badges
//                                                                   .BadgePosition
//                                                               .topStart(),
//                                                           animationType: badges
//                                                               .BadgeAnimationType
//                                                               .scale,
//                                                           toAnimate: true,
//                                                           child: Padding(
//                                                             padding:
//                                                                 EdgeInsetsDirectional
//                                                                     .fromSTEB(
//                                                                         16,
//                                                                         4,
//                                                                         0,
//                                                                         0),
//                                                             child: Text(
//                                                               'bougth',
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'Plus Jakarta Sans',
//                                                                     color: Color(
//                                                                         0xFF4B39EF),
//                                                                     fontSize:
//                                                                         14,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .normal,
//                                                                   ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                                 child: Container(
//                                   width: 100,
//                                   height: 120,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                         blurRadius: 0,
//                                         color: Color(0xFFE0E3E7),
//                                         offset: Offset(0, 1),
//                                       )
//                                     ],
//                                   ),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         0, 0, 0, 2),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   16, 8, 0, 8),
//                                           child: Container(
//                                             width: 4,
//                                             height: 100,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xFF4B39EF),
//                                               borderRadius:
//                                                   BorderRadius.circular(4),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     12, 12, 12, 0),
//                                             child: Column(
//                                               mainAxisSize: MainAxisSize.max,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(0, 0, 0, 4),
//                                                   child: Text(
//                                                     'Title',
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodySmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF14181B),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.normal,
//                                                         ),
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   ' Description here this one is really long and it goes over maybe? And goes to two lines.',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         fontFamily:
//                                                             'Plus Jakarta Sans',
//                                                         color:
//                                                             Color(0xFF14181B),
//                                                         fontSize: 14,
//                                                         fontWeight:
//                                                             FontWeight.normal,
//                                                       ),
//                                                 ),
//                                                 Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(0, 8, 0, 0),
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     children: [
//                                                       Padding(
//                                                         padding:
//                                                             EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                                     0, 0, 4, 0),
//                                                         child: Text(
//                                                           'Date',
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodySmall
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'Plus Jakarta Sans',
//                                                                 color: Color(
//                                                                     0xFF14181B),
//                                                                 fontSize: 12,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal,
//                                                               ),
//                                                         ),
//                                                       ),
//                                                       Expanded(
//                                                         child: Text(
//                                                           '20.20.2024',
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodyMedium
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'Plus Jakarta Sans',
//                                                                 color: Color(
//                                                                     0xFF14181B),
//                                                                 fontSize: 14,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal,
//                                                               ),
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                                     0, 0, 8, 0),
//                                                         child: badges.Badge(
//                                                           badgeContent: Text(
//                                                             '1',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Colors
//                                                                       .white,
//                                                                   fontSize: 14,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .normal,
//                                                                 ),
//                                                           ),
//                                                           showBadge: true,
//                                                           shape: badges
//                                                               .BadgeShape
//                                                               .circle,
//                                                           badgeColor:
//                                                               Color(0xFF4B39EF),
//                                                           elevation: 4,
//                                                           padding:
//                                                               EdgeInsets.all(8),
//                                                           position: badges
//                                                                   .BadgePosition
//                                                               .topStart(),
//                                                           animationType: badges
//                                                               .BadgeAnimationType
//                                                               .scale,
//                                                           toAnimate: true,
//                                                           child: Padding(
//                                                             padding:
//                                                                 EdgeInsetsDirectional
//                                                                     .fromSTEB(
//                                                                         16,
//                                                                         4,
//                                                                         0,
//                                                                         0),
//                                                             child: Text(
//                                                               'sold',
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'Plus Jakarta Sans',
//                                                                     color: Color(
//                                                                         0xFF4B39EF),
//                                                                     fontSize:
//                                                                         14,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .normal,
//                                                                   ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ).animateOnPageLoad(
//                     animationsMap['containerOnPageLoadAnimation']!),
//               ),
//             ],
//           ),
//         ),
//     );
//   }
// }
