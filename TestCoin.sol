pragma solidity ^0.4.0;

contract ERC20 {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract TestCoin is ERC20 {
    
    string public name;
    string public symbol;
    uint public totalSupply;
    mapping (address=>uint) public balances;
    mapping (address=>mapping (address=>uint)) public _allowance;
    
    function TestCoin(string _name, string _symbol, uint _totalSupply) public {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
    }
    
    function totalSupply() public constant returns(uint) {
        return totalSupply;
    }
    
    function getPrice(uint newPrice) public returns(uint) {
        return newPrice;
    }
    
    function balanceOf(address tokenOwner) public constant returns (uint _balance) {
        return balances[tokenOwner];
    }
        
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
        return _allowance[tokenOwner][spender];
    }
    
    function transfer(address to, uint tokens) public returns (bool success) {
        require(to != address(0));
        require(totalSupply != tokens);
        require(tokens > 0);
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        Transfer(msg.sender, to, tokens);
        return true;
    }
    
    function approve(address spender, uint tokens) public returns (bool success) {
        require(spender != address(0));
        _allowance[msg.sender][spender] = tokens;
    }
    
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        require(from != address(0));
        require(to != address(0));
        require(totalSupply != tokens);
        require(tokens > 0);
        balances[from] -= tokens;
        balances[to] += tokens;
        Transfer(from, to, tokens);
        return true;
    }

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    
}
