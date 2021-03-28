

contract MillionEther {

    address private admin;

    // Users
    uint private numUsers = 0;
    struct User {
        address referal;
        uint8 handshakes;
        uint balance;
        uint32 activationTime;
        bool banned;
        uint userID;
        bool refunded;
        uint investments;
    }
    mapping(address => User) private users;
    mapping(uint => address) private userAddrs;

    // Blocks. Blocks are 10x10 pixel areas. There are 10 000 blocks.
    uint16 private blocksSold = 0;
    uint private numNewStatus = 0;
    struct Block {
        address landlord;
        uint imageID;
        uint sellPrice;
    }
    Block[101][101] private blocks; 

    // Images
    uint private numImages = 0;
    struct Image {
        uint8 fromX;
        uint8 fromY;
        uint8 toX;
        uint8 toY;
        bytes32 imageSourceUrl;
        bytes32 adUrl;
        bytes32 adText;
    }
    mapping(uint => Image) private images;

    // Contract settings and security
    uint public charityBalance = 0;
    address public charityAddress;
    uint8 private refund_percent = 0;
    uint private totalWeiInvested = 0; //1 024 000 Ether max
    bool private setting_stopped = false;
    bool private setting_refundMode = false;
    uint32 private setting_delay = 3600;
    uint private setting_imagePlacementPriceInWei = 0;

    // Events
    event NewUser(uint ID, address newUser, address invitedBy, uint32 activationTime);
    event NewAreaStatus (uint ID, uint8 fromX, uint8 fromY, uint8 toX, uint8 toY, uint price);
    event NewImage(uint ID, uint8 fromX, uint8 fromY, uint8 toX, uint8 toY, bytes32 imageSourceUrl, bytes32 adUrl, bytes32 adText);


// ** INITIALIZE ** //

    constructor () {
        admin = msg.sender;
        users[admin].referal = admin;
        users[admin].handshakes = 0;
        users[admin].activationTime = uint32(block.timestamp);
        users[admin].userID = 0;
        userAddrs[0] = admin;
        userAddrs[numUsers] = admin;
    }


// ** USER SIGN IN ** //

    function getActivationTime (uint _currentLevel, uint _setting_delay) private  returns (uint32) {
        return uint32(block.timestamp + _setting_delay * (2**(_currentLevel-1)));
    }

    function signIn (address referal) 
        public 
        returns (uint) 
    {
        numUsers++;
        // get user's referral handshakes and increase by one
        uint8 currentLevel = users[referal].handshakes + 1;
        users[msg.sender].referal = referal;
        users[msg.sender].handshakes = currentLevel;
        // 1,2,4,8,16,32,64 hours for activation depending on number of handshakes (if setting delay = 1 hour)
        users[msg.sender].activationTime = getActivationTime (currentLevel, setting_delay); 
        users[msg.sender].refunded = false;
        users[msg.sender].userID = numUsers;
        userAddrs[numUsers] = msg.sender;
        emit NewUser(numUsers, msg.sender, referal, users[msg.sender].activationTime);
        return numUsers;
    }


 // ** BUY AND SELL BLOCKS ** //

    function getBlockPrice (uint8 fromX, uint8 fromY, uint blocksSold) private  returns (uint) {
        if (blocks[fromX][fromY].landlord == address(0x0)) { 
                // when buying at initial sale price doubles every 1000 blocks sold
                return 1 ether * (2 ** (blocksSold/1000));
            } else {
                // when the block is already bought and landlord have set a sell price
                return blocks[fromX][fromY].sellPrice;
            }
    }

    function buyBlock (uint8 x, uint8 y) 
        private  
        returns (uint)
    {
        uint blockPrice;
        blockPrice = getBlockPrice(x, y, blocksSold);
        // Buy at initial sale
        if (blocks[x][y].landlord == address(0x0)) {
            blocksSold += 1;  
            totalWeiInvested += blockPrice;
        // Buy from current landlord and pay him or her the blockPrice
        } else {
            users[blocks[x][y].landlord].balance += blockPrice;  
        }
        blocks[x][y].landlord = msg.sender;
        return blockPrice;
    }

    //Mark block for sale (set a sell price)
    function sellBlock (uint8 x, uint8 y, uint sellPrice) 
        private
    {
        blocks[x][y].sellPrice = sellPrice;
    }

// ** ASSIGNING IMAGES ** //
    
    function chargeForImagePlacement () private {
        if (users[msg.sender].balance + msg.value < users[msg.sender].balance) revert(); //check for overflow`
        uint buyerBalance = users[msg.sender].balance + msg.value;
        if (buyerBalance < setting_imagePlacementPriceInWei) revert();
        buyerBalance -= setting_imagePlacementPriceInWei;
        users[admin].balance += setting_imagePlacementPriceInWei;
        users[msg.sender].balance = buyerBalance;
    }

    // every block has its own image id assigned
    function assignImageID (uint8 x, uint8 y, uint _imageID) 
        private
    {
        blocks[x][y].imageID = _imageID;
    }

    // charity is the same type of user as everyone else
    function goesToCharity (uint amount) private {
        // if no charityAddress is set yet funds go to charityBalance (see further)
        if (charityAddress == address(0x0)) {
            charityBalance += amount;
        } else {
            users[charityAddress].balance += amount;
        }
    }

    // withdraw funds (no external calls for safety)
    function withdrawAll () 
        public
    {
        uint withdrawAmount = users[msg.sender].balance;
        users[msg.sender].balance = 0;
        msg.sender.send(withdrawAmount);
        users[msg.sender].balance = withdrawAmount;
    }


 // ** GET INFO ( FUNCTIONS)** //

    //USERS
    function getUserInfo (address userAddress) public  returns (
        address referal,
        uint8 handshakes,
        uint balance,
        uint32 activationTime,
        bool banned,
        uint userID,
        bool refunded,
        uint investments
    ) {
        referal = users[userAddress].referal; 
        handshakes = users[userAddress].handshakes; 
        balance = users[userAddress].balance; 
        activationTime = users[userAddress].activationTime; 
        banned = users[userAddress].banned; 
        userID = users[userAddress].userID;
        refunded = users[userAddress].refunded; 
        investments = users[userAddress].investments;
    }

    function getUserAddressByID (uint userID) 
        public  returns (address userAddress) 
    {
        return userAddrs[userID];
    }
    
    function getMyInfo() 
        public  returns(uint balance, uint32 activationTime) 
    {   
        return (users[msg.sender].balance, users[msg.sender].activationTime);
    }

    //BLOCKS
    function getBlockInfo(uint8 x, uint8 y) 
        public  returns (address landlord, uint imageID, uint sellPrice) 
    {
        return (blocks[x][y].landlord, blocks[x][y].imageID, blocks[x][y].sellPrice);
    }

    //IMAGES
    function getImageInfo(uint imageID) 
        public  returns (uint8 fromX, uint8 fromY, uint8 toX, uint8 toY, bytes32 imageSourceUrl, bytes32 adUrl, bytes32 adText)
    {
        Image memory i = images[imageID];
        return (i.fromX, i.fromY, i.toX, i.toY, i.imageSourceUrl, i.adUrl, i.adText);
    }

    //CONTRACT STATE
    function getStateInfo () public  returns (
        uint _numUsers, 
        uint16 _blocksSold, 
        uint _totalWeiInvested, 
        uint _numImages, 
        uint _setting_imagePlacementPriceInWei,
        uint _numNewStatus,
        uint32 _setting_delay
    ){
        return (numUsers, blocksSold, totalWeiInvested, numImages, setting_imagePlacementPriceInWei, numNewStatus, setting_delay);
    }


// ** ADMIN ** //

    function adminContractSecurity (address violator, bool banViolator, bool pauseContract, bool refundInvestments)
        public 
    {
        //freeze/unfreeze user
        if (violator != address(0x0)) {
            users[violator].banned = banViolator;
        }
        //pause/resume contract 
        setting_stopped = pauseContract;

        //terminate contract, refund investments
        if (refundInvestments) {
            setting_refundMode = refundInvestments;
            refund_percent = uint8((address(this).balance*100)/totalWeiInvested);
        }
    }

    function adminContractSettings (uint32 newDelayInSeconds, address newCharityAddress, uint newImagePlacementPriceInWei)
        public 
    {   
        // setting_delay affects user activation time.
        if (newDelayInSeconds > 0) setting_delay = newDelayInSeconds;
        // when the charityAddress is set charityBalance immediately transfered to it's balance 
        if (newCharityAddress != address(0x0)) {
            if (users[newCharityAddress].referal == address(0x0)) revert();
            charityAddress = newCharityAddress;
            users[charityAddress].balance += charityBalance;
            charityBalance = 0;
        }
        // at deploy is set to 0, but may be needed to support off-chain infrastructure
        setting_imagePlacementPriceInWei = newImagePlacementPriceInWei;
    }

    // escape path - withdraw funds at emergency.
    function emergencyRefund () 
        public 
    {
        if (!users[msg.sender].refunded) {
            uint totalInvested = users[msg.sender].investments;
            uint availableForRefund = (totalInvested*refund_percent)/100;
            users[msg.sender].investments -= availableForRefund;
            users[msg.sender].refunded = true;
            if (!msg.sender.send(availableForRefund)) {
                users[msg.sender].investments = totalInvested;
                users[msg.sender].refunded = false;
            }
        }
    }
}