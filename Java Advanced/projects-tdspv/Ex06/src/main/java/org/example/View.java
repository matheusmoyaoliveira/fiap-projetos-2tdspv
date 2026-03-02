package org.example;

import java.util.ArrayList;
import java.util.List;
import org.example.exception.SaldoInsuficienteException;

public class View {

    public static void main(String[] args) {

        try {

            ContaCorrente cc = new ContaCorrente("001", 1000, TipoConta.CORRENTE);

            ContaPoupanca cp = new ContaPoupanca("002", 2000, TipoConta.POUPANCA);

            cc.sacar(200);

            List<Conta> listaContas = new ArrayList<>();

            listaContas.add(cc);
            listaContas.add(cp);
            listaContas.add(new ContaCorrente("003", 1500, TipoConta.CORRENTE));

            System.out.println("=== Saldos das Contas ===");
            for (Conta conta : listaContas) {
                System.out.println("Conta: " + conta.getNumero() +
                        " | Tipo: " + conta.getTipoConta() +
                        " | Saldo: R$ " + conta.getSaldo());
            }

        } catch (SaldoInsuficienteException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}