import Web3 from "web3";
import { Transaction as Tx } from "ethereumjs-tx";
import common from "./web3_gettingstart";

const INFURA = "INFURA_ENDPOINT"; // insert your INFURA_ENDPOINT here
const GANACHE_GUI = "http://localhost:7545";
const GANACHE_CLI = "http://localhost:8545";

const web3 = new Web3(new Web3.providers.HttpProvider(GANACHE_GUI));
const CONTRACT_ABI = require("./abi.json");
const CONTRACT_ADDRESS = "CONTRACT_ADDRESS"; // insert your CONTRACT_ADDRESS here
const MyContract = new web3.eth.Contract(CONTRACT_ABI, CONTRACT_ADDRESS);

const getValue = () => {
  const result = MyContract.methods.retrieve().call();
  return result;
};

const setValue = (value) => {
  const result = MyContract.methods.store(value);
  return result;
};

const sendTransaction = async (transaction, publickey, privatekey) => {
  const PRIVATEKEY = Buffer.from(privatekey, "hex");
  const NONCE = await common.txCount(publickey);
  const DATA = transaction.encodeABI();
  const GAS = await transaction.estimateGas();
  const GASPRICE = await common.getGasPrice();
  const rawTransaction = {
    nonce: NONCE,
    to: CONTRACT_ADDRESS,
    data: DATA,
    gas: GAS,
    gasPrice: GASPRICE,
  };
  const tx = new Tx(rawTransaction);
  tx.sign(PRIVATEKEY);
  const serializedTx = tx.serialize();
  const receipt = web3.eth.sendSignedTransaction(
    "0x" + serializedTx.toString("hex")
  );
  return receipt;
};

const testSmartcontract = async () => {
  const account = {
    address: "publickey", // insert your publickey
    privateKey: "privatekey", // insert your privateKey
  };
  console.log("========== SMART CONTRACT ==========");
  console.log("value before set :", await getValue());
  const transaction = await setValue(11);
  await sendTransaction(transaction, account.address, account.privateKey);
  console.log("value after set :", await getValue());
  console.log("====================================");
};

testSmartcontract();
