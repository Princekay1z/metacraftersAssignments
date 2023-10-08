// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


// deployed to 0x4e4e9BE7AC99FA68f3BBE972f0C7ec0Fb04681Aa

interface IERC20 {
    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Functions
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}



contract DEGEN is IERC20 {
    

    uint public totalSupply; 
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowances;


    function name() external pure returns (string memory) {
        return "DEGEN";
    }

    function symbol() external pure returns (string memory) {
        return "DGN"; 
    } 

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    function transfer(address recipient, uint256 amount) external returns (bool) {
        require(balances[msg.sender] >= amount, "Your DEGENcoins are not enough to initiate transaction");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address _owner, address spender) external view returns (uint256){
        return allowances[_owner][spender];
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool){
       require(allowances[sender][msg.sender] >= amount, "the owner has not allowed you to spend the amount"); 
       require(balances[sender] >= amount, "Insufficient tokens are present in the address");
       allowances[sender][msg.sender] -= amount;
       balances[sender] -= amount;
       balances[recipient] += amount;
       emit Transfer(sender, recipient, amount);
       return true;
    }
    address public owner;
    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the ower");
        _;
    }

    function mint(address recipient, uint amount) public onlyOwner { 
        balances[recipient]  += amount;
        totalSupply += amount; 
    }

    function burn(uint amount) public {
        require(balances[msg.sender] >= amount, "balance amount is insuffient");
        balances[msg.sender] -= amount;
        totalSupply -= amount;
    }

    // store
    uint public LexusRs350price = 350000; 
    uint public RangeRoverSportprice = 400000;

    mapping(address => uint) public numberofLexusRs350Owned;
    mapping(address => uint) public numberofRangeRoverSportpriceOwned;

    function purchaseLexusRs350() public {
        require(balances[msg.sender] >= LexusRs350price, "Insufficient balance");
        numberofLexusRs350Owned[msg.sender] += 1;
        burn(LexusRs350price);

    }

    function purchaseRangeRoverSport() public {
       require(balances[msg.sender] >= RangeRoverSportprice, "Insufficient balance"); 
       numberofRangeRoverSportpriceOwned[msg.sender] += 1;
        burn(RangeRoverSportprice);
    }

}


