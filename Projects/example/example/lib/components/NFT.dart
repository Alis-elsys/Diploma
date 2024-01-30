import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class NFT {
  final int tokenId, price;
  final String name, imageUrl;
  // Add other attributes as needed

  NFT({
    required this.tokenId,
    required this.name,
    required this.imageUrl,
    required this.price,
    // Add other attributes as needed
  });

  factory NFT.fromJson(Map<String, dynamic> json) {
    return NFT(
      tokenId: json['tokenId'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as int,
      // Parse other attributes as needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tokenId': tokenId,
      'name': name,
      'imageUrl': imageUrl,
      // Add other attributes as needed
    };
  }
}

//Get the info from the API
Future<List<NFT>> fetchNFTData() async {
  final response = await HttpClient().getUrl(Uri.parse('https://example.com/nfts'));
  if (response.hashCode == 200) {
    List jsonResponse = json.decode(response.bufferOutput.toString());
    return jsonResponse.map((nft) => NFT.fromJson(nft)).toList();
  } else {
    throw Exception('Failed to load NFTs from API');
  }
}



// Simulated data for demonstration purposes
  List<NFT> nfts = [
    NFT(
      tokenId: 1,
      name: 'NFT 1',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
      price: 100
    ),
    NFT(
      tokenId: 2,
      name: 'NFT 2',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
      price: 100
    ),
    NFT(
      tokenId: 3,
      name: 'NFT 3',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
      price: 100
    ),
    NFT(
      tokenId: 4,
      name: 'NFT 4',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
      price: 100
    ),
    NFT(
      tokenId: 5,
      name: 'NFT 5',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8d2GaM9vp206kfNlnBUKdLFUNQMpy4SmWZxYssaNy1MVWtaJp9P4AJ9FngBRMQiWfj2c&usqp=CAU',
      price: 100
    ),
    NFT(
      tokenId: 6,
      name: 'NFT 6',
      imageUrl: 'https://picsum.photos/250?image=14',
      price: 100
    ),
    NFT(
      tokenId: 7,
      name: 'NFT 7',
      imageUrl: 'https://picsum.photos/250?image=15',
      price: 100
    ),
    NFT(
      tokenId: 8,
      name: 'NFT 8',
      imageUrl: 'https://picsum.photos/250?image=16',
      price: 100
    ),
    NFT(
      tokenId: 9,
      name: 'NFT 9',
      imageUrl: 'https://picsum.photos/250?image=17',
      price: 100
    ),
    NFT(
      tokenId: 10,
      name: 'NFT 10',
      imageUrl: 'https://picsum.photos/250?image=18',
      price: 100
    )
  ];