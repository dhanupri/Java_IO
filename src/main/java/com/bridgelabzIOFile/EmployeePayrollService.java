package com.bridgelabzIOFile;
import java.io.*;
import java.nio.file.*;

public class EmployeePayrollService {
    //read the file
    public static void readFromConsole() throws IOException {
        BufferedReader reader=new BufferedReader(new InputStreamReader(System.in));
        FileWriter writer=new FileWriter("E:\\IOStreamProject\\src\\main\\java\\com\\bridgelabzIOFile\\employee.txt");
        for (int i=0;i<4;i++) {
            System.out.println("Enter the Employee ID: ");
            int id = Integer.parseInt(reader.readLine());
            System.out.println("Enter the Employee Name");
            String name = reader.readLine();
            System.out.println("Enter the Employee Salary:");
            long salary = Long.parseLong(reader.readLine());
            //create an employeePayroll object
            EmployeePayrollData emp = new EmployeePayrollData(id, name, salary);
            write_employeeToFile(emp,writer);

        }
        writer.close();
    }
    //write the file
    public static void write_employeeToFile(EmployeePayrollData employeePayrollData,FileWriter writer) throws IOException {
            writer.write("ID     : "+employeePayrollData.getId()+"\t");
            writer.write("Name   : "+employeePayrollData.getName()+"\t");
            writer.write("Salary : "+employeePayrollData.getSalary()+"\n");
    }
    //check if file exist
    public static boolean checkfileExist(String filename){
        File file=new File(filename);
        return file.exists();
    }
    //delete file and check if file does not exist
    public static boolean deteleFile(String filename){
        File file=new File(filename);
        if(file.exists()){
            return  file.delete() && !file.exists();
        }
        return false;
    }
    //create directory
    public static boolean createDirectory(String path){
        File directory=new File(path);
        return directory.mkdir();
    }
    //create empty file
    public static boolean createEmptyFile(String filepath){
        File file=new File(filepath);
        try {
            return file.createNewFile();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static void listFilesAndDirectories(String path,String extension){
        File directory=new File(path);
        File[] files=directory.listFiles();
        if(files!=null){
            for(File file:files){
                if(file.isDirectory()){
                    System.out.println("Drectory:"+file.getName());
                }
                else {
                    System.out.println("File:"+file.getName());
                    if(file.getName().endsWith(extension)){
                        System.out.println("file with extension"+extension+" "+file.getName());
                    }
                }
            }

        }
    }
    public static void watchDirectory(String directory) throws IOException {
        try{
            Path path=Paths.get(directory);
            WatchService watchService=FileSystems.getDefault().newWatchService();
            path.register(watchService,StandardWatchEventKinds.ENTRY_CREATE,StandardWatchEventKinds.ENTRY_DELETE,StandardWatchEventKinds.ENTRY_MODIFY);
            System.out.println("Watching directory:"+directory);
            while (true){
                WatchKey key=watchService.take();
                for (WatchEvent<?> event:key.pollEvents()){
                    System.out.println("Event kind:"+event.kind()+", File affected:"+event.context());
                }
                boolean reset=key.reset();
                if(!reset ){
                    break;
                }
            }
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
    public static void countEntries(String filename){
        try {
            Path path=Paths.get(filename);
            long linecount=Files.lines(path).count();
            System.out.println("Number of entries in file:"+linecount);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) throws IOException {
        EmployeePayrollService.readFromConsole();
        WatchDirectory watchDirectory=new WatchDirectory(Paths.get("E:\\IOStreamProject\\src\\main\\java"));
        //write employee details to a file
        String filepath="E:\\IOStreamProject\\src\\main\\java\\com\\bridgelabzIOFile\\employee1.txt";
        Files.createFile(Paths.get(filepath));
        //check if file exists
        System.out.println("File exist:" + checkfileExist(filepath));
        //delete file and check if file does not exist
        System.out.println("File deleted:" + deteleFile(filepath));
        //create directory
        String path = "E:\\IOStreamProject\\src\\main\\java\\com\\bridgelabzIOFile\\employee_dir";
        System.out.println("Directory created: " + createDirectory(path));
        //create empty file
        System.out.println("File created:" + createEmptyFile("empty_file.txt"));
        // List files, directories, and files with a specific extension
        listFilesAndDirectories(".", ".txt");
        watchDirectory.processEvents();


    }

}
