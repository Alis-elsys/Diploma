import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/models/home_page_model.dart';
import 'package:expandable/expandable.dart';

class InfoPageWidget extends StatefulWidget {
  InfoPageWidget({super.key});
  late HomePageModel _model;

  @override
  State<InfoPageWidget> createState() => _InfoPageWidgetState();
}

class _InfoPageWidgetState extends State<InfoPageWidget> {
  String NFTname = '';
  String NFTimage = '';
  String NFTcreator = '';
  String NFTdescription = '';
  BigInt NFTprice = BigInt.zero;

  int nftId = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();


  Future<void> buyNft(int tokenId) async {
    try {
      await widget._model.transaction('mint', []);
    } catch (e) {
      print("Error buying NFT: $e");
    }
  }
  
  Future<void> initModel() async{
    widget._model = HomePageModel();
    widget._model.initState(context);
    widget._model.initializeContract();

    await widget._model.getNFTlist();
    print('currentNftId: ${widget._model.currentNftId}');
    nftId = widget._model.currentNftId as int;
    NFTname = widget._model.allNfts[nftId].name;
    NFTprice = widget._model.allNfts[nftId].price;
    NFTcreator = widget._model.allNfts[nftId].owner.toString();
    NFTdescription = widget._model.allNfts[nftId].description;
  }


  @override
  void initState()  {
    super.initState();
    initModel();
   
  }

  @override
  void dispose() {
    widget._model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: Text(
          'NFT full info',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Text(
                                NFTname,
                                style: const TextStyle(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF101213),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Container(
                                width: double.infinity,
                                height: 230,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0E3E7),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 12,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      NFTimage,
                                      width: double.infinity,
                                      height: 230,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                              child: Text(
                                'creator $NFTcreator',
                                style:const TextStyle(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF57636C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: ExpandableNotifier(
                            controller: widget._model.isExpanded,
                            child: ExpandablePanel(
                              header: const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  'description',
                                  style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF101213),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              collapsed: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    'Click for the full description ',
                                    style: TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 12),
                                    child: Text(
                                      NFTdescription,
                                      style: const TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              theme: const ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: true,
                                tapBodyToCollapse: true,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 12,
                        thickness: 1,
                        color: Color(0xFFE0E3E7),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Opacity(
                                opacity: 0.9,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 8, 0, 0),
                                      child: Text(
                                        'Best price',
                                        style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: Text(
                                        '\$ ${NFTprice.toString()}',
                                        style: const TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 26, 16, 24),
                                // child: Text(
                                //   'price \$?',
                                //   style: TextStyle(
                                //         fontFamily: 'Plus Jakarta Sans',
                                //         color: Color(0xFF57636C),
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.w500,
                                //       ),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4B39EF), Color(0x4C4B39EF)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(-1, 0),
                      end: AlignmentDirectional(1, 0),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: TextButton(
                    onPressed: () {
                      buyNft(0);
                    },
                    child: const Text(
                      'Buy',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
