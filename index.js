require {
  addMethod,
  resetMethod,
  getUints,
  getStrings,
  getAddresses,
  getBytes32s,
  getBools
} = './mocha-test-util';

exports.printMsg = () => {
  const stubUtil = {
    addMethod,
    resetMethod,
    getUints,
    getStrings,
    getAddresses,
    getBytes32s,
    getBools
  };

  return stubUtil;
}
