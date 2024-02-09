//import 'dart:js';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/home_page_model.dart';
import '../info_page.dart';

HomePageModel _model = HomePageModel();

Widget productCard({
  required String imageUrl,
  required String productName,
  required String price,
  required BigInt id, //podavah tova na functia ili nesho takova koqto she pokazva
  VoidCallback? onPressed,
}) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(4, 12, 4, 0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black87,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              width:double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 4),
            child: Text( 
              // ignore: unnecessary_string_interpolations
              productName,
              style: TextStyle(
                fontFamily: 'Outfit',
                color: Color(0xFF101213),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(6, 16, 6, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  price,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Color(0xFF101213),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed:(){
                    _model.currentNftId = id as int;
                    // Navigator.push(
                    //   context, 
                    //   MaterialPageRoute(
                    //     builder: (context) => const InfoPageWidget(),
                    //   ),
                    //);
                  },//dava stojnost na var ot modela s id-to na nft-to za da znae koe da pokaje
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    padding:
                        const MaterialStatePropertyAll(EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: const Text(
                    'Buy',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color(0xff4b39ef),
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
