package org.example;

import org.example.exception.SaldoInsuficienteException;

public abstract class Conta {

    protected String numero;
    protected double saldo;
    protected TipoConta tipoConta;

    public Conta(String numero, double saldo, TipoConta tipoConta) {
        this.numero = numero;
        this.saldo = saldo;
        this.tipoConta = tipoConta;
    }

    public void depositar(double valor) {
        saldo += valor;
    }

    public void sacar(double valor) throws SaldoInsuficienteException {
        if (valor > saldo) {
            throw new SaldoInsuficienteException("Saldo Insuficiente!");
        }
        saldo -= valor;
    }

    public String getNumero() {
        return numero;
    }

    public double getSaldo() {
        return saldo;
    }

    public TipoConta getTipoConta() {
        return tipoConta;
    }
}
