# Ethernaut Challenge Solutions 🚀🔍  

This repository contains my solutions to the **[OpenZeppelin Ethernaut](https://ethernaut.openzeppelin.com/)** challenges. It is a **work in progress** as I continue learning and improving my **smart contract auditing** skills.   

## 🔹 About Ethernaut  
Ethernaut is a Web3 security game where players exploit vulnerabilities in Solidity smart contracts. Each level presents a unique challenge that helps build an understanding of **smart contract security and auditing**.  

## 🔹 What’s Inside?  
- ✅ Solutions to various Ethernaut challenges  
- 🔍 Explanations of vulnerabilities and attack vectors  
- 📜 Solidity code and walkthroughs  

## 🔹 Why This Repo?  
Smart contract security is crucial in blockchain development. By solving these challenges, I aim to:  
- Deepen my understanding of Solidity security  
- Learn to identify and exploit vulnerabilities  
- Improve my smart contract auditing skills  

## 🚀 Work in Progress  
This repo will be continuously updated as I complete more challenges and refine my solutions.  

💡 **Follow along as I break, fix, and learn Solidity security!**  

---

### 📜 Disclaimer  
These solutions are for **learing purpose**. Always follow best practices when developing and auditing smart contracts! Refrence these but do not rely. You may encounter some errors with modules if you directly this project if that happens please remove lib folder and re-install modules with `forge install <pkg>`. 

---

## Solution 
Solution are in `script` directory.
**Run:** 
- No. of `v` specify how much you want to verbose.
- `--broadcast`: only after specifying broadcast, the contract will be deployed in test net.

```
forge scritp script/<name_of_sctipt.s.sol> -vvvv
forge scritp script/<name_of_sctipt.s.sol> -vvvv --broadcast
```

If solidity scritp have **multiple contract**. Then you'll have to specify which contract to deploy.
Either as **`forge script script/<script.s.sol> --tc <contract_name> -v --broadcast`** or **`forge script script/<script.s.sol>:<ContractName> -v --broadcast`**.


### Few Setup to consider
If you want to run locally, then create a new project with forge.
```
forge init . 
```

At **.env** file fill up these parameter form informaton of you meta-mask.
```
PRIVATE_KEY = "<wallet_private_key>"
MY_ADDRESS = "<wallet_address>"
ETHERSCAN_KEY = "<Self-explained>"
```

At **foundry.toml** check if you file is similar to this
```
[profile.default]
src = "src"
out = "out"
libs = ["lib"]

remappings = [
    "@openzeppelin/=lib/openzeppelin-contracts/",
    "@openzeppelin-06/=lib/openzeppelin-contracts-06/",
]

# eth_rpc_url = 'https://rpc.ankr.com/eth_goerli'
# eth_rpc_url = 'https://rpc.ankr.com/eth_sepolia'

# Get your own URL from rpc.ankr.com | Log in and choose for eth_sepolia Testnet |
eth_rpc_url = 'https://rpc.ankr.com/eth_sepolia/<...>'
etherscan_api_key = '${<etherscan_api_key>}'

```
