package com.bridgelabzIOFile;

import java.io.IOException;

public class EmployeePayrollService {
    public void  run() throws IOException {
        System.out.println("Employee payroll service");
        EmployeePayrollData emp = new EmployeePayrollData();
        emp.readFromConsole();
        System.out.println("Employee Details:");
        System.out.println(emp.getId());
        System.out.println(emp.getName());
        System.out.println(emp.getSalary());
        emp.writeToConsole();
    }
}
