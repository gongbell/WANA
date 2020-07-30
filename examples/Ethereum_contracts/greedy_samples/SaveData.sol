contract SaveData{
    constructor() public {
    }
    mapping (string=>string) data;
    function setStr(string key, string value) public payable {
        data[key] = value;
    }
    function getStr(string key) public view returns(string){
        return data[key];
    }
}