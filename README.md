# Employee Management Contract

This Solidity contract manages employee information and provides functions for adding, updating, and removing employees.

## Contract Details

- **Contract name:** EmployeeManagementContract
- **Compiler version:** pragma solidity ^0.8.0

## Error Handling
The contract utilizes three different error handling mechanisms:

`assert` : The `assert` function is used to validate internal errors and enforce conditions that should never be false. In this contract, it is used to ensure that the salary provided is within a valid range. as : ```assert(salary > 0 && salary <= 100000);```

`revert `: The `revert` statement is used to revert the changes made in the contract and return an error message. In this contract, it is used to prevent the removal of employees with a salary greater than 50000. For example: 
```solidity
if (employees[id].salary > 50000) {
    revert("Cannot remove employees with a salary greater than 50000");
}
```
`require` : The `require` statement is used to validate conditions and revert the transaction if the condition is not met. In this contract, it is used to ensure that certain conditions are satisfied before executing a function. For example: ``` require(employees[id].id != 0, "Employee does not exist"); ```

## Struct

The contract defines a struct called `Employee` with the following properties:

- `id` (uint256): Employee ID
- `name` (string): Employee name
- `salary` (uint256): Employee salary

## State Variables

- `employees` (mapping(uint256 => Employee)): Maps employee IDs to their corresponding Employee struct.
- `totalEmployees` (uint256): Total count of employees in the contract.

## Constructor

The contract includes a constructor that initializes the `totalEmployees` variable to 0.

## Functions

### `addEmployee`

```solidity
function addEmployee(uint256 id, string memory name, uint256 salary) public
```

This function adds a new employee to the contract.

Parameters:

`id (uint256):` Employee ID.
`name (string):` Employee name.
`salary (uint256):` Employee salary.

## Requirements:

The employee ID must be unique.
The salary must be greater than 0 and less than or equal to 100000.

updateEmployeeSalary : ``` function updateEmployeeSalary(uint256 id, uint256 newSalary) public ```

This function updates the salary of an existing employee.

## Parameters:

`id (uint256):` Employee ID.
`newSalary (uint256):` New employee salary.

removeEmployee : ``` function removeEmployee(uint256 id) public ```

This function removes an employee from the contract.

## Parameters:

`id (uint256):` Employee ID.

