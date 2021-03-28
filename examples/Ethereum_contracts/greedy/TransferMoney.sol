contract TransferMoney {

  mapping (address => uint) bankAccountMoney;

  // 取得合約餘額
  function contractMoneyBalance()  public returns(uint){
    return address(this).balance;
  }

  // 取得帳戶餘額
  function addressMoneyBalance()  public returns(uint){
    return bankAccountMoney[msg.sender];
  }

  // 存款到合約
  function depositMoney(string memory message) payable public{
    require(msg.value >= 0);

    if (bankAccountMoney[msg.sender] == 0) {
      // wei
      bankAccountMoney[msg.sender] = msg.value;
    } else {
      bankAccountMoney[msg.sender] = bankAccountMoney[msg.sender] + msg.value;
    }

  }


  



}