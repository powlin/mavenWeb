package com.yaoyan.util;

public class CalculationUtil {

    public static long mult(double source) {

        Double d = source * 1000;
        return d.longValue();
    }

    public static double divi(long source) {

        double l = (double) source / 1000;
        return l;

    }

    public static void main(String[] args) {

        double d = (double) 676767699999999999l * 1000;
        System.out.println(d);
    }
}
