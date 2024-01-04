import 'package:walletconnect_flutter_dapp/models/home_page_model.dart';
import 'package:walletconnect_flutter_v2/apis/core/relay_client/json_rpc_2/src/client.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import '../components/nav_bar.dart';
import '../components/NFT_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'main.dart'; 
import 'start_page.dart';
import 'home_page.dart';
export 'home_page.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String name = '';
 // String _url = "HTTP://127.0.0.1:7545";
//String _wsUrl = "ws://127.0.0.1:7545/";

  @override
  void initState() {
    super.initState();
    _model = HomePageModel();
    _model.initState(context);
  }


  
  void nameF(){
    String name = 'name';
    List<ContractFunction> functions = [];
    List<ContractEvent> events = [];
    ContractAbi contract =  ContractAbi(name, functions, events);
    }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFff1F4F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        elevation: 10.0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
              child: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  color: Color(0xFF101213),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Add any additional widgets or actions here
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        alignLabelWithHint: false,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffe0e3e7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff4b39ef),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffff5963),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffff5963),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      // validator:
                      //     _model.textControllerValidator(context, _model.textController?.text),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                  icon: const Icon(
                    Icons.search_sharp,
                    color: Color.fromARGB(255, 35, 61, 105),
                    size: 24,
                  ),
                  style: ButtonStyle(
                    side: const MaterialStatePropertyAll(
                        BorderSide(color: Colors.black87, width: 1)),
                    fixedSize:
                        const MaterialStatePropertyAll(Size.fromWidth(40)),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.indigo.shade200),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: Colors.black87, width: 1))),
                    elevation: const MaterialStatePropertyAll(0),
                  ),
                ),
              ],
            ),
           // Expanded(
             // child: SingleChildScrollView(
               // padding: EdgeInsets.zero,
                //shrinkWrap: true,
               // scrollDirection: Axis.vertical,
               // child: Row(
                 // mainAxisSize: MainAxisSize.max,
                 // children: [
                    productCard(
                      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
                      productName: 'first',
                      price: "\$126.20"
                    ),
            //      ],
              //  ),
              //),
            //),
          
            //NavBarWidget(),
          ],
        ),
      ),
    );
  }
}
