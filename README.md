# 🎰 Decentralized Smart Contract Lottery (Raffle)

A provably fair, automated, and decentralized lottery/raffle system built on Ethereum using Solidity and Foundry. This project demonstrates advanced smart contract development practices including Chainlink VRF for verifiable randomness and Chainlink Automation for trustless execution.

## 📋 Table of Contents

- [Overview](#overview)
- [Business Case](#business-case)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [Testing](#testing)
- [Usage](#usage)
- [Contract Functions](#contract-functions)
- [Security Considerations](#security-considerations)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

The **Smart Contract Raffle** is a fully autonomous lottery system that operates on the Ethereum blockchain. It eliminates the need for trusted third parties by using Chainlink's decentralized oracle network for:

- **Verifiable Random Number Generation (VRF)** - Ensures provably fair winner selection
- **Automation (Keepers)** - Triggers winner selection automatically at specified intervals

### Key Highlights

- ✅ **Provably Fair**: Uses Chainlink VRF v2.5 for cryptographically secure randomness
- ✅ **Fully Automated**: Chainlink Automation triggers draws automatically
- ✅ **Transparent**: All lottery logic is on-chain and verifiable
- ✅ **Decentralized**: No central authority controls the lottery
- ✅ **Gas Optimized**: Written with best practices for minimal gas consumption

## 💼 Business Case

### Problem Statement

Traditional lotteries suffer from several critical issues:

1. **Trust Issues**: Players must trust the lottery operator to conduct fair draws
2. **Lack of Transparency**: Draw mechanisms are often opaque and unverifiable
3. **High Overhead**: Centralized operations require significant infrastructure and personnel
4. **Limited Accessibility**: Geographic and regulatory restrictions limit participation
5. **Delayed Payouts**: Winners may wait days or weeks for prize distribution

### Solution

This decentralized raffle solves these problems by:

- **Eliminating Trust Requirements**: Smart contract code is immutable and publicly verifiable
- **Full Transparency**: All transactions, entries, and draws are recorded on-chain
- **Low Operating Costs**: Automated execution eliminates manual intervention
- **Global Accessibility**: Anyone with an Ethereum wallet can participate
- **Instant Payouts**: Winners receive prizes automatically via smart contract execution

### Use Cases

1. **Community Fundraising**: DAOs and communities can run transparent raffles
2. **NFT Projects**: Fair distribution of limited NFT collections
3. **Gaming Platforms**: Integrate provably fair lottery mechanics
4. **Prize Pools**: Esports and competitive gaming prize distribution
5. **Charitable Lotteries**: Transparent fundraising for charitable causes

## ✨ Features

### Core Functionality

- 🎫 **Entry System**: Users pay a fixed entrance fee to enter the raffle
- ⏰ **Time-Based Draws**: Automatic winner selection at configurable intervals
- 🎲 **Random Winner Selection**: Cryptographically secure randomness via Chainlink VRF
- 💰 **Automatic Payouts**: Winner receives the entire prize pool instantly
- 🔄 **Continuous Operation**: Raffle resets automatically after each draw
- 🛡️ **State Management**: Prevents entries during winner calculation

### Technical Features

- **Upgradeable Architecture**: Modular design with separation of concerns
- **Multi-Network Support**: Deploy to Ethereum Sepolia testnet or local Anvil
- **Comprehensive Testing**: Full test suite with unit and integration tests
- **Gas Reporting**: Built-in gas optimization analysis
- **Event Emission**: Detailed event logs for off-chain tracking
- **Error Handling**: Custom errors for gas-efficient reverts

## 🛠️ Technology Stack

### Smart Contract Development

- **[Solidity 0.8.19](https://docs.soliditylang.org/)** - Smart contract programming language
- **[Foundry](https://book.getfoundry.sh/)** - Fast, portable, and modular Ethereum development toolkit
  - **Forge** - Testing framework
  - **Cast** - Swiss army knife for interacting with EVM smart contracts
  - **Anvil** - Local Ethereum node

### Blockchain Infrastructure

- **[Chainlink VRF v2.5](https://docs.chain.link/vrf)** - Verifiable Random Function for provably fair randomness
- **[Chainlink Automation](https://docs.chain.link/chainlink-automation)** - Decentralized automation network (formerly Keepers)
- **[Ethereum](https://ethereum.org/)** - Layer 1 blockchain platform

### Development Tools

- **[Foundry DevOps](https://github.com/Cyfrin/foundry-devops)** - Deployment utilities
- **[Chainlink Brownie Contracts](https://github.com/smartcontractkit/chainlink-brownie-contracts)** - Chainlink contract interfaces
- **[Solmate](https://github.com/transmissions11/solmate)** - Gas-optimized building blocks
- **Make** - Build automation

### Networks Supported

- **Ethereum Sepolia Testnet** - For testing with real-world conditions
- **Anvil Local Network** - For rapid development and testing

## 🏗️ Architecture

### Contract Structure

```
src/
└── Raffle.sol          # Main lottery contract

script/
├── DeployRaffle.s.sol    # Deployment script
├── HelperConfig.s.sol    # Network configuration
└── Interactions.s.sol    # Subscription and consumer management

test/
├── unit/
│   └── Raffle.test.t.sol # Unit tests
└── mocks/
    └── LinkToken.sol      # Mock LINK token for testing
```

### Contract Flow

1. **Users Enter**: Players send entrance fee to join the raffle
2. **Time Passes**: Wait for configured interval (e.g., 30 seconds)
3. **Automation Triggers**: Chainlink Automation calls `performUpkeep()`
4. **Request Random Number**: Contract requests randomness from Chainlink VRF
5. **VRF Responds**: Chainlink VRF provides verifiable random number
6. **Winner Selected**: Random number used to select winner from players array
7. **Prize Distributed**: Entire contract balance sent to winner
8. **Raffle Resets**: State resets and new raffle begins

### State Machine

The Raffle contract operates in three states:

1. **OPEN** - Accepting new entries
2. **CALCULATING** - Waiting for random number from Chainlink VRF
3. **CLOSED** - Raffle is closed (reserved for future use)

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **[Git](https://git-scm.com/downloads)**
- **[Foundry](https://book.getfoundry.sh/getting-started/installation)** (includes Forge, Cast, and Anvil)
- **[Make](https://www.gnu.org/software/make/)** (usually pre-installed on Unix systems)
- **Ethereum Wallet** with testnet ETH (for Sepolia deployment)
- **[Chainlink Subscription](https://vrf.chain.link/)** (for VRF functionality)

### Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/foundry-smart-contract-lottery.git
cd foundry-smart-contract-lottery

# Install dependencies
make install

# Build the project
forge build

# Run tests
forge test

# Run tests with gas reporting
forge test --gas-report
```

## 📦 Installation

### Step 1: Install Foundry

If you haven't installed Foundry yet:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Step 2: Clone and Setup

```bash
# Clone the repository
git clone https://github.com/yourusername/foundry-smart-contract-lottery.git
cd foundry-smart-contract-lottery

# Install project dependencies
make install
```

This will install:

- `foundry-devops@0.2.2` - Deployment tools
- `chainlink-brownie-contracts@1.1.1` - Chainlink contract interfaces
- `forge-std@v1.8.2` - Foundry standard library
- `solmate@v6` - Gas-optimized contracts

### Step 3: Verify Installation

```bash
# Compile contracts
forge build

# Run test suite
forge test

# Run with verbosity
forge test -vv

# Check coverage
forge coverage
```

## ⚙️ Configuration

### Environment Variables

Create a `.env` file in the project root:

```bash
# Network RPC URLs
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY

# Etherscan API Key (for contract verification)
ETHERSCAN_API_KEY=your_etherscan_api_key

# Use Foundry's keystore (recommended)
# Create with: cast wallet import my-account --interactive
```

**⚠️ Security Note**: Never commit private keys or `.env` files to version control!

### Network Configuration

The project uses `HelperConfig.s.sol` for network-specific settings:

#### Sepolia Testnet Configuration

- **Entrance Fee**: 0.01 ETH
- **Interval**: 30 seconds
- **VRF Coordinator**: `0x5C210eF41CD1a72de73bF76eC39637bB0d3d7BEE`
- **Gas Lane (Key Hash)**: Sepolia 500 gwei key hash
- **Callback Gas Limit**: 500,000
- **LINK Token**: `0x779877A7B0D9E8603169DdbD7836e478b4624789`

#### Local Anvil Configuration

- Uses mock VRF Coordinator
- Automated subscription creation
- Pre-funded with mock LINK tokens
- Instant block confirmation

### Chainlink VRF Setup

1. **Get Testnet LINK Tokens**

   - Visit [Chainlink Faucet](https://faucets.chain.link/)
   - Connect your wallet
   - Request LINK for Sepolia testnet

2. **Create VRF Subscription**

   - Go to [VRF Subscription Manager](https://vrf.chain.link/)
   - Create a new subscription
   - Fund it with at least 2 LINK tokens
   - Note your subscription ID

3. **Update Configuration**
   - Update `subscriptionId` in `HelperConfig.s.sol` (line ~60)
   - Ensure VRF Coordinator address is correct for your network

## 🚢 Deployment

### Deploy to Local Anvil Network

```bash
# Terminal 1: Start local Ethereum node
anvil

# Terminal 2: Deploy contracts
forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url http://localhost:8545 --broadcast -vvvv
```

The deployment script automatically:

- Deploys mock VRF Coordinator
- Creates and funds a subscription
- Deploys the Raffle contract
- Adds the Raffle as a consumer

### Deploy to Sepolia Testnet

```bash
# Using encrypted keystore (recommended)
make deploy-sepolia

# Or manually:
forge script script/DeployRaffle.s.sol:DeployRaffle \
  --rpc-url $SEPOLIA_RPC_URL \
  --account my-account \
  --broadcast \
  --verify \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  -vvvv
```

### Post-Deployment Steps

1. **Fund VRF Subscription** (if not done automatically)

   ```bash
   forge script script/Interactions.s.sol:FundSubscription --rpc-url $SEPOLIA_RPC_URL --broadcast
   ```

2. **Add Consumer to Subscription** (if not done automatically)

   ```bash
   forge script script/Interactions.s.sol:AddConsumer --rpc-url $SEPOLIA_RPC_URL --broadcast
   ```

3. **Register Chainlink Automation Upkeep**

   - Visit [Chainlink Automation](https://automation.chain.link/)
   - Click "Register New Upkeep"
   - Select "Custom logic"
   - Enter your deployed Raffle contract address
   - Fund with LINK tokens (recommend 5+ LINK)
   - Set appropriate gas limits

4. **Verify Deployment**
   ```bash
   # Check contract on Etherscan
   # View your subscription on vrf.chain.link
   # Verify automation upkeep on automation.chain.link
   ```

## 🧪 Testing

### Run All Tests

```bash
# Run all tests
forge test

# Run with verbosity (shows console.log outputs)
forge test -vv

# Run with full traces
forge test -vvvv

# Run specific test
forge test --match-test testRaffleInitializesInOpenState

# Run tests matching a pattern
forge test --match-contract RaffleTest

# Run with gas reporting
forge test --gas-report
```

### Test Coverage

```bash
# Generate coverage report
forge coverage

# See detailed coverage with line-by-line breakdown
forge coverage --report debug
```

### Test Structure

The test suite includes comprehensive unit tests:

```solidity
// Initialization Tests
✓ testRaffleInitializesInOpenState()

// Entry Tests
✓ testRaffleRevertsWhenYouDontPayEnough()
✓ testRaffleRecordsPlayerWhenTheyEnter()
✓ testDontAllowPlayersToEnterWhileRaffleIsCalculating()
✓ testEmitsEventOnEntrance()

// CheckUpkeep Tests
✓ testCheckUpkeepReturnsFalseIfItHasNoBalance()
✓ testCheckUpkeepReturnsFalseIfRaffleIsNotOpen()
✓ testCheckUpkeepReturnsFalseIfNotEnoughTimeHasPassed()
✓ testCheckUpkeepReturnsTrueWhenParametersAreGood()

// PerformUpkeep Tests
✓ testPerformUpkeepCanOnlyRunIfCheckUpkeepIsTrue()
✓ testPerformUpkeepRevertsIfCheckUpkeepIsFalse()
✓ testPerformUpkeepUpdatesRaffleStateAndEmitsRequestId()

// FulfillRandomWords Tests
✓ testFulfillRandomWordsCanOnlyBeCalledAfterPerformUpkeep()
✓ testFulfillRandomWordsPicksAWinnerResetsAndSendsMoney()
```

### Fuzz Testing

The project includes fuzz testing with 1000 runs:

```toml
[fuzz]
runs = 1000
```

### Gas Snapshots

```bash
# Create gas snapshot
forge snapshot

# Compare gas usage
forge snapshot --diff
```

## 📖 Usage

### For Players

#### 1. Enter the Raffle

Using Cast:

```bash
cast send <RAFFLE_ADDRESS> "enterRaffle()" --value 0.01ether --rpc-url $SEPOLIA_RPC_URL --account my-account
```

Using Etherscan:

- Navigate to contract on Etherscan
- Go to "Write Contract"
- Connect wallet
- Call `enterRaffle` with 0.01 ETH

#### 2. Check Your Entry

```bash
# View all players
cast call <RAFFLE_ADDRESS> "getPlayers()(address[])" --rpc-url $SEPOLIA_RPC_URL

# Check raffle state
cast call <RAFFLE_ADDRESS> "getRaffleState()(uint8)" --rpc-url $SEPOLIA_RPC_URL

# Check recent winner
cast call <RAFFLE_ADDRESS> "getRecentWinner()(address)" --rpc-url $SEPOLIA_RPC_URL
```

### For Administrators

#### Check if Upkeep is Needed

```bash
cast call <RAFFLE_ADDRESS> "checkUpkeep(bytes)(bool,bytes)" 0x --rpc-url $SEPOLIA_RPC_URL
```

#### Manually Trigger Upkeep (for testing)

```bash
cast send <RAFFLE_ADDRESS> "performUpkeep(bytes)" 0x --rpc-url $SEPOLIA_RPC_URL --account my-account
```

## 📝 Contract Functions

### Public/External Functions

#### `enterRaffle()`

```solidity
function enterRaffle() external payable
```

- **Description**: Enter the raffle by paying the entrance fee
- **Requires**:
  - `msg.value >= i_entranceFee`
  - Raffle state must be `OPEN`
- **Effects**: Adds sender to players array
- **Events**: Emits `RaffleEntered(address indexed player, uint256 timestamp)`
- **Gas**: ~50,000 - 70,000 (varies with array size)

#### `checkUpkeep(bytes memory)`

```solidity
function checkUpkeep(bytes memory) public view returns (bool upkeepNeeded, bytes memory)
```

- **Description**: Called by Chainlink Automation to check if winner selection is needed
- **Returns**: `true` if all conditions are met
- **Conditions**:
  - Time interval has passed (`block.timestamp - s_lastTimestamp > i_interval`)
  - Raffle is in `OPEN` state
  - Contract has balance (`address(this).balance > 0`)
  - Has at least one player (`s_players.length > 0`)
- **Gas**: ~3,000 - 5,000

#### `performUpkeep(bytes calldata)`

```solidity
function performUpkeep(bytes calldata) external
```

- **Description**: Trigger winner selection process
- **Requires**: `checkUpkeep` must return `true`
- **Effects**:
  - Changes state to `CALCULATING`
  - Requests random number from Chainlink VRF
- **Events**: Emits `RequestedRaffleWinner(uint256 indexed requestId)`
- **Gas**: ~80,000 - 120,000

### View Functions

```solidity
// Get entrance fee amount
function getEntranceFee() external view returns (uint256)

// Get current raffle state (0=OPEN, 1=CALCULATING, 2=CLOSED)
function getRaffleState() public view returns (RaffleState)

// Get array of all current players
function getPlayers() public view returns (address payable[] memory)

// Get specific player by index
function getPlayer(uint256 index) public view returns (address payable)

// Get timestamp of last raffle
function getLastTimestamp() external view returns (uint256)

// Get address of most recent winner
function getRecentWinner() external view returns (address)
```

### Internal Functions

#### `fulfillRandomWords(uint256 requestId, uint256[] calldata randomWords)`

```solidity
function fulfillRandomWords(uint256 requestId, uint256[] calldata randomWords) internal override
```

- **Description**: Callback function called by Chainlink VRF with random number
- **Access**: Only callable by VRF Coordinator
- **Effects**:
  - Selects winner using modulo operation
  - Resets raffle state to `OPEN`
  - Clears players array
  - Updates timestamp
  - Transfers entire balance to winner
- **Events**: Emits `WinnerPicked(address indexed recentWinner)`

### Events

```solidity
event RaffleEntered(address indexed player, uint256 timestamp)
event RequestedRaffleWinner(uint256 indexed requestId)
event WinnerPicked(address indexed recentWinner)
```

### Custom Errors

```solidity
error Raffle__InsufficientEntranceFee()
error Raffle_TransferFailed()
error Raffle_NotOpen()
error Raffle_UpkeepNotNeeded(uint256 balance, uint256 playersLength, uint256 raffleState)
```

## 🔒 Security Considerations

### Implemented Security Measures

1. **Reentrancy Protection**:

   - State changes before external calls
   - Winner selected before transfer

2. **Access Control**:

   - Only VRF Coordinator can call `fulfillRandomWords`
   - Inherited from `VRFConsumerBaseV2Plus`

3. **Input Validation**:

   - Checks for sufficient entrance fee
   - Validates raffle state before entry
   - Verifies upkeep conditions

4. **Integer Overflow Protection**:

   - Solidity 0.8.19 has built-in overflow checks
   - Safe arithmetic operations

5. **Randomness**:

   - Chainlink VRF provides cryptographically secure randomness
   - Cannot be manipulated by miners or players

6. **State Management**:
   - State transitions prevent entries during calculation
   - Atomic state changes

### Known Limitations

1. **Gas Limits**:

   - Very large player arrays may exceed block gas limits
   - Recommend monitoring player count

2. **Front-Running**:

   - Entry timing is visible in mempool
   - Players can see when others enter

3. **Prize Pool**:

   - No maximum cap on prize pool
   - Winner must be able to receive ETH

4. **Chainlink Dependency**:
   - Requires funded LINK subscription
   - Depends on Chainlink network uptime

### Best Practices Followed

- ✅ CEI Pattern (Checks-Effects-Interactions)
- ✅ Custom errors for gas efficiency
- ✅ Immutable variables where possible
- ✅ Events for all state changes
- ✅ Comprehensive natspec documentation
- ✅ Extensive test coverage

### Pre-Production Checklist

Before mainnet deployment:

- [ ] Professional security audit (recommend: Cyfrin, OpenZeppelin, Trail of Bits)
- [ ] Economic analysis of gas costs vs entrance fees
- [ ] Stress testing with 1000+ players
- [ ] Emergency pause mechanism consideration
- [ ] Upgrade path evaluation
- [ ] Legal compliance review
- [ ] Insurance coverage evaluation

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

### How to Contribute

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Make your changes**

   - Write clean, documented code
   - Add tests for new features
   - Update documentation

4. **Run tests**

   ```bash
   forge test
   forge fmt
   ```

5. **Commit your changes**

   ```bash
   git commit -m 'Add amazing feature'
   ```

6. **Push to your fork**

   ```bash
   git push origin feature/amazing-feature
   ```

7. **Open a Pull Request**

### Development Guidelines

- Follow [Solidity Style Guide](https://docs.soliditylang.org/en/latest/style-guide.html)
- Write comprehensive tests (aim for >90% coverage)
- Document all functions with natspec comments
- Ensure all tests pass before submitting PR
- Keep gas optimizations in mind
- Update README for significant changes

### Code of Conduct

- Be respectful and constructive
- Focus on improving the codebase
- Help others learn and grow

## 📄 License

This project is licensed under the MIT License - see below for details:

```
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 🙏 Acknowledgments

- **[Patrick Collins](https://twitter.com/PatrickAlphaC)** - Foundry course and blockchain education
- **[Chainlink](https://chain.link/)** - VRF and Automation infrastructure
- **[Foundry Team](https://github.com/foundry-rs/foundry)** - Amazing development framework
- **[Cyfrin](https://www.cyfrin.io/)** - Security best practices and auditing standards
- **[OpenZeppelin](https://www.openzeppelin.com/)** - Secure smart contract patterns

## 📞 Contact & Links

- **Author**: Anton
- **GitHub**: [@antonk](https://github.com/antonk)
- **Project Repository**: [foundry-smart-contract-lottery](https://github.com/yourusername/foundry-smart-contract-lottery)

### Useful Links

- [Chainlink VRF Documentation](https://docs.chain.link/vrf)
- [Chainlink Automation Documentation](https://docs.chain.link/chainlink-automation)
- [Foundry Book](https://book.getfoundry.sh/)
- [Solidity Documentation](https://docs.soliditylang.org/)
- [Ethereum Development Documentation](https://ethereum.org/en/developers/)

## 🗺️ Roadmap

### Phase 1: Core Functionality ✅

- [x] Basic raffle implementation
- [x] Chainlink VRF integration
- [x] Chainlink Automation integration
- [x] Comprehensive test suite
- [x] Deployment scripts

### Phase 2: Enhancements 🚧

- [ ] Multiple entrance fee tiers
- [ ] Tiered prize distribution (1st, 2nd, 3rd place)
- [ ] ERC20 token support for entrance fees
- [ ] NFT tickets as proof of entry
- [ ] Emergency pause functionality

### Phase 3: Advanced Features 📋

- [ ] Frontend dApp interface (React + Web3)
- [ ] Subgraph for event indexing
- [ ] Multi-chain deployment (Polygon, Arbitrum, Optimism)
- [ ] DAO governance for parameter changes
- [ ] Referral system

### Phase 4: Production 🎯

- [ ] Professional security audit
- [ ] Mainnet deployment
- [ ] Marketing and community building
- [ ] Partnership integrations
- [ ] Analytics dashboard

## 📊 Project Stats

- **Solidity Version**: 0.8.19
- **Test Coverage**: ~85%
- **Gas Optimized**: Yes
- **Audited**: Not yet
- **Mainnet Ready**: No (testnet only)

## 🔧 Troubleshooting

### Common Issues

**Issue**: "Insufficient LINK balance"

```bash
# Solution: Fund your VRF subscription
forge script script/Interactions.s.sol:FundSubscription --broadcast
```

**Issue**: "Upkeep not triggered"

```bash
# Solution: Check Chainlink Automation balance and upkeep conditions
cast call <RAFFLE_ADDRESS> "checkUpkeep(bytes)(bool,bytes)" 0x --rpc-url $SEPOLIA_RPC_URL
```

**Issue**: "Transaction reverts with Raffle_NotOpen"

```bash
# Solution: Wait for current raffle to complete or check state
cast call <RAFFLE_ADDRESS> "getRaffleState()(uint8)" --rpc-url $SEPOLIA_RPC_URL
```

**Issue**: "Cast sig command not found"

```bash
# Solution: Update Foundry
foundryup
```

## 📚 Additional Resources

- [Chainlink VRF Best Practices](https://docs.chain.link/vrf/v2/best-practices)
- [Foundry Best Practices](https://book.getfoundry.sh/tutorials/best-practices)
- [Smart Contract Security Best Practices](https://consensys.github.io/smart-contract-best-practices/)
- [Gas Optimization Tips](https://gist.github.com/hrkrshnn/ee8fabd532058307229d65dcd5836ddc)

---

**⚠️ Disclaimer**: This is an educational project demonstrating smart contract development with Foundry and Chainlink. It has not been professionally audited. Use at your own risk. Never deploy to mainnet with real funds without a thorough security audit. Always conduct extensive testing before handling real value.

**Made with ❤️ by Anton | Powered by Foundry & Chainlink**
