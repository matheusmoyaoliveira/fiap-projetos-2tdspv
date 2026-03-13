package br.com.fiap;

public class Moto extends Veiculo{

    private int cilindradas;
    private boolean partidaEletrica;

    public Moto(int cilindradas, boolean partidaEletrica) {
        this.cilindradas = cilindradas;
        this.partidaEletrica = partidaEletrica;
    }

    public Moto(String marca, String modelo, int ano, double preco, int cilindradas, boolean partidaEletrica) {
        super(marca, modelo, ano, preco);
        this.cilindradas = cilindradas;
        this.partidaEletrica = partidaEletrica;
    }

    public int getCilindradas() {
        return cilindradas;
    }

    public void setCilindradas(int cilindradas) {
        this.cilindradas = cilindradas;
    }

    public boolean isPartidaEletrica() {
        return partidaEletrica;
    }

    public void setPartidaEletrica(boolean partidaEletrica) {
        this.partidaEletrica = partidaEletrica;
    }

    @Override
    public String toString() {
        return "Moto{" +
                "cilindradas=" + cilindradas +
                ", partidaEletrica=" + partidaEletrica +
                '}';
    }
}
