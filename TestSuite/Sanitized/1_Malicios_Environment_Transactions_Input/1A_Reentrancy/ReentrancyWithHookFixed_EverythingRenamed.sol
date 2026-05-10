// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C11A181 {

    mapping (address => uint256) public balanceOf;
    string public symbol;
    mapping (address => mapping(address => uint256)) public allowances;
    uint public tokenPrice;
    uint public totalSupply;
    uint public availableSupply;
    address private owner;

    event Transfer(address indexed _from,
                   address indexed _to,
                   uint256 _value);
    event Approval(address indexed _owner,
                   address indexed _spender,
                   uint256 _value);

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor (uint _tokenPrice, uint _totalSupply, string memory _symbol) {
        tokenPrice = _tokenPrice;
        totalSupply = _totalSupply;
        availableSupply = totalSupply;
        owner = msg.sender;
        symbol = _symbol;
    }


    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(_value <= balanceOf[_from], "not enough balance");
        require(_value <= allowances[_from][msg.sender], "not allowed to transfer so much");

        C11A183 m = C11A183(_from);
        m.tokensToSend(msg.sender, _from, _to, _value, "", "");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowances[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

    function allowance(address _owner, address _spender)
        public
        view
        returns(uint256 remaining)
    {
        return allowances[_owner][_spender];
    }

    function transfer(address _to, uint256 _value)
        external
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function buyToken(uint noOfTokensToBuy)
        public
        payable
    {
        require(noOfTokensToBuy > 0);
        require(noOfTokensToBuy <= availableSupply);
        require(msg.value >= noOfTokensToBuy * tokenPrice);
        balanceOf[msg.sender] = noOfTokensToBuy;
        availableSupply -= noOfTokensToBuy;
        bool success = payable(msg.sender).send(msg.value - noOfTokensToBuy * tokenPrice);
        if (!success) revert();
    }

    function withdrawEth() 
        onlyOwner 
        external 
    {
        payable(owner).transfer(address(this).balance);
    }
}

contract C11A182 {

    mapping (address => uint) tokenBalance;
    C11A181 public tokenContract;

    constructor(address _tokenContract) {
        tokenContract = C11A181(_tokenContract);
    }

    function deposit(uint _tokensToExchange) 
        external 
    {
        uint allowance = tokenContract.allowance(msg.sender, address(this));
        if (allowance >= _tokensToExchange) {
            uint currentBal = tokenBalance[msg.sender];
            tokenBalance[msg.sender] = currentBal + _tokensToExchange;
            tokenContract.transferFrom(msg.sender, address(this), _tokensToExchange);
        } else revert("allowance is less than requested tokens");
    }

    function withdraw(uint _tokensToWithdraw) 
        external 
    {
        require(
            _tokensToWithdraw <= tokenBalance[msg.sender], 
            "not enough tokens to withdraw"
        );
        tokenBalance[msg.sender] -= _tokensToWithdraw;
        tokenContract.transfer(msg.sender, _tokensToWithdraw);
    }

    function tokenBalanceOf(address addr) 
        external 
        view 
        returns(uint) 
    {
        return tokenBalance[addr];
    }
}

contract C11A183 {
    
    C11A181 private token;
    C11A182 private depositProvider;
    address private owner;
    uint private called;
    uint private limit = 2;

    constructor(address _depositContract, address _tokenContract) {
        token = C11A181(_tokenContract);
        depositProvider = C11A182(_depositContract);
        owner = msg.sender;
        token.approve(address(depositProvider), limit * 10);
    }

    function initialDeposit() 
        public 
    {
        require(msg.sender == owner, "Owner only");
        called = 1; 
        depositProvider.deposit(9);
    }

    function deposit(uint _value) 
        public 
    {
        require(msg.sender == owner, "Owner only");
        called = 0;
        depositProvider.deposit(_value);
    }

    function tokensToSend(address, address, address, uint256, bytes calldata, bytes calldata) 
        external 
    {
        require(
            msg.sender == address(token), 
            "Hook is called by C11A181 only"
        );
        called += 1;
        if(called < limit) {
            depositProvider.withdraw(9);
            depositProvider.deposit(1); 
        }
    }
}