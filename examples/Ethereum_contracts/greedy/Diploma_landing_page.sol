contract Diploma_landing_page {
 address public owner;
 string htmlhash;
 string LandingPageHash;
 
 constructor() {
  owner = msg.sender;
 }
 
 function setHTML(string memory _htmlhash) payable public {
  htmlhash = _htmlhash;
 }
  function setLandingPage(string memory _LandingPageHash) payable public {
  LandingPageHash = _LandingPageHash;
 }
  function renderLandingHash() public view returns (string memory) {
   return LandingPageHash;
 }
 
 function renderWeb() public view returns (string memory) {
   return htmlhash;
 }
}