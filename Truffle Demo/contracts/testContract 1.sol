pragma solidity <=0.8.11 <0.9.0;

contract testContract {
    string name;

    function displayName() public returns (string memory) {
        name = "Maximilliano";
        return name;
    }
}
