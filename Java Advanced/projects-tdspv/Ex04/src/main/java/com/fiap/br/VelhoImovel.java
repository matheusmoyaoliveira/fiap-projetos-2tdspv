package com.fiap.br;

public class VelhoImovel extends Imovel{

    private double desconto;

    public VelhoImovel(String endereco, double preco, double desconto) {
        super(endereco, preco);
        this.desconto = desconto;
    }

    public double getDesconto() {
        return desconto;
    }

    public void setDesconto(double desconto) {
        this.desconto = desconto;
    }

    public double getPrecoFinal() {
        return preco - desconto;
    }

    @Override
    public void imprimir() {
        super.imprimir();
        System.out.println("Desconto: R$ " + desconto);
        System.out.println("Preço Final: R$ " + getPrecoFinal());
    }
}
