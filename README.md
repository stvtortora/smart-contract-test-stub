# smart-contract-test-stub

A simply package for testing interactions between smart contracts in javascript. Ideal for use with the mocha test framework in truffle.

#Install
```bash
npm install smart-contract-test-stub
```

#Features
- `Stub.sol`, a base contract for stubbing methods in external solidity contracts
- `stubUtil`, a simple javascript library for interacting with `Stub.sol` within your javascript tests
- `parseUtil`, which includes methods for converting big numbers to javascript integers

#Usage

##Mocha Integration
If you are using truffle, the mocha test framework is accessible via the test folder in the root of your directory. Import the contract you are testing, the stub of the contract it is interacting with (more on stubs later), and the `stubUtil` module.

```javascript
const TestedContract = artifacts.require("TestedContract");
const CalledContractStub = artifacts.require("CalledContractStub");
const stubUtil = require('smart-contract-test-stub/stubUtil');
```

Next, use the stubUtil module to test that your method was called with the correct parameters:

```javascript
let testedContract;
let calledContract;

contract("TestedContract", async (_accounts) => {
  before(async () => {
    console.log(stubUtil)
    calledContract = await CalledContractStub.new();
    testedContract = await TestedContract.new(calledContract.address);
  })

  describe("testedMethod", async () => {
    before(async () => {
      await stubUtil.addMethod(calledContract, 'calledMethod');
      await testedContract.testedMethod(_accounts[1], 10, 'random')
    })

    after(async () => {
      await stubUtil.resetMethod(calledContract, 'calledMethod');
    })

    it('should call the called contract with the correct parameters', async () => {
      const { firstAddress } = await stubUtil.getAddresses(calledContract, 'calledMethod');
      const { firstUint } = await stubUtil.getUints(calledContract, 'calledMethod');
      const { firstString } = await stubUtil.getStrings(calledContract, 'calledMethod');

      assert.equal(firstAddress, _accounts[1], 'incorrect account');
      assert.equal(firstUint, 10, 'incorrect uint');
      assert.equal(firstString, 'random', 'incorrect string');
    })
  })
})
```

For each getter function, up to five values can be retrieved. For example, the fifth address passed to a function can be retrieved like so:

```solidity
  const { fifthAddress } = await stubUtil.getAddresses(calledContract, 'calledMethod');
```

There are also methods `getBytes32s` and `getBools`, which work in the same way.

##Solidity Integration
To create your own stub contracts, inherit from both the contract you want to stub methods for and the `Stub.sol`:

```solidity
pragma solidity >=0.4.22 <0.6.0;
import 'smart-contract-test-stub/contracts/Stub.sol';
import './CalledContract.sol';

contract CalledContractStub is CalledContract, Stub {
}
```

Then, overwrite the method you wish to stub, and use a struct in `Stub.sol` called CallData to record its arguments.

```solidity
contract CalledContractStub is CalledContract, Stub {
  function calledMethod (address someAddress, uint256 someUint, string memory someString) public {
    CallData storage methodCallData = method['calledMethod'];
    methodCallData.addresses.firstAddress = someAddress;
    methodCallData.uints.firstUint = someUint;
    methodCallData.strings.firstString = someString;
  }
}
```
Using CallData, you can store up to five variables for each type. For example, to store the fourth address passed to a function simply write:

```solidity
  methodCallData.addresses.firstAddress = anotherAddress;
```

CallData is also capable of storing types bytes32 and bool. It looks like this:
```solidity
  methodCallData.uints.bytes32 = '';
  methodCallData.uints.bool = true;
``
