pragma solidity ^0.4.24;

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
    uint256 fifthUint;
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
    Uints memory newUints;
    Strings memory newStrings;
    Addresses memory newAddresses;
    Bytes32s memory newBytes32s;
    Booleans memory newBooleans;

    CallData storage methodCallData = method[methodName];

    methodCallData.uints = newUints;
    methodCallData.strings = newStrings;
    methodCallData.addresses = newAddresses;
    methodCallData.bytes32s = newBytes32s;
    methodCallData.booleans = newBooleans;
  }

  function getUints (string methodName) public view returns (
    uint256,
    uint256,
    uint256,
    uint256,
    uint256
    ) {
    CallData memory methodCallData = method[methodName];

    return (
      methodCallData.uints.firstUint,
      methodCallData.uints.secondUint,
      methodCallData.uints.thirdUint,
      methodCallData.uints.fourthUint,
      methodCallData.uints.fifthUint
      );
  }

  function getStrings (string methodName) public view returns (
    string,
    string,
    string,
    string,
    string
    ) {
    CallData memory methodCallData = method[methodName];

    return (
      methodCallData.strings.firstString,
      methodCallData.strings.secondString,
      methodCallData.strings.thirdString,
      methodCallData.strings.fourthString,
      methodCallData.strings.fifthString
      );
  }

  function getAddresses (string methodName) public view returns (
    address,
    address,
    address,
    address,
    address
    ) {
    CallData memory methodCallData = method[methodName];

    return (
      methodCallData.addresses.firstAddress,
      methodCallData.addresses.secondAddress,
      methodCallData.addresses.thirdAddress,
      methodCallData.addresses.fourthAddress,
      methodCallData.addresses.fifthAddress
      );
  }

  function getBytes32s (string methodName) public view returns (
    bytes32,
    bytes32,
    bytes32,
    bytes32,
    bytes32
    ) {
    CallData memory methodCallData = method[methodName];

    return (
      methodCallData.bytes32s.firstBytes32,
      methodCallData.bytes32s.secondBytes32,
      methodCallData.bytes32s.thirdBytes32,
      methodCallData.bytes32s.fourthBytes32,
      methodCallData.bytes32s.fifthBytes32
      );
  }

  function getBools (string methodName) public view returns (
    bool,
    bool,
    bool,
    bool,
    bool
    ) {
    CallData memory methodCallData = method[methodName];

    return (
      methodCallData.booleans.firstBool,
      methodCallData.booleans.secondBool,
      methodCallData.booleans.thirdBool,
      methodCallData.booleans.fourthBool,
      methodCallData.booleans.fifthBool
      );
  }
}
