import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import '../components/NFT.dart';
import '../components/nav_bar.dart';
import '../models/home_page_model.dart';


class CreatePageWidget extends StatefulWidget {
  const CreatePageWidget({super.key});

  @override
  State<CreatePageWidget> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePageWidget> {
   HomePageModel _model = HomePageModel();
  late BigInt tokenId, price;
  late String name, description, imageUrl;
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerImageUrl = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();


  _CreatePageState();
  
//logout function
  void _logout() {
    _model.logout();
  }

  Future<void> createNFT(String name, String description, String imageUrl, BigInt price) async {
    try {
      List<dynamic> result = await _model.query('mint', [name, description, imageUrl, price]);
      setState(() { 
          tokenId = result[0] as BigInt;
      });
    } catch (error) {
      print("Error creating NFT: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    tokenId = BigInt.zero;
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          'Create NFT',
           style: TextStyle(
            color: Colors.white,

          ),
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            // Your form fields and UI components for creating NFTs
            Text('Here you can upload your NFTs :)', 
              style: TextStyle(
                fontSize: 22,               
                fontWeight: FontWeight.bold,
              ),
              textWidthBasis: TextWidthBasis.longestLine,
            ),
            Spacer(flex: 1),
            TextFormField(
              controller: controllerName,
              decoration: InputDecoration(
                labelText: 'Name', 
                hintText: 'The name/title of your NFT'
              ),
            ),
            TextFormField(
              controller: controllerDescription,
              decoration: InputDecoration(
                labelText: 'Description', 
                hintText: 'The description of your NFT'
              ),
            ),
            TextFormField(
              controller: controllerImageUrl,
              decoration: InputDecoration(
                labelText: 'Image URL',
                hintText: 'The address of your NFT'
              ),
            ),
            TextFormField(
              controller: controllerPrice,
              decoration: InputDecoration(
                labelText: 'Price',
                hintText: 'The price of your NFT in ETH'
              ),
            ),
            Spacer(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                name = controllerName.text;
                imageUrl = controllerImageUrl.text;
                description = controllerDescription.text;
                price = BigInt.parse(controllerPrice.text);
                createNFT(name, description, imageUrl, price);
                NFT newNft = NFT(
                  tokenId: tokenId, name: name, description: description, 
                  imageUrl: imageUrl, price: price, 
                  owner: EthereumAddress.fromHex(_model.myAddress)
                );
                _model.myNfts.add(newNft);
                _model.allNfts.add(newNft);
              }, 
              child: const Text('Save'),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      
      bottomNavigationBar: NavBar(),

    );
  }


  
}

