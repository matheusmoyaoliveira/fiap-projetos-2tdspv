package org.example;

public class Apdex {

    public static double calcular(int s, int t, int a) {

        double conta1 = s + (t/2);
        double resultado = conta1 / a;

        return resultado;
    }
}
