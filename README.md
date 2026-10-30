<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<br />
<div align="center">
  <h1 align="center">Solidity Learning</h1>
  <p align="center">
    My hands-on journey into blockchain development: Solidity contracts, Hardhat projects, React front ends, a real estate NFT dApp, and a static security review of a live stablecoin contract.
    <br /><br />
    <a href="#whats-inside"><strong>Explore the projects »</strong></a>
    <br /><br />
    <a href="#learning-resources">Learning Resources</a>
    &middot;
    <a href="https://github.com/rafsunsheikh/simple_candidates_dapps">Companion dApp Tutorial</a>
    &middot;
    <a href="https://github.com/rafsunsheikh/solidity_learning/issues">Report Bug</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a>
      <ul><li><a href="#built-with">Built With</a></li></ul>
    </li>
    <li><a href="#whats-inside">What's Inside</a>
      <ul>
        <li><a href="#highlights">Highlights</a></li>
      </ul>
    </li>
    <li><a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#running-a-hardhat-project">Running A Hardhat Project</a></li>
        <li><a href="#running-the-real-estate-dapp">Running The Real Estate dApp</a></li>
      </ul>
    </li>
    <li><a href="#learning-resources">Learning Resources</a></li>
    <li><a href="#related-project">Related Project</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## About The Project

This repository is a learning log. I started it in July 2024 to document how I learned Solidity and the tools around it, and I kept adding to it as each new topic clicked. It moves from single-file practice contracts, to Hardhat projects with tests, to full dApps with a React front end, and finally to reviewing a real production contract.

Each folder is a separate small project, so you can open just the part you are interested in.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [![Solidity][solidity-shield]][solidity-url]
* [![Hardhat][hardhat-shield]][hardhat-url]
* [![ethers.js][ethers-shield]][ethers-url]
* [![React][react-shield]][react-url]
* [![OpenZeppelin][openzeppelin-shield]][openzeppelin-url]
* [![Node.js][node-shield]][node-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## What's Inside

| Folder | What it is |
|--------|------------|
| [`simple_contracts/`](simple_contracts) | First practice contracts written for Remix: a counter, a hotel room booking contract (payable function, modifiers and an event), and three contracts that try out data types, arrays, structs, mappings, nested mappings and an `Ownable` pattern. |
| [`hardhat_learning/`](hardhat_learning) | Hardhat projects. `demo_app_1` and `first_dapps` are the Hardhat sample `Lock` project with tests and an Ignition deploy module. `second_dapps` is a simple token contract with tests. `full-stack-dapps` connects the `Lock` contract to a React front end with ethers.js on a local chain (chain ID 1337). |
| [`node_js_learning/`](node_js_learning) | Node.js basics from freeCodeCamp (modules, `os`, `path`), plus `project_2`, a Hardhat project set up to deploy to the Sepolia test network using values from a `.env` file. |
| [`react-app/`](react-app) | A small React and TypeScript app built with Vite while learning JSX and components. |
| [`real_estate/`](real_estate) | A real estate NFT dApp. `RealEstate.sol` mints properties as ERC-721 tokens and `Escrow.sol` holds a listed property and records the seller, buyer, inspector, lender, price and the buyer's earnest deposit. Includes tests, a deploy script and a React front end. Built by following Dapp University's Millow tutorial. |
| [`StableCoin/`](StableCoin) | A static security review of the AUDD ERC-20 stablecoin contract, with the contract source, a function graph and the written report. |
| [`Papers/`](Papers) | Reference reading: the Bangladesh National Blockchain Strategy and draft national AI strategy and policy documents. |

### Highlights

* **Stablecoin audit (October 2024).** I ran a static audit of the AUDD Ethereum ERC-20 contract with [AuditWizard][auditwizard-url], which uses the 4naly3er and aderyn analysers. The review found no severe issues in `StableCoin.sol`, only low-risk ones such as centralisation risk from owner privileges, missing `address(0)` checks, and `public` functions that could be `external`. The full report is in [`StableCoin/audit_report.md`](StableCoin/audit_report.md).
* **Real estate NFT dApp.** Minting properties as NFTs and listing them in an escrow contract, tested with Hardhat, with a React UI on top.
* **Full-stack Hardhat and React.** Compiling contracts straight into the React app's `src/artifacts` folder so the front end can load the ABI.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

Every project folder has its own `package.json`, so install and run each one from inside its folder.

### Prerequisites

* [Node.js][node-url] and npm
* For the dApps: a browser wallet such as [MetaMask](https://metamask.io/)

### Running A Hardhat Project

These commands work in `hardhat_learning/demo_app_1`, `hardhat_learning/first_dapps`, `hardhat_learning/second_dapps` and `node_js_learning/project_2`.

1. Clone the repo and move into a project folder
   ```sh
   git clone https://github.com/rafsunsheikh/solidity_learning.git
   cd solidity_learning/hardhat_learning/second_dapps
   ```
2. Install the packages
   ```sh
   npm install
   ```
3. Run the tests
   ```sh
   npx hardhat test
   ```

For the projects that use the sample `Lock` contract you can also try:

```sh
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```

### Running The Real Estate dApp

From the `real_estate` folder:

1. Install the packages
   ```sh
   npm install
   ```
2. Run the tests
   ```sh
   npx hardhat test
   ```
3. Start a local Hardhat node
   ```sh
   npx hardhat node
   ```
4. In a second terminal, deploy the contracts
   ```sh
   npx hardhat run ./scripts/deploy.js --network localhost
   ```
5. Start the front end
   ```sh
   npm run start
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Learning Resources

These are the tutorials and references I used along the way.

**Solidity official documentation**
* [Solidity Documentation](https://docs.soliditylang.org/en/latest/introduction-to-smart-contracts.html)

**Beginner tutorials**
* [freeCodeCamp Solidity handbook](https://www.freecodecamp.org/news/learn-solidity-handbook/)
* [What is Web3?](https://chain.link/education/web3)
* [Solidity by Example](https://solidity-by-example.org/)

**Ethereum**
* [Ethereum website](https://ethereum.org/en/)
* [Eth.build](https://eth.build/)
* [Learning tools](https://ethereum.org/en/developers/learning-tools/)

**Front end**
* Flutter
* React
  * [React tutorial for beginners (YouTube)](https://www.youtube.com/watch?v=SqcY0GlETPk)
  * [create-react-app documentation](https://create-react-app.dev/docs/getting-started/)
  * [react.dev](https://react.dev/learn)
  * [Net Ninja video playlist](https://www.youtube.com/playlist?list=PL4cUxeGkcC9gZD-Tvwfod2gaISzfRiP9d)
  * [Tic-tac-toe tutorial](https://react.dev/learn/tutorial-tic-tac-toe)
* Ethers.js
  * [Dapp University tutorial](https://www.youtube.com/watch?v=yk7nVp5HTCk)

**Back end**
* Truffle
  * [Learn Truffle by developing a dApp (YouTube)](https://www.youtube.com/watch?v=b_k8yDC3hdM)
* Ganache
* [Hardhat](https://hardhat.org/)
  * [hardhat-boilerplate project](https://github.com/NomicFoundation/hardhat-boilerplate/tree/master)
  * [Alchemy Hardhat tutorials](https://docs.alchemy.com/docs/hello-world-smart-contract)
  * [Dapp University real estate project](https://github.com/dappuniversity/millow)
  * [Dapp University e-commerce project](https://github.com/dappuniversity/dappazon)
* Node.js
  * [freeCodeCamp](https://www.freecodecamp.org/news/get-started-with-nodejs/)

**Unsorted learning materials**
* https://github.com/AtharvSan/Essential-Solidity
* https://github.com/patrickd-/cheatsheet.sol
* https://www.youtube.com/watch?v=umepbfKp5rI
* https://docs.oasis.io/
* https://www.youtube.com/watch?v=gD-_cgV3Nz4
* https://www.youtube.com/watch?v=XBT1_WFV5tU
* https://www.youtube.com/watch?v=lpsFR_YrHgY
* https://www.youtube.com/watch?v=LDLz06X_KNY
* https://www.openzeppelin.com/solidity-contracts
* https://ethereum.org/en/developers/docs/smart-contracts/
* https://eips.ethereum.org/erc

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Related Project

* [Build Your First dApp in Under 20 Minutes][candidates-url]: a beginner tutorial I wrote that deploys a small election contract to Ganache and talks to it from a plain HTML and web3.js page.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the MIT License. See [`LICENSE.md`](LICENSE.md) for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

Rafsun Sheikh: [GitHub][github-url] &middot; [LinkedIn][linkedin-url] &middot; [Medium][medium-url] &middot; [Website][website-url]

Project link: [https://github.com/rafsunsheikh/solidity_learning][repo-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[contributors-shield]: https://img.shields.io/github/contributors/rafsunsheikh/solidity_learning.svg?style=for-the-badge
[contributors-url]: https://github.com/rafsunsheikh/solidity_learning/graphs/contributors
[stars-shield]: https://img.shields.io/github/stars/rafsunsheikh/solidity_learning.svg?style=for-the-badge
[stars-url]: https://github.com/rafsunsheikh/solidity_learning/stargazers
[issues-shield]: https://img.shields.io/github/issues/rafsunsheikh/solidity_learning.svg?style=for-the-badge
[issues-url]: https://github.com/rafsunsheikh/solidity_learning/issues
[license-shield]: https://img.shields.io/github/license/rafsunsheikh/solidity_learning.svg?style=for-the-badge
[license-url]: https://github.com/rafsunsheikh/solidity_learning/blob/master/LICENSE.md
[repo-url]: https://github.com/rafsunsheikh/solidity_learning
[candidates-url]: https://github.com/rafsunsheikh/simple_candidates_dapps
[solidity-shield]: https://img.shields.io/badge/Solidity-363636?style=for-the-badge&logo=solidity&logoColor=white
[solidity-url]: https://soliditylang.org/
[hardhat-shield]: https://img.shields.io/badge/Hardhat-FFF100?style=for-the-badge&logo=hardhat&logoColor=black
[hardhat-url]: https://hardhat.org/
[ethers-shield]: https://img.shields.io/badge/ethers.js-2535A0?style=for-the-badge&logo=ethereum&logoColor=white
[ethers-url]: https://docs.ethers.org/
[react-shield]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[react-url]: https://react.dev/
[openzeppelin-shield]: https://img.shields.io/badge/OpenZeppelin-4E5EE4?style=for-the-badge&logo=openzeppelin&logoColor=white
[openzeppelin-url]: https://www.openzeppelin.com/
[node-shield]: https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white
[node-url]: https://nodejs.org/
[auditwizard-url]: https://app.auditwizard.io/
[github-url]: https://github.com/rafsunsheikh
[linkedin-url]: https://www.linkedin.com/in/mdrafsunsheikh/
[medium-url]: https://medium.com/@rafsunsheikh116
[website-url]: https://rafsunsheikh.github.io
