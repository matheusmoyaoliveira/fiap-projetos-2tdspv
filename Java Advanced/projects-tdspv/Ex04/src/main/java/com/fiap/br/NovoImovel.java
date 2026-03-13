package com.fiap.br;

public class NovoImovel extends Imovel {

    private double adicional;

    public NovoImovel(String endereco, double preco, double adicional) {
        super(endereco, preco);
        this.adicional = adicional;
    }

    public double getAdicional() {
        return adicional;
    }

    public void setAdicional(double adicional) {
        this.adicional = adicional;
    }

    public double getPrecoFinal() {
        return preco + adicional;
    }

    @Override
    public void imprimir() {
        super.imprimir();
        System.out.println("Adicional: R$ " + adicional);
        System.out.println("Preço Final: R$ " + getPrecoFinal());
    }
}
