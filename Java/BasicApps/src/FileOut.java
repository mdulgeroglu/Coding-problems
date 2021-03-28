// 13.19
import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.nio.file.*;
import static java.nio.file.StandardOpenOption.*;
public class FileOut {
    public static void main(String[] args) {
        Path file = Paths.get("C:\\Java\\ch13\\Grades.txt");
        String s = "ABCccD";
        byte[] data = s.getBytes();

        OutputStream output = null;
        try {
            output = new BufferedOutputStream(Files.newOutputStream(file, CREATE));
            output.write(data);
            output.flush();
            output.close();
        }
        catch (Exception e) {
            System.out.println("Message: " + e);
        }
    }
}
