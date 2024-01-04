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
  bool _isDarkMode = false;
  Web3ModalThemeData? _themeData;

  late Client httpClient;
  late Web3Client ethClient;
  TextEditingController controller = TextEditingController();
  // Ethereum address
  final String myAddress = "0x279B9a39E68192db96B59Ca4a2b4C07777c2d535";
  // my "0x5e5386C139c5A9F9d99a743Ff10647b140AB543c";
  // URL from Infura
  final String blockchainUrl = "HTTP://127.0.0.1:7545";

   //"https://rinkeby.infura.io/v3/4e577288c5b24f17a04beab17cf9c959";
    
  String contractName = "Quickstart";
  String privateKey = "0x9d9f5bfea7e3fa14cc3fb66e93fc9241517d568825544a3ae8a0166c22b4530b";
  //  my  "5e0b7dd43a57934770bb8e7d563d26cc94f4c9cb4ec04c72e20cf1bee4cd66c3";
  
  int balance = 0;
  bool loading = false;

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    List<dynamic> result = await ethClient.call(
        contract: contract, function: function, params: args);
    return result;
  }
  
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
    String contractAddress = "0xd55B64d9b7816f2e2D9be07CbC52303A77B7163b";

    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

Future<void> getBalance() async {
  try {
    loading = true;
    setState(() {});
    List<dynamic> result = await query('balance', []);
    balance = int.parse(result[0].toString());
  } catch (error) {
    print('Error in getBalance: $error');
  } finally {
    loading = false;
    setState(() {});
  }
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
    getBalance();
    // WidgetsBinding.instance.addObserver(this);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     final platformDispatcher = View.of(context).platformDispatcher;
    //     final platformBrightness = platformDispatcher.platformBrightness;
    //     _isDarkMode = platformBrightness == Brightness.dark;
    //   });
    // });

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        final platformDispatcher = View.of(context).platformDispatcher;
        final platformBrightness = platformDispatcher.platformBrightness;
        _isDarkMode = platformBrightness == Brightness.dark;
      });
    }
    super.didChangePlatformBrightness();
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
              height: 30,
            ),
            Text(
              "Balance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            loading
                ? CircularProgressIndicator()
                : Text(
                    balance.toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text('amount')),
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
                    onPressed: getBalance,
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
                    onPressed: () => deposit(int.parse(controller.text)),
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
                    onPressed: () => withdraw(int.parse(controller.text)),
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



  // @override
  // Widget build(BuildContext context) {
  //   return Web3ModalTheme(
  //     isDarkMode: _isDarkMode,
  //     themeData: _themeData,
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       title: StringConstants.w3mPageTitleV3,
  //       home: StartPage(
  //         swapTheme: () => _swapTheme(),
  //         changeTheme: () => _changeTheme(),
  //       ),
  //     ),
  //   );
  // }

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
