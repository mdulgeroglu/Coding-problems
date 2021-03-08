public abstract class GeometricFigure {
    
    // init protected vars
    protected int height;
    protected int width;
    protected String figure;
    
    // constructor
    public GeometricFigure(int h, int w, String f) {
        height = h;
        width = w;
        figure = f;
    }
    
    public int getHeight() {
        return height;
    }
    
    public int getWidth() {
        return width;
    }
    
    public String getFigure() {
        return figure;
    }
    
    public abstract double figureArea(int w, int h);
}
