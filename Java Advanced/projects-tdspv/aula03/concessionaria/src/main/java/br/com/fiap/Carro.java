package br.com.fiap;

public class Carro extends Veiculo{

    private int numeroPortas;
    private String cambio;
    private String combustivel;

    public Carro(int numeroPortas, String cambio, String combustivel) {
        this.numeroPortas = numeroPortas;
        this.cambio = cambio;
        this.combustivel = combustivel;
    }

    public Carro(String marca, String modelo, int ano, double preco, int numeroPortas, String cambio, String combustivel) {
        super(marca, modelo, ano, preco);
        this.numeroPortas = numeroPortas;
        this.cambio = cambio;
        this.combustivel = combustivel;
    }

    public int getNumeroPortas() {
        return numeroPortas;
    }

    public void setNumeroPortas(int numeroPortas) {
        this.numeroPortas = numeroPortas;
    }

    public String getCambio() {
        return cambio;
    }

    public void setCambio(String cambio) {
        this.cambio = cambio;
    }

    public String getCombustivel() {
        return combustivel;
    }

    public void setCombustivel(String combustivel) {
        this.combustivel = combustivel;
    }

    @Override
    public String toString() {
        return "Carro{" +
                "numeroPortas=" + numeroPortas +
                ", cambio='" + cambio + '\'' +
                ", combustivel='" + combustivel + '\'' +
                '}';
    }
}
