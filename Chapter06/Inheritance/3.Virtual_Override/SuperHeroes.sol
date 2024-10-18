// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Hero.sol";

// TODO: create Mage/Warrior Heroes
contract Mage is Hero(50){
    function attack(address _enemy) public override{

        // Instantiate the enemy using the Enemy interface
        Enemy enemyContract = Enemy(_enemy);

        // Call takeAttack with the Brawl attack type
        enemyContract.takeAttack(AttackTypes.Spell);
    }
}

contract Warrior is Hero(200){
    function attack(address _enemy) public override{
        // Instantiate the enemy using the Enemy interface
        Enemy enemyContract = Enemy(_enemy);

        // Call takeAttack with the Brawl attack type
        enemyContract.takeAttack(AttackTypes.Brawl);
    }
}
