package br.com.fiap;

/**
 *
 * @author MSWagner
 */

public class Main {

    public static void main(String args[]) {
        exemplo1();
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
}

