package org.example;

import org.example.exception.SaldoInsuficienteException;

public class ContaPoupanca extends Conta{

    public ContaPoupanca(String numero, double saldo, TipoConta tipoConta) {
        super(numero, saldo, tipoConta);
    }

    @Override
    public void sacar(double valor) throws SaldoInsuficienteException {
        super.sacar(valor);
    }
}
