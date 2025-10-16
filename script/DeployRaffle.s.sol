//// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {CreateSubscription, FundSubscription, AddConsumer} from "./Interactions.s.sol";

contract DeployRaffle is Script {
    function run() public returns (Raffle raffle) {
        (raffle, ) = deployRaffle();
    }

    function deployRaffle()
        public
        returns (Raffle raffle, HelperConfig helperConfig)
    {
        helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory config = helperConfig
            .getConfigByChainId(block.chainid);

        if (config.subscriptionId == 0) {
            CreateSubscription subscriptionContract = new CreateSubscription();
            (config.subscriptionId, ) = subscriptionContract.createSubscription(
                config.vrfCoordinator,
                config.account
            );

            helperConfig.setConfig(block.chainid, config);
        }

        FundSubscription fundSubscription = new FundSubscription();
        fundSubscription.fundSubscription(
            config.subscriptionId,
            config.vrfCoordinator,
            config.linkToken,
            config.account
        );

        vm.startBroadcast(config.account);
        raffle = new Raffle(
            config.entranceFee,
            config.interval,
            config.vrfCoordinator,
            config.gasLane,
            config.subscriptionId,
            config.callbackGasLimit
        );
        vm.stopBroadcast();

        AddConsumer addConsumer = new AddConsumer();
        addConsumer.addConsumer(
            address(raffle),
            config.vrfCoordinator,
            config.subscriptionId,
            config.account
        );
    }
}
