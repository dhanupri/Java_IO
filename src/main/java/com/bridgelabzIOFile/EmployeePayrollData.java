package com.bridgelabzIOFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class EmployeePayrollData {
    private int id;
    private String name;
    private long salary;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public long getSalary() {
        return salary;
    }
    public void setSalary(long salary) {
        this.salary = salary;
    }
    public void readFromConsole() throws IOException {
        BufferedReader reader=new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Enter the Employee ID: ");
        id=Integer.parseInt(reader.readLine());
        System.out.println("Enter the Employee Name");
        name=reader.readLine();
        System.out.println("Enter the Employee Salary:");
        salary= Long.parseLong(reader.readLine());
    }
    public void writeToConsole() throws IOException{
        System.out.println("Employee id:"+id);
        System.out.println("Employee name:"+name);
        System.out.println("Employee salary:"+salary);
        System.out.println();
    }
}
