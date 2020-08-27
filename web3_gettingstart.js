import Web3 from "web3";
import { Transaction as Tx } from "ethereumjs-tx";

const INFURA = "INFURA_ENDPOINT"; // insert your INFURA_ENDPOINT here
const GANACHE_GUI = "http://localhost:7545";
const GANACHE_CLI = "http://localhost:8545";

const web3 = new Web3(new Web3.providers.HttpProvider(GANACHE_GUI));

const create = () => {
  const result = web3.eth.accounts.create();
  return result;
};

const txValue = (value) => {
  const result = web3.utils.toWei(value, "ether");
  return web3.utils.numberToHex(result);
};

const getBalance = async (address) => {
  const result = await web3.eth.getBalance(address);
  return web3.utils.fromWei(result, "ether");
};

const gasEstimate = async (from, to) => {
  const result = await web3.eth.estimateGas({
    from: from,
    to: to,
  });
  return web3.utils.numberToHex(result);
};

const getGasPrice = async () => {
  const result = await web3.eth.getGasPrice();
  return web3.utils.numberToHex(result);
};

const getBlock = async (number) => {
  const result = await web3.eth.getBlock(number);
  return result;
};

const txCount = async (address) => {
  const result = await web3.eth.getTransactionCount(address);
  return result;
};

const transfer = async (from, to, privatekey, value) => {
  const VALUE = txValue(value);
  const PRIVATEKEY = Buffer.from(privatekey, "hex");
  const NONCE = await txCount(from);
  const GAS = await gasEstimate(from, to);
  const GASPRICE = await gasPrice();
  const rawTransaction = {
    nonce: NONCE,
    gas: GAS,
    gasPrice: GASPRICE,
    from: from,
    to: to,
    value: VALUE,
  };
  const tx = new Tx(rawTransaction);
  tx.sign(PRIVATEKEY);
  const serializedTx = tx.serialize();
  const reciept = web3.eth.sendSignedTransaction(
    "0x" + serializedTx.toString("hex")
  );
  return reciept;
};

const testTransfer = async () => {
  const account = {
    address: "publickey", // insert your publickey
    privateKey: "privatekey", // insert your privateKey
  };
  const reciepent = new create();
  console.log("balance :", await getBalance(account.address));
  await transfer(account.address, reciepent.address, account.privateKey, "1");
  console.log("balance :", await getBalance(account.address));
  console.log("balance :", await getBalance(reciepent.address));
};

testTransfer();

export default { create, txCount, txValue, getBalance, getBlock, gasPrice };
