// running JFrame with JMyFrame6 extending it
// expected out: two JFrames from the "JFrame" class extended by "JMyFrame6" class.
public class CreateTwoJMyFrameObjects {
    public static void main(String[] args) {
        JMyFrame6 myFirstFrame = new JMyFrame6();
        JMyFrame6 mySecondFrame = new JMyFrame6();

        mySecondFrame.setBounds(100,100,300,500); // moves one frame 100px down and to the right
    }
}
