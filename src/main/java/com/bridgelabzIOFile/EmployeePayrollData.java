package com.bridgelabzIOFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class EmployeePayrollData {
   int id;
   String name;
    long salary;
    EmployeePayrollData(){
        id=0;
        name="";
        salary=0;
    }
    EmployeePayrollData(int id,String name,long salary){
        this.id=id;
        this.name=name;
        this.salary=salary;
    }
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
}
