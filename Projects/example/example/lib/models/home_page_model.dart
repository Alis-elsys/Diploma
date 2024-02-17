import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import '../components/NFT.dart';
import 'package:http/http.dart' as http;
import '../components/nav_bar.dart';
import '../pages/home_page.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';


class HomePageModel extends HomePageWidget {
  bool fullList = true;
 // String _url = "HTTP://127.0.0.1:7545";
//String _wsUrl = "ws://127.0.0.1:7545/";

  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  ExpandableController? isExpanded;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for NavBar1 component.
  late CustomNavBar navBarModel;
  List<NFT> allNfts = [];
  late http.Client _httpClient;
    late Web3Client _ethClient;
    late DeployedContract _contract;
    late EthereumAddress address;
    final String blockchainUrl =
      "https://sepolia.infura.io/v3/7f0484b1a988417e9be1706dd241a9fd"; //Endpoint for the blockchain
    final String apiKey = "FdTLCM20fELyB/28wtHUxbnRuicnICMQl1tC2ejUQzWUuYh2vGabFQ";
    String contractName = "Fluthereum";
    late String contractAddress;
    String privateKey =
    "5e0b7dd43a57934770bb8e7d563d26cc94f4c9cb4ec04c72e20cf1bee4cd66c3";
    String myAddress = "0x0000000000000000000000000000000000000000";  //"0x5e5386C139c5A9F9d99a743Ff10647b140AB543c";
    late int currentNftId;
    late List<dynamic> data;

    HomePageModel();




  void initState(BuildContext context) {
    // Initialize state of NavBar1 component.
    // 1. Create FocusNode and TextEditingController for TextField.
    textFieldFocusNode = FocusNode();
    textController = TextEditingController();
    isExpanded = ExpandableController(initialExpanded: false);
    textControllerValidator = (context, value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    };

    //Create navBarModel 
    navBarModel = CustomNavBar();
  }

  Future<void> initializeMyaddress(W3MService _w3mService) async {
    String? address = _w3mService.address;
    if (address != null) {
     myAddress = address;
    }
  }

  Future<void> initializeContract() async {
    _httpClient = http.Client();
    _ethClient = Web3Client(blockchainUrl, _httpClient);
    _contract = await getContract();
  }

  Future<void> makeAuthorizedRequest() async {
    final Map<String, String> headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    final http.Response response = await http.get(Uri.parse(blockchainUrl), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('Response data: $responseData');
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }
  }


  //getters
  http.Client getHttpClient () => _httpClient;
  Web3Client getEthClient() => _ethClient;

  Future<DeployedContract> getContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x534B9ac61fA2Fc7b290A687933F9F649cAD7001D";

    final contract = DeployedContract(ContractAbi.fromJson(abi, contractName),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<String> transaction(String functionName, List<dynamic> args) async {
    EthPrivateKey credential = EthPrivateKey.fromHex(privateKey);
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    dynamic result = await _ethClient.sendTransaction(
      credential,
      Transaction.callContract(
        contract: contract,
        function: contract.function('constructor'),
        parameters: args,
      ),
      fetchChainIdFromNetworkId: true,
      chainId: null,
    );

    return result;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await getContract();
    final function = contract.function(functionName);
    final result = await _ethClient.call(
        contract: contract, function: function, params: args);
    return result;
  }

  

   Future<void> mintNFT(String name, String description, String imageUrl, BigInt price) async {
    List<dynamic> result = await query("mintNFT()", [name, description, imageUrl, price]);
    BigInt tokenId  = result[0];

    //add NFT to the list
    allNfts.add(NFT(
      tokenId: tokenId,
      name: name,
      description: description,
      imageUrl: imageUrl,
      price: price,
      owner: EthereumAddress.fromHex(myAddress)
    ));
  }

  Future<List<NFT>> getAllNFTs() async {
    final contract = await getContract();
    final function = contract.function('getAllNFTs');
    final result = await _ethClient.call(
        contract: contract, function: function, params: []);
         
    List<NFT> nfts = [];
    for (int i = 0; i < result.length; i++) {
      List<dynamic> nft = result[i];
      nfts.add(NFT(
        tokenId: nft[0],
        name: nft[1],
        description: nft[2],
        imageUrl: nft[3],
        price: nft[4],
        owner: nft[5]
      ));
    }
    return nfts;
  }

  
  //logout function
  void logout() {
    //logout of the wallet account and go back to start hage
  

  }

  


  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
    //navBarModel.dispose();
  }


  /// Action blocks are added here.

  /// Additional helper methods are added here.
  
}
