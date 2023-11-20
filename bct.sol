//SPDX-License-Identifier: Unlicensed
pragma solidity >=0.8.0;
contract StudentData
 {
    struct Student 
    {
        uint256 rollNumber;
        string name;
        uint8 age;
    }

    //array name students having structure type student 
    Student[] public students_a;

    // Function to add a new student
    function addStudent(uint256 _rollNumber, string memory _name, uint8 _age) 
        public 
        {
            students_a.push(Student(_rollNumber, _name, _age));
        }

    // Function to get the details of a specific student by roll number //string
     function getStudentByRollNumber(uint256 rollNumber) public view returns (Student memory) {
        for (uint256 i = 0; i < students_a.length; i++) {
            if (students_a[i].rollNumber == rollNumber) {
                return students_a[i];
            }
        }
        revert("Student not found");
    }
    // Function to get the total number of students
    function getTotalStudents() public view returns (uint256) 
    {
        return students_a.length;
    }

  
    // Fallback function to add a default student if a transaction is sent without a specific function
    fallback() external {
        addStudent(1, "Default Student", 20);
    }
}
