// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract elvon{
    ERC20 token =ERC20(0xFbE6F37d3db3fc939F665cfe21238c11a5447831);

address public receiver=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
address public elvonadd=0x1e83f8a91d640A896078B1EC56e24c0046E7c770;
address public sender=0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
mapping(address=>uint) public accbalances;
event withdrawacc(uint amt,address);

receive() external payable { }
function withdraw(address newreq,uint256 amt)public returns(uint){

   require(accbalances[sender]>=amt,"unavailable amount ");
    require(msg.sender == newreq, "You aren't the owner");
   accbalances[sender]-=amt;
   uint256 newtidy=accbalances[newreq]+=amt;
   emit withdrawacc(amt,newreq);
   return newtidy;

}

function checkbalance(address ne)external payable returns(uint) {
    uint256 bal=accbalances[ne];
    return bal;

}
 
function receiveether()public payable{

}
function sendeth(uint256 _amt)external returns(bool){
   bool success=token.transfer(elvonadd, _amt);
   require(success,"the transaction failed");
   return success;


}

} 