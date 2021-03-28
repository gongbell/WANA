contract payrollSystem{
    
    address company;
    
    struct employee {
        bool active;
        bool paid;
        uint salary;
        uint balance;
    }
    
    event Transfer(address indexed from, address indexed to,uint amount);
    
    mapping(address => employee) employeeMapper; 
    address[] employeeList;
    
    //constructor of the contract
    constructor(){
        company = msg.sender;
    }
    
    //to add an employee to the company&#39;s list of employees
    function addEmployee(address newEmployee, uint salary) public {
        employee memory _employee = employeeMapper[newEmployee];
        _employee.active = true;
        _employee.salary = salary;
        _employee.balance = 0;
        employeeList.push(newEmployee);
    }
    
    //if at all the employee leaves the company, we can use this function to turn him inactive
    function removeEmployee(address _address) public {
        employeeMapper[_address].active = false;
    }
    
    //this function can be used to give a raise in the salary of an employee
    function updateSalary(address _address, uint newSalary) public {
        employeeMapper[_address].salary = newSalary;
    }
    
    function listOutEmployees() public returns(address[] memory){
        return employeeList;
    }
    
    //deposit the initial amount a company would start with. It can be updated as the investment grows
    function depositInvestment() public payable{
     
    }
    
    function totalSupply() public  returns(uint){
       return address(this).balance;
    }
    
    //validate whether the employee is still working in the company
    function isActive(address check) public returns(bool){
        return employeeMapper[check].active;
    }
    

    //this sends the salary to the employee account    
    function transfer(address _address) private{
       if(employeeMapper[_address].salary < address(this).balance){
           transferLog(_address);
           employeeMapper[_address].paid = true;
           employeeMapper[_address].balance += employeeMapper[_address].salary;
       }else{
           employeeMapper[_address].paid = false;
       }
    }
    
    function transferLog(address _address) private{
        emit Transfer(msg.sender,_address,employeeMapper[_address].salary);
    }
    
    //first we check whether the employee is working in the company and then check for double spend
    function sendSalary(address sendTo) public {
        if(isActive(sendTo) && !employeeMapper[sendTo].paid){
            transfer(sendTo);
        }
    } 
    
    
    function balanceOf(address empAd) public  returns(uint){
        return employeeMapper[empAd].balance;
    }
    
}