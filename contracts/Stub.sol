pragma solidity ^0.5.0;

contract Stub {
  struct CallData {
    Uints uints;
    Strings strings;
    Addresses addresses;
    Bytes32s bytes32s;
    Booleans booleans;
  }

  struct Uints {
    uint256 firstUint;
    uint256 secondUint;
    uint256 thirdUint;
    uint256 fourthUint;
    uint256 fifthhUint;
  }

  struct Strings {
    string firstString;
    string secondString;
    string thirdString;
    string fourthString;
    string fifthString;
  }

  struct Addresses {
    address firstAddress;
    address secondAddress;
    address thirdAddress;
    address fourthAddress;
    address fifthAddress;
  }

  struct Bytes32s {
    bytes32 firstBytes32;
    bytes32 secondBytes32;
    bytes32 thirdBytes32;
    bytes32 fourthBytes32;
    bytes32 fifthBytes32;
  }

  struct Booleans {
    bool firstBool;
    bool secondBool;
    bool thirdBool;
    bool fourthBool;
    bool fifthBool;
  }

  mapping(string => CallData) internal method;

  function addMethod (string methodName) public {
    CallData memory newCallData;
    method[methodName] = newCallData;
  }

  function resetMethod (string methodName) public {
    CallData storage data = method[methodName];

    
  }

  function callHistory (string methodName) public view returns (
    uint256,
    uint256,
    uint256,
    string,
    string,
    string,
    address,
    address,
    address,
    bool,
    uint256,
    bool
    ) {
    CallData memory data = method[methodName];
    return (
      data.firstUint,
      data.secondUint,
      data.thirdUint,
      data.firstString,
      data.secondString,
      data.thirdString,
      data.firstAddress,
      data.secondAddress,
      data.thirdAddress,
      data.called,
      data.callCount,
      data.correctCallOrder
    );
  }
}
