// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract NFT {
    address private owner;
    uint private _tokenId = 0;
    mapping (uint => string) private _tokenURIs;
    string private name;

/*    struct NFT {
        address owner;
        string name;
        uint _tokenId;
        string _tokenURI;
    }
    NFT[] private NFTs;
*/
    constructor(string memory _name, string memory _tokenURI) {
        owner = msg.sender;
        name = _name;
        _tokenId ++;
        _tokenURIs[_tId] = _tokenURI;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
    
    function setName(string memory x) public {
        name = x;
    }

    function getName() public view returns (string memory){
        return name;
    }
    function createTokenURI(string memory _tokenURI) public
    returns(uint, string memory){
        _tokenURIs[_tokenId] = _tokenURI;
        _tokenId ++;
        return(_tokenId, _tokenURI);
    }

    function getTokenURI(uint _tId) public view returns (string memory){
        string memory _currentURI = _tokenURIs[_tId];
        return _currentURI;
    }

    function getAllTokenURIs() public view returns (string[] memory){
        string[] memory uris = new string[](_tokenId);
        for(uint i = 0; i < _tokenId; i++){
            uris[i] = _tokenURIs[i];
        }
        return  uris;
    }

    function addNFT(string memory _name, string memory _tokenURI, uint memory _tokenId) public {
        NFTs.push(NFT(msg.sender, _name, _tokenId, _tokenURI));
    }

    function delete
}