package br.com.fiap;

public class Caminhao extends Veiculo{

    private double cargaMaxima;
    private int numeroEixos;

    public Caminhao(double cargaMaxima, int numeroEixos) {
        this.cargaMaxima = cargaMaxima;
        this.numeroEixos = numeroEixos;
    }

    public Caminhao(String marca, String modelo, int ano, double preco, double cargaMaxima, int numeroEixos) {
        super(marca, modelo, ano, preco);
        this.cargaMaxima = cargaMaxima;
        this.numeroEixos = numeroEixos;
    }

    public double getCargaMaxima() {
        return cargaMaxima;
    }

    public void setCargaMaxima(double cargaMaxima) {
        this.cargaMaxima = cargaMaxima;
    }

    public int getNumeroEixos() {
        return numeroEixos;
    }

    public void setNumeroEixos(int numeroEixos) {
        this.numeroEixos = numeroEixos;
    }

    @Override
    public String toString() {
        return "Caminhao{" +
                "cargaMaxima=" + cargaMaxima +
                ", numeroEixos=" + numeroEixos +
                '}';
    }
}
