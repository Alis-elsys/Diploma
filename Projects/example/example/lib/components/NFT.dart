import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import '../models/home_page_model.dart';
import '../home_page.dart';


class NFT {
  final BigInt tokenId;
  final double price;
  final String name, description, imageUrl;
  final EthereumAddress owner;
  late List<NFT> allNfts;
  // Add other attributes as needed

  NFT({
    required this.tokenId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.owner,
    // Add other attributes as needed
  });

  factory NFT.fromJson(Map<String, dynamic> json) {
    return NFT(
      tokenId: json['tokenId'] as BigInt,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as double,
      owner: json['owner'] as EthereumAddress,
      // Parse other attributes as needed
    );
  }

  factory NFT.fromJsonList(List<dynamic> json) {
    return NFT(
      tokenId: json[0] as BigInt,
      name: json[1] as String,
      description: json[2] as String,
      imageUrl: json[3] as String,
      price: (json[4] as num).toDouble(),
      owner: EthereumAddress.fromHex(json[5]),
      // Parse other attributes as needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tokenId': tokenId,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
     // 'owner': owner,
      // Add other attributes as needed
    };
  }

  //mint NFT
 

}

//Get the info from the API
// Future<List<NFT>> fetchNFTData() async {

//   final response = await _HomePageWidgetState.getAllNFTs();
//   final data = jsonDecode(response) as List;  
//   return data.map((json) => NFT.fromJson(json)).toList();
// }



// // Simulated data for demonstration purposes
//   List<NFT> nfts = [
//     NFT(
//       tokenId: 1,
//       name: 'NFT 1',
//       imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
//       price: 100
//     ),
//     NFT(
//       tokenId: 2,
//       name: 'NFT 2',
//       imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
//       price: 100
//     ),
//     NFT(
//       tokenId: 3,
//       name: 'NFT 3',
//       imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
//       price: 100
//     ),
//     NFT(
//       tokenId: 4,
//       name: 'NFT 4',
//       imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
//       price: 100
//     ),
//     NFT(
//       tokenId: 5,
//       name: 'NFT 5',
//       imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
//       price: 100
//     ),
//     NFT(
//       tokenId: 6,
//       name: 'NFT 6',
//       imageUrl: 'https://picsum.photos/250?image=14',
//       price: 100
//     ),
//     NFT(
//       tokenId: 7,
//       name: 'NFT 7',
//       imageUrl: 'https://picsum.photos/250?image=15',
//       price: 100
//     ),
//     NFT(
//       tokenId: 8,
//       name: 'NFT 8',
//       imageUrl: 'https://picsum.photos/250?image=16',
//       price: 100
//     ),
//     NFT(
//       tokenId: 9,
//       name: 'NFT 9',
//       imageUrl: 'https://picsum.photos/250?image=17',
//       price: 100
//     ),
//     NFT(
//       tokenId: 10,
//       name: 'NFT 10',
//       imageUrl: 'https://picsum.photos/250?image=18',
//       price: 100
//     )
//   ];