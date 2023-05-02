//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library Converter{
    function getPrice(AggregatorV3Interface priceFeed) internal view returns(uint256){
        (,int price,,,) = priceFeed.latestRoundData();

        return uint256(price*1e10);
    }

    function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed) 
    internal view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmountinUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountinUSD;
    }  
}