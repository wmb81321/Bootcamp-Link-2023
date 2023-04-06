// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.2/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.8.2/utils/Counters.sol";
import "@chainlink/contracts/src/v0.8/AutomationCompatible.sol";


// Una vez el contrato se despliega tenemos que
// ejecutar la funcion safeMint con tu address

contract DNFT ETHCALI LOGO is ERC721, ERC721URIStorage {
    using Counters for Counters.Counter;
    

    Counters.Counter private _tokenIdCounter;
    enum status{ 
        First, // 0
        Second, // 1
        Third //3

    }

    mapping (uint256 => status) nftStatus;
    
    string [] IpfsUri = [
            


    ];

    constructor() ERC721("ethcalilogo", "etcali") {}


    // *** START AUTOMATION ***






    // END AUTOMATION



    function safeMint(address to, string memory uri) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        nftStatus[tokenId] = status.First;
    }


    function getNFTStatus (uint256 _tokenId) public view returns (Status){
        Status statusIndex = nftStatus[_tokenId];
        return IpfsUri[uint(statusIndex)];
    }
    
    function updateAllNFTs() public{
        uint256 Counter = _tokenIdCounter.current();

        for(uint index = 0; index < counter; index ++){
            updateStatus(index);
        }

}   

    function updateStatus(uint256 _tokenId) public{
        uint256 currentStatus = getNFTStatus(_tokenId);
        if(currentStatus ==0){
            nftStatus[_tokenId] = Status.Second;
        }
        else if(currentStatus == 1){
             nftStatus[_tokenId] = Status.Third;
        }
        else if(currentStatus == 2){
             nftStatus[_tokenId] = Status.First;
        }
    }

    function getUriStatu(uint256 _tokenId) public view returns (string memory){
        StatusIndex = nftStatus[_tokenId];
        return IpfsUri[uint(statusIndex)];
    }
    
    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }



    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
