public class Triangle extends GeometricFigure
{
    private double area;
    public Triangle(int h, int w, String f)
    {
        super(h, w, f);
    }

    public double figureArea(int w, int h)
    {
        area = (double)(w * h / 2);
        return area;
    }
}
