public class Square extends GeometricFigure
{
    private double area;
    public Square(int h, int w, String f)
    {
        super(h, w, f);
    }

    public double figureArea(int w, int h)
    {
        area = (double)(w * h);
        return area;
    }
}
