const { parseBN } = require('./parseUtil');

const addMethod = async (stub, methodName) => {
  await stub.addMethod(methodName);
}

const resetMethod = async (stub, methodName) => {
  await stub.resetMethod(methodName);
}

const getUints = async (stub, methodName) => {
  let uints = await stub.getUints(methodName);

  return {
    firstUint: parseBN(uints[0]),
    secondUint: parseBN(uints[1]),
    thirdUint: parseBN(uints[2]),
    fourthUint: parseBN(uints[3]),
    fifthUint: parseBN(uints[4])
  }
}

const getStrings = async (stub, methodName) => {
  let strings = await stub.getStrings(methodName);

  return {
    firstString: strings[0],
    secondString: strings[1],
    thirdString: strings[2],
    fourthString: strings[3],
    fifthString: strings[4]
  }
}

const getAddresses = async (stub, methodName) => {
  let uints = await stub.getAddresses(methodName);

  return {
    firstAddress: data[0],
    secondAddress: data[1],
    thirdAddress: data[2],
    fourthAddress: data[3],
    fifthAddress: data[4]
  }
}

const getBytes32s = async (stub, methodName) => {
  let bytes32s = await stub.getBytes32s(methodName);

  return {
    firstBytes32: bytes32s[0],
    secondBytes32: bytes32s[1],
    thirdBytes32: bytes32s[2],
    fourthBytes32: bytes32s[3],
    fifthBytes32: bytes32s[4]
  }
}

const getBools = async (stub, methodName) => {
  let bools = await stub.getBools(methodName);

  return {
    firstBool: bools[0],
    secondBool: bools[1],
    thirdBool: bools[2],
    fourthBool: bools[3],
    fifthBool: bools[4]
  }
}

module.exports = {
  addMethod,
  resetMethod,
  getUints,
  getStrings,
  getAddresses,
  getBytes32s,
  getBools
}
