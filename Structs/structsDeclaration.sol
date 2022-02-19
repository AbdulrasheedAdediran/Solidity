contract DeclaringStruct{
struct myStruct{
    uint num;
    uint num2;
}
uint256 index = 1;
mapping(uint => myStruct) public sampleStruct;
function writeStruct(uint a, uint b) public{

    myStruct storage variable = sampleStruct[index];
    variable.num = 20;
    variable.num2 = 30;

    index++;
}
function seeStruct(uint valueIndex) public view returns(myStruct memory k){
k = sampleStruct[valueIndex];
}

 function seeAllStructs(uint structSize) public view returns(myStruct[] memory _myStructArray){
     require(structSize <= index, "e cannor go");
    //anoda angu
    // _myStructArray = new myStruct[](structSize)
     myStruct[] memory _new = new myStruct[](structSize);

     for(uint i = 0; i < structSize; i++){
         _myStructArray[i] = sampleStruct[i];
     }
     
 }

}