import 'dart:async';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'dart:convert'; 
import '../components/NFT.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../models/home_page_model.dart';
//import 'package:walletconnect_flutter_v2/apis/core/relay_client/json_rpc_2/src/client.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:http/src/client.dart';
import 'package:flutter/services.dart';

import '../components/nav_bar.dart';
import '../components/NFT_card.dart';
import 'package:flutter/scheduler.dart';
import '../main.dart';
import 'start_page.dart';
import 'home_page.dart';
export 'home_page.dart';

class HomePageWidget extends StatefulWidget {
  //final List<NFT> nfts;

  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String name = '';
 
  late Client httpClient;
  late Web3Client ethClient;
  late EthereumAddress address;
  List<dynamic> data = [];
  TextEditingController controllerAmount = TextEditingController();
  TextEditingController controllerTitle = TextEditingController();
  // Ethereum address
  // final String myAddress = "0x5e5386C139c5A9F9d99a743Ff10647b140AB543c";
  // // my "0x5e5386C139c5A9F9d99a743Ff10647b140AB543c";
  // // URL from Infura
  // final String blockchainUrl =
  //     "https://sepolia.infura.io/v3/7f0484b1a988417e9be1706dd241a9fd";

  //"https://rinkeby.infura.io/v3/4e577288c5b24f17a04beab17cf9c959";

  // String contractName = "Fluthereum";
  // String privateKey =
  //     "5e0b7dd43a57934770bb8e7d563d26cc94f4c9cb4ec04c72e20cf1bee4cd66c3";
  //  my  "5e0b7dd43a57934770bb8e7d563d26cc94f4c9cb4ec04c72e20cf1bee4cd66c3";

  int balance = 0;
  String title = "";
  int tester = 0;
  int length = 0;
  NFT nft = NFT(
    tokenId: BigInt.zero,
    name: '',
    description: '',
    imageUrl: '',
    price: BigInt.zero,
    owner: EthereumAddress.fromHex('0x0000000000000000000000000000000000000000')
  );
  /*maka a list of NFTs he struct is that struct NFT{
        uint256 id;
        string name;
        address payable NFTowner;
        string imageUrl; 
        uint256 price;
    }
*/

//make a struct or class for NFTs

List<NFT> allNFTs = [];
  bool loading = false;
  //int amount = 0;

  

  Future<DeployedContract> getContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x0C5186Ba7eCda919Db737946C4cfF9A5d5EF1786";

    final contract = DeployedContract(ContractAbi.fromJson(abi, _model.contractName),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await _model.getContract();
    final function = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: function, params: args);
    return result;
  }
  Future<void> getNFTlist() async {
    List<dynamic> result = await _model.query("getAllNFTs", []);

    print(result);
    _model.allNfts = result[0].map((e) => NFT.fromJsonList(e as List<dynamic>)).toList();
    setState(() {});
    loading = true;
  }

  Future<void> getMyNFTlist() async {
   _model.allNfts = _model.getAllNFTs() as List<NFT>;
    setState(() {});
    loading = true;
  }

  Future<void> getNFT(BigInt id) async {
    List<dynamic> result = await _model.query("getNFT", [id]);
    nft = NFT.fromJsonList(result);
    print('$nft');
    setState(() {});
    loading = true;
  }

  Future<void> getCounter() async {
    //give argument to getCounter the arg is string but it need to be address so it is converted to address
      List<dynamic> args = [_model.myAddress];
    List<dynamic> result = await _model.query("getCounter", []);
    length = int.parse(result[0].toString());
    setState(() {});
    loading = true;
  }

  Future<void> getTester() async {
    try{
      List<dynamic> result = await _model.query("getFullLenght", []);
      tester = int.parse(result[0].toString());
      setState(() {});
      loading = true;
    } catch (e) {
      print('Error in getCount: $e');
    } finally {
      loading = false;
    }
  }

  Future<void> refreshData(String targetAddress) async {
    await getNFTlist();
    //await getNFT(BigInt.zero);
    await getCounter();
    await getTester();
  }


  @override
  void initState() {
    super.initState();
    _model = HomePageModel();
    _model.initState(context);
    _model.initializeContract();
    ethClient = _model.getEthClient();
    //_model.initializeMyaddress();
    //fetch data from nft.dart and put it in allNFTs
    getTester();   
    getNFTlist();
    //allNFTs = getMyNFTlist() as List<NFT>;
    getNFT(BigInt.zero);
    //fetchData();
    getCounter();  
  }

  // Future <void> getAllNFTs() async {
  //   List<dynamic> result = await ethClient.call(
  //       contract: ethClient,
  //       function: ethClient.function("getAllNFTs"),
  //       params: []);
  // }

  Future<void> fetchData() async {
    final response = await get(Uri.parse(_model.blockchainUrl)); // Replace the URL with your API endpoint

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      setState(() {
        data = jsonDecode(response.body); // Decode the JSON response
      });
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load data');
    }
  }

  void nameF() {
    String name = 'name';
    List<ContractFunction> functions = [];
    List<ContractEvent> events = [];
    ContractAbi contract = ContractAbi(name, functions, events);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      //key: scaffoldKey,
      backgroundColor: Color(0xFff1F4F8),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //if there is a previous page go to it
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            //Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
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
            Text('address: ${_model.myAddress.toString()}'),
            Text(
              "tester $tester",
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: Color(0xFF101213),
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "length  $length",
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: Color(0xFF101213),
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            //     child: ListView(
            //       children: [
            //         GridView.builder(
            //           shrinkWrap: true,
            //           physics: NeverScrollableScrollPhysics(),
            //           itemCount: allNFTs.length,
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //           ),
            //           itemBuilder: (context, index) => productCard(
            //             imageUrl: allNFTs[index].imageUrl,
            //             productName: allNFTs[index].name,
            //             price: "\$${allNFTs[index].price.toString()}",
            //           ),
            //         ),
            //       ]
            //     ),
            //   ),
            // ),
            // Text(
            //   'token ids${nft.tokenId}',
            //   style: TextStyle(
            //     fontFamily: 'Plus Jakarta Sans',
            //     color: Color(0xFF101213),
            //     fontSize: 24,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            // productCard(
            //   imageUrl: nft.imageUrl,
            //   productName: nft.name,
            //   price: "\$${nft.price.toString()}",
            // ),
            Text('_model.allNfts.length ${_model.allNfts.length}'),
            Text('data.length ${data.length}'),
            Text(' only 1 nft'),
            productCard(
              context: context,
              id: nft.tokenId,
              imageUrl: nft.imageUrl,
              productName: nft.name,
              price: "\$${nft.price.toString()}",
            ),
            Text('list:'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: ListView.builder(
                // GridView.builder(
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2, // Adjust the cross axis count as needed
                //     crossAxisSpacing: 4, // Adjust the spacing between grid items
                //     mainAxisSpacing: 4, // Adjust the spacing between rows
                //   ),
                 // itemCount: _model.allNfts.length,
                  itemCount: _model.allNfts.length,
                  itemBuilder: (context, index) => productCard(
                    // imageUrl: _model.allNfts[index].imageUrl,
                    // productName: _model.allNfts[index].name,
                    // price: "\$$_model.allNfts[index].price.toString()",
                    // id: _model.allNfts[index].tokenId,
                    context: context,
                    imageUrl: _model.allNfts[index].imageUrl,
                    productName: _model.allNfts[index].name,
                    price: "\$${_model.allNfts[index].price.toString()}",
                    id: _model.allNfts[index].tokenId,
                  ),
                )
              )
            ),
         
          
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar()
    );
  }
}
