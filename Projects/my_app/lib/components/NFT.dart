import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import '../models/home_page_model.dart';
import '../pages/home_page.dart';


final HomePageModel _model = HomePageModel();

class NFT {
  final BigInt tokenId, price;
  final String name, description, imageUrl;
  final EthereumAddress owner;
  late List<NFT> allNfts;

  NFT({
    required this.tokenId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.owner,
  });

  factory NFT.fromJson(Map<String, dynamic> json) {
    return NFT(
      tokenId: BigInt.from(json['tokenId']),
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: BigInt.from(json['price']),
      owner: json['owner'] as EthereumAddress,
    );
  }

  factory NFT.fromJsonList(List<dynamic> json) {
    print(json);
    return NFT(
      tokenId: json[0] as BigInt,
      name: json[1] as String,
      description: json[2] as String,
      imageUrl: json[3] as String,
      price: json[4] as BigInt,
      owner: json[5] as EthereumAddress,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tokenId': tokenId,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'owner': owner,
    };
  }

}
