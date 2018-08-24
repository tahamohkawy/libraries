pragma solidity ^0.4.18;

contract DataTypes {

    bool valid = true;

    bytes dynamic = new bytes(30); //We must provide the length
   

    function test() public pure returns (bool) {
        bytes1 one;  //bytes1 here is not an array, it is a single byte
        bytes1 two;
        
        one = "a";
        two = "a";
        
        return one == two;  //returns true
    }    

    function test2() public pure returns (bool) {
        bytes2 one = "ba";
        bytes2 two = "ab";  
        
        return one[0] == two[0];
        //return one == two; //returns true
    }
    
    //Fallback function
    function() public payable {
        revert();
    }

}