contract SaveData{
    constructor() public {
    }
    mapping (string=>string) data;
    function setStr(string memory key, string memory value) public payable {
        data[key] = value;
    }
    function getStr(string memory key) public returns(string memory){
        return data[key];
    }
}