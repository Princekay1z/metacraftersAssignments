# Solidity Contract README

conditions.sol

This Solidity contract demonstrates the usage of error handling mechanisms (require, revert, and assert) within Ethereum smart contracts.

It includes three functions to showcase these mechanisms: multiplyFactor, resetFactor, and divideFactor.


## Contract Details

Contract Name: conditions

Solidity Version: 0.8.18

License: MIT

## Functions

1. multiplyFactor(uint x)

This function multiplies the contract's factor state variable by the input x.

Input: x (an unsigned integer)

Error Handling: It uses the require statement to ensure x is not zero.

If x is zero, it reverts the transaction with the message "if you multiply by zero the factor will become 0

Behavior: If x is not zero, it updates the factor variable with the result of the multiplication.

2. resetFactor(uint x)
   
This function is used to reset the contract's factor state variable to a new value specified by x.

Input: x (an unsigned integer)

Error Handling: It checks if x is equal to zero using an if statement.

If x is zero, it reverts the transaction with the message "you can't reset the factor to zero." 

Otherwise, it updates the factor variable with the value of x.

3. divideFactor(uint x)

This function divides the contract's factor state variable by the input x.

Input: x (an unsigned integer)

Error Handling: It uses the assert statement to ensure x is not zero. 

If x is zero, it triggers a runtime error and reverts the transaction.

Behavior: If x is not zero, it updates the factor variable by performing the division.

## Usage
To interact with this contract:

Deploy the contract to a blockchain network.

Call the multiplyFactor function with a non-zero value of x to multiply the factor.

Call the resetFactor function with a non-zero value of x to reset the factor.

Call the divideFactor function with a non-zero value of x to divide the factor.

## License

This contract is released under the MIT License.
