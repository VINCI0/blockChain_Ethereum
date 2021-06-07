pragma solidity ^0.5.0;


contract Greet{
    
    string public greet="Hello World";
    
    uint private balance=200;
    
    // comments
    
        // line comment
        
        /* block level comment
        this is also commnet
        */
        


    // basic data types

    int public count = 0;
    
    int private privateCount=0;    

    int internal internalCount=0; 
        

    bool private check=false;
    
    uint256 private numbersInAssignment=10;
    

    // data scope public,private, internal
    
    
    
    // variable types state, local, global (now)

    function addNum() public returns (int){
        
        
        int a =5;
        
        count+=5;
        // adding to the local variable
        
        a+=5;
        
        // return the state scope 
        return count;
        
    }     
        
    function getTimestamp() public view returns (uint){
        return now;
    }

    
    function getSenderAddress() public view returns (address){
        return msg.sender;
    }
    
    
    //  operators
 
    
    // - Arithmetic Operators (+,-,*,/,%,++,--)
    // - Comparison Operators (==,!=,>,<,>=,<=)
    // - Logical (or Relational) Operators (&&, ||, !)
    // - Assignment Operators (=,+=,-=,*=,/=,%=)
    // - Conditional (or ternary) Operators (condition? true case:false case)
    function operatorDemo(int number) public pure returns (bool){
        
       number*=number;
       
      
      return number%2==0 ? true:false;
        
        
    }
    
    // loops
    
    // for loops
    //  while loops
    //  do while 
    
    // function multiplication (uint number,uint times) public pure returns (uint){
        
    //     uint result=number;
        
    //     for (uint i=0;i<=times;++i){
    //         result=number*i;
    //     }
    
    //     while (result>=number){
            
    //         result/=2;
    //     }        
        
    //     do {
    //         result+=2;
    //     }
    //     while(result<number);

    //     return result;
    // }
    
    
    // Strings & Arrays 
    
    //     bytes memory bstr = new bytes(10);
    // string message = string(bstr); 
    // bytes memory byteFromString= bytes(stringName);
        
    // src: https://www.tutorialspoint.com/solidity/solidity_strings.htm

            function numberToString(uint number) public pure returns ( string memory){
            
            if (number==0){
                return "0";
            }
            // initial length
            uint length=0;
            uint temp=number;
            
            
            // for finding the no. of digits in int
            while (temp !=0){
                length+=1;
                temp/=10;
            }
            
            bytes memory returnArray=new bytes(length);
            
            // last index 
            length=length-1;
            while (number!=0){
                
                returnArray[length] = byte(uint8(48 + number % 10));
                number/=10;
                length--;
                
            }
            
            return string(returnArray);
        }
        
        // Special Varaibles => global varibles 


        // - functions

        // Syntax 
        // function functionName(uint number) scope(public|private|internal) pure|view returns (type){
            
        //     // code here
        // }
        

        // - view functions
        function get_value() public view returns (string memory){
            
            return greet;
        }
        
        // - pure functions

      function multiply (uint number1,uint number2) public pure returns (uint){
        
        return number1*number2;
        
    }


        // - crptographic functions
        
        function SHA2(string memory text) public pure returns (bytes32){
            
            return sha256(bytes(text));
        // 185f8db32271fe25f561a6fc938b2e264306ec304eda518007d1764826381969
            
        }
        
        function SHA3(string memory text) public pure returns (bytes32){
            
            return keccak256(bytes(text));
        
            
        }

        // Error Handling
        
        // assert(bool condition)
        // require(bool condition)
        // require(bool condition, string memory message)
        // revert()
        // revert(string memory reason)
       
        function sendMoney(uint _amount) view public returns (bool) {
            if (_amount>balance)
                revert("Not Enough balance");
            return true;
        }
    
}


 // Library 
            // basic concept
            
                // no state varibles so useful for importing and getting the functions
            
            // import one
        
                // like math
library MyLibrary{
    
     uint constant number=90;
     
     function positiveNumber(int _num ) public pure returns (uint){
         while (_num<=0){
             _num+=int(number);
         }
         return uint(_num);
     
         
     }
}
        
