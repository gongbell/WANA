contract BdpEntryPoint {
	address public ownerAddress;
	address public managerAddress;
	address[16] public contracts;
	bool public paused = false;
	bool public setupCompleted = false;
	bytes8 public version;
	function func() payable external {
		address _impl = contracts[1];
		require(_impl != address(0));
		bytes memory data = msg.data;
		assembly {
			let result := delegatecall(gas(), _impl, add(data, 0x20), mload(data), 0, 0)
			let size := returndatasize()
			let ptr := mload(0x40)
			returndatacopy(ptr, 0, size)
			switch result
			case 0 { revert(ptr, size) }
			default { return(ptr, size) }
		}
	}

	constructor()  {
		ownerAddress = msg.sender;
		managerAddress = msg.sender;
		setupCompleted = true;
	}
}