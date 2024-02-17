import 'dart:ffi';

import 'package:flutter/material.dart';
import '../components/NFT.dart';
import '../components/nav_bar.dart';
import '../models/home_page_model.dart';


class CreatePageWidget extends StatefulWidget {
  const CreatePageWidget({super.key});

  @override
  State<CreatePageWidget> createState() => _CreatePageState(allNfts: []);
}

class _CreatePageState extends State<CreatePageWidget> {
  late HomePageModel _model;
  final List<NFT> allNfts;
  late int tokenId, price;
  late String name, imageUrl;
  bool loading = false;
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerImageUrl = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();


  _CreatePageState({required this.allNfts});
  
//logout function
  void _logout() {
    _model.logout();
  }

  @override
  void initState() {
    super.initState();
    _model = HomePageModel();
    _model.initializeContract();
    _model.initState(context);
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                // Logic for saving the created NFT
                String NFTname = controllerName.text;
                String imageUrl = controllerImageUrl.text;
                String description = controllerDescription.text;
                BigInt price = BigInt.parse(controllerPrice.text);
                _model.mintNFT(NFTname, description, imageUrl, price);
              }, 
              child: null,
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic for saving the created NFT

        },
        child: Icon(Icons.save),
      ),
      bottomNavigationBar: CustomNavBar(),

    );
  }


  
}

