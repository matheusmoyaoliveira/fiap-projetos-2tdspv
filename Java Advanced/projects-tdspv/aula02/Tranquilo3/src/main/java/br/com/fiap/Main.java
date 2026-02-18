package br.com.fiap;

/**
 *
 * @author MSWagner
 */

public class Main {

    public static void main(String args[]) {
        exemplo1();
        exercicio1();
    }

    public static void exemplo1() {
        Pessoa pedro = new Pessoa("Pedro", 24);
        Pessoa catarina = new Pessoa("Catarina", 13);
        Pessoa arthur = new Pessoa("Arthur", 18);
        Pessoa sofia = new Pessoa("Sofia", 32);
        Pessoa tranquilo = new Pessoa("Tranquilo da Silva", 112);
        Pessoa xpto = new Pessoa("XPTO tranquilo", 85);
        Pessoa matheus = new Pessoa("Matheus", 28);

        System.out.println("A pessoa se chama " +
                pedro.getNome() + " e ela tem " +
                pedro.getIdade() + " anos.");
        pedro.setIdade(25);
        System.out.println("A pessoa se chama " +
                pedro.getNome() + " e ela tem " +
                pedro.getIdade() + " anos.");
        sofia.andar();
        System.out.println("A " + catarina.getNome() + " está andando.");
    }

    public static void exercicio1() {
        Produto p1 = new Produto("Macarrão", "Dona Benta", 20.0, 1.0);
        Produto p2 = new Produto("Arroz", "Camil", 35.0, 1.0);
        Produto p3 = new Produto("Feijão", "Camil", 15.0, 0.500);

        System.out.println("Produto 1: " + p1.getNome() + ", Marca: " + p1.getMarca() + ", Preço: R$" + p1.getPreco() + ", Peso: " + p1.getPeso());
        System.out.println("Produto 2: " + p2.getNome() + ", Marca: " + p2.getMarca() + ", Preço: R$" + p2.getPreco() + ", Peso: " + p2.getPeso());
        System.out.println("Produto 3: " + p3.getNome() + ", Marca: " + p3.getMarca() + ", Preço: R$" + p3.getPreco() + ", Peso: " + p3.getPeso());

        p1.setPreco(22.5);
        p1.setPeso(1.2);

        p2.setNome("Arroz Integral");
        p2.setPreco(39.9);

        p3.setMarca("Camil Premium");
        p3.setPeso(0.6);

        System.out.println("Produto 1: " + p1.getNome() + ", Marca: " + p1.getMarca() + ", Preço: R$" + p1.getPreco() + ", Peso: " + p1.getPeso());
        System.out.println("Produto 2: " + p2.getNome() + ", Marca: " + p2.getMarca() + ", Preço: R$" + p2.getPreco() + ", Peso: " + p2.getPeso());
        System.out.println("Produto 3: " + p3.getNome() + ", Marca: " + p3.getMarca() + ", Preço: R$" + p3.getPreco() + ", Peso: " + p3.getPeso());
    }
}

