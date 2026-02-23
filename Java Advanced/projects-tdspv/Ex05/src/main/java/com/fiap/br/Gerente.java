package com.fiap.br;

public class Gerente {

    public String nome;

    public Gerente(String nome) {
        this.nome = nome;
    }

    public void atualizar(Funcionario f, String cargo) {
        f.cargo = cargo;
        System.out.println("Cargo atualizado para: " + cargo);
    }

    public void atualizar(Funcionario f, double salario) {
        f.salario = salario;
        System.out.println("Salário atualizado para: R$ " + salario);
    }
}
