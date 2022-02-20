// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;
// import "./quickSortAlgorithm.sol";

// // The English Premier League

// // 1. addClub function that takes in all club names and club tickers(for confirming proof of existence)
// // 2. viewTable function should display registered clubs with default data
// // 3. simulateSeason function that assigns data(matches played, won, drawn, lost and points acquired) to each club
// // 4. viewTable function should display registered clubs with final data in descending order of points acquired
// // 5. relegate function that pops last 3 clubs  
// // 6. promote function that replaces relegated clubs with promoted clubs
// // 6. viewTable function should display qualified clubs with promoted clubs/without relegated clubs
// // 7. viewClub function should search table by ticker and display queried club with corresponding data and error message if club is not registered
// contract EPL {
    
//     struct Club {
//         uint id;
//         string name;
//         string ticker;
//         uint points;
//     }

//     uint currentID = 1;
//     uint omega = 1;

//     Club[] clubs;
//     uint[] sortedPoints;
//     uint[] pointArr;
//     Club[5] sortedClubArr;
//     mapping (uint => Club) public clubID;
//     mapping(string => Club) private getSingleClub;

//    // 1. addClub function that takes in all club names and club tickers(for confirming proof of existence)
//     function addClub (string memory _clubName,
//                     string memory _clubTicker) public {
//         // Requires that club has not been registered 
//         require(getSingleClub[_clubTicker].id == 0, "This Football Club has already been registered");
//         Club memory newClub = Club(currentID, _clubName, _clubTicker, 0);
//         getSingleClub[_clubTicker] = newClub;
//         clubs.push(newClub);
//         clubID[currentID] = newClub;
//         currentID++;
//     }

//     function checkClub(string memory _clubTicker) public view returns(Club memory) {
//         require(getSingleClub[_clubTicker].id != 0, "This club has not been registered");
//         return  getSingleClub[_clubTicker];
//     }

//     function viewTable() public view returns(Club[] memory) {
//         return clubs;
//     }
  
//     // returns random number that ranges between 60 and 100  
//     function randomPoints () public returns(uint) {
//         uint mod = 40;
//         omega += 1;
//         uint result = uint(keccak256(abi.encodePacked(block.timestamp, omega, msg.sender))) % mod;
//         return result + 60;
//     }

//     // Show table at the end of season
//     function simulateSeason() public returns(Club[5] memory) {
        
//         for (uint i =0; i < clubs.length; i++) {
//             clubs[i].points = randomPoints();
//         }

//           for (uint j =0; j< clubs.length; j++){
//               uint randomPoint = clubs[j].points;
//             pointArr.push(randomPoint);
//         }
//         QuickSort eplSort = new QuickSort();
//         sortedPoints  = eplSort.sort(pointArr);
//         for (uint j =0; j<sortedPoints.length; j++){
//             for (uint k =0; k< clubs.length; k++){
//                 if(sortedPoints[j]== clubs[k].points){
//                     sortedClubArr[j] = clubs[k];
//                 }
//             }
//         }

//         return sortedClubArr; 
//     }

//     Club[] public storageSortedClubArr = sortedClubArr;
//     function relegate () public returns (Club[] memory){
//         storageSortedClubArr.pop();
        
//         return (storageSortedClubArr);
//     }









// }

  contract EPL{
    struct Club{
        uint position;
        uint points;
        string name;
        string ticker;
    }
    uint index = 1;
    mapping(string => Club) clubID;

    function addClub(string memory _name, string memory _ticker) public{
    Club storage eplClub = clubID[_ticker];
    eplClub.position = 0;
    eplClub.points = 0;
    eplClub.name = _name;
    eplClub.ticker = _ticker;

    index++;
    }

    function viewClub(string memory _ticker) public view returns(Club memory clubInfo){
        clubInfo = clubID[_ticker];
    }

    function viewtable() public returns(Club[] memory clubs){

    }