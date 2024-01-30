import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:walletconnect_flutter_dapp/start_page.dart';
import 'package:walletconnect_flutter_dapp/utils/string_constants.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:http/src/client.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late Client httpClient;
  late Web3Client ethClient;
  TextEditingController controllerAmount = TextEditingController();
  TextEditingController controllerTitle = TextEditingController();
  // Ethereum address
  final String myAddress = "0x5e5386C139c5A9F9d99a743Ff10647b140AB543c";
  // my "0x5e5386C139c5A9F9d99a743Ff10647b140AB543c";
  // URL from Infura
  final String blockchainUrl = "HTTP://127.0.0.1:7545";

   //"https://rinkeby.infura.io/v3/4e577288c5b24f17a04beab17cf9c959";
    
  String contractName = "Fluthereum";
  String privateKey = "5e0b7dd43a57934770bb8e7d563d26cc94f4c9cb4ec04c72e20cf1bee4cd66c3";
  //  my  "5e0b7dd43a57934770bb8e7d563d26cc94f4c9cb4ec04c72e20cf1bee4cd66c3";
  
  int balance = 0;
  String title = "";
  bool loading = false;
  //int amount = 0;

  
  Future<String> transaction(String functionName, List<dynamic> args) async {
    EthPrivateKey credential = EthPrivateKey.fromHex(privateKey);
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    dynamic result = await ethClient.sendTransaction(
      credential,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: args,
      ),
      fetchChainIdFromNetworkId: true,
      chainId: null,
    );

    return result;
  }

  Future<DeployedContract> getContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x8daA5912cea8B79818C9176b7Ee0773a9820f2Ff";

    final contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await getContract();
    final function = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: function, params: args);
    return result;
  }


  Future<void> getBalance(String targetAddress) async {
    //EthereumAddress address1 = EthereumAddress.fromHex(targetAddress);
    List<dynamic> result = await query("getBalance", []);
    balance = result[0];
    setState(() {});
    loading = true; 
  
  // try {
  //   loading = true;
  //   setState(() {});
  //   List<dynamic> result = await query("getBalance", []);
  //   balance = int.parse(result[0].toString());
  // } catch (error) {
  //   print('Error in getBalance: $error');
  // } finally {
  //   loading = false;
  //   setState(() {});
  // }
  }

  Future<void> getTitle(String targetAddress) async {
    List<dynamic> result = await query("getTitle", []);
    title = result[0];
    setState(() {});
  }

  Future<void> refreshData(String targetAddress) async {
      getBalance(targetAddress);
      getTitle(targetAddress);
  }

  Future<void> deposit(int amount) async {
    BigInt parsedAmount = BigInt.from(amount);
    var result = await transaction("deposit", [parsedAmount]);
    print("deposited");
    print(result);
  }

  Future<void> withdraw(int amount) async {
    BigInt parsedAmount = BigInt.from(amount);
    var result = await transaction("withdraw", [parsedAmount]);
    print("withdraw done");
    print(result);
  }

  @override
  void initState() {
    super.initState();
    httpClient = Client();
    ethClient = Web3Client(blockchainUrl, httpClient);
    getBalance(myAddress);
    getTitle(myAddress);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "$title",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            loading
                ? CircularProgressIndicator()
                : Text(
                    "\$$balance",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: controllerAmount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Amount')
                ),
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: controllerTitle,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Title')
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    onPressed: () => refreshData(myAddress),
                    icon: Icon(Icons.refresh),
                    color: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: IconButton(
                    onPressed: () => deposit(int.parse(controllerAmount.text)),
                    icon: Icon(Icons.upload),
                    color: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: IconButton(
                    onPressed: () => withdraw(int.parse(controllerAmount.text)),
                    icon: Icon(Icons.download),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}