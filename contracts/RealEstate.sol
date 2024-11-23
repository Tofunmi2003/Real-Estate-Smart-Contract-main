// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {SafeMath} from "./math/SafeMath.sol";

contract RealEstate {
 // I made use of the USING key word here because i'm making use of SafeMath package library
     using SafeMath for uint256;
    
// list out the PROPERTIES of our smart contract 
     struct Property{
        uint256 price;
        address owner;
        bool forSale;
        string name;
        string description;
        string location;
     }
//Here we have to do the mapping to keep track of every single property we will be using

   mapping (uint256=> Property) public properties;
//Here i created an Array for the Properties IDs so that they can be easily to track by the mapping
   
   uint256[] public propertyIds;

   event PropertySold(uint256 propertyId);

//So to continue i first list the properties for sale
//Here is the Function that allowed the User to List the property for sale  
   function listPropertiesForSale(uint256 _propertyId, uint256 _price, string memory _name, string memory _description, string memory
    _location)public{
//Here i updated the Structs
      Property memory newProperty = Property({
          price: _price,
          owner: msg.sender,
          forSale: true,
          name: _name,
          description: _description,
          location: _location

   });
       
       properties[_propertyId]= newProperty;
       propertyIds.push(_propertyId);
}

   //Here we will create the function to buy properties

   function buyProperty(uint256 _propertyId) public payable {

      Property storage property = properties[_propertyId];

      // first we have to do some checks if the property is up for sale or the proprty is not and to do those checks we make 
      //use of the require keyword

      require(property.forSale, "property is not for sale");
      require(property.price<=msg.value, "Insufficient balance");

      property.owner = msg.sender;
      property.forSale = false;

      payable(property.owner).transfer(property.price);
      
      emit PropertySold(_propertyId);
   
   }






}