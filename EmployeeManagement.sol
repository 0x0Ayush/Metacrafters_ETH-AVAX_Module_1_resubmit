// SPDX-License-Identifier: MIT
// Made by Ayush Garg // Punk007 
// timestamp : 7:17:2023 | 3:05:00

pragma solidity ^0.8.0;

contract EmployeeManagementContract {
    struct Employee {
        uint256 id;
        string name;
        uint256 salary;
    }
    
    mapping(uint256 => Employee) public employees;
    uint256 public totalEmployees;
    
    constructor() {
        totalEmployees = 0;
    }
    
    function addEmployee(uint256 id, string memory name, uint256 salary) public {
        // require statement to check if employee ID is unique
        require(employees[id].id == 0, "Employee ID already exists");
        
        // assert statement to ensure the salary is within a valid range
        assert(salary > 0 && salary <= 100000);          // salary cant be greater then 100k
        
        employees[id] = Employee(id, name, salary);
        totalEmployees++;
    }
    
    function updateEmployeeSalary(uint256 id, uint256 newSalary) public {
        // require statement to check if employee exists
        require(employees[id].id != 0, "Employee does not exist");
        
        // assert statement to ensure the new salary is not less than the current salary
        assert(newSalary >= employees[id].salary);
        
        employees[id].salary = newSalary;
    }
    
    function removeEmployee(uint256 id) public {
        // require statement to check if employee exists
        require(employees[id].id != 0, "Employee does not exist");
        
        // Custom condition triggering a revert
        if (employees[id].salary > 50000) {
            revert("Cannot remove employees with a salary greater than 50000");
        }
        
        delete employees[id];
        totalEmployees--;
    }
}
