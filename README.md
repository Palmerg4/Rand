# On-chain 'randomness'

This simple example shows why you should NOT use block.timestamp or blockhash to generate any sort of randomness. These values are public and easily accessible.

# Prevention

Instead of using trying to generate randomness on-chain using blockhash and block.timestamp, use something like [Chainlink VRF's](https://docs.chain.link/docs/vrf/v2/introduction/) to generate randomness for use in smart contracts.

```shell
npm install
npx hardhat test
```
