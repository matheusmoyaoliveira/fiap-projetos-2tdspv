package br.com.fiap;

import java.util.ArrayList;
import java.util.List;

public class Concessionaria {

    private List<Veiculo> estoque;

    public Concessionaria() {
        estoque = new ArrayList<>();
    }

    public void adicionar(Veiculo veiculo) {
        estoque.add(veiculo);
    }

    public void listarEstoque() {
        if (estoque.isEmpty()) {
            System.out.println("Estoque vazio.");
            return;
        }

        for (int i = 0; i < estoque.size(); i++) {
            System.out.println("[" + i + "] " + estoque.get(i));
        }
    }

    public boolean venderPorIndice(int indice) {
        if (indice < 0 || indice >= estoque.size()) {
            return false;
        }
        estoque.remove(indice);
        return true;
    }
}
