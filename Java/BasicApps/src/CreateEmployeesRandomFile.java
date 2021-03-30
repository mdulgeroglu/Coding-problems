import java.nio.file.*;
import java.io.*;
import java.nio.channels.FileChannel;
import java.nio.ByteBuffer;
import static java.nio.file.StandardOpenOption.*;
import java.util.Scanner;

public class CreateEmployeesRandomFile {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Path file = Paths.get("C:\\Java\\ch13\\RandomEmployees.txt");
        String s = "000,      ,00.00" + System.getProperty("line.separator");
        final int RECSIZE = s.length();
        FileChannel fc = null;
        String delimeter = ",";
        String idString;
        int id;
        String name;
        String payRate;
        final String QUIT = "999";

        try {
            fc = (FileChannel)Files.newByteChannel(file, READ, WRITE);
            System.out.println("Enter employee ID # >> ");
            idString = input.nextLine();
            while (!(idString.equals(QUIT))) {
                id = Integer.parseInt(idString);
                System.out.println("Enter name >> ");
                name = input.nextLine();
                System.out.println("Enter pay >> ");
                payRate = input.nextLine();
                s = idString + delimeter + name + delimeter + payRate + System.getProperty("line.separator");
                byte[] data = s.getBytes();
                ByteBuffer buffer = ByteBuffer.wrap(data);
                fc.position(id * RECSIZE);
                fc.write(buffer);
                System.out.println("Enter next ID num or " + QUIT + " to quit >> ");
                idString = input.nextLine();
            }

        } //end try @21
        catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
}
