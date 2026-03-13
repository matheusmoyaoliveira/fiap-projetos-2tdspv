using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace projetoCaixa
{
    class Caixa
    {
        public double saldo { get; set; }
        public double valor { get; set; }
        public double taxaJuros { get; set; }

        public Caixa()
        {
            saldo = 0;
            valor = 0;
            taxaJuros = 0;
        }

        public void RegistrarEntrada(double valor)
        {
            this.saldo += valor;
        }

        public void RegistrarSaida(double valor)
        {
            this.saldo -= valor;
        }

        public double Investir(double valor, double taxa)
        {
            double rendimento = valor * taxa;
            this.saldo += rendimento;
            return rendimento;
        }

        public void CobrarJuros()
        {
            if (SaldoNegativo())
            {
                double juros = this.saldo * 0.05;
                this.saldo += juros;
                Console.WriteLine($"Juros aplicados: {juros}");
            }
            else
            {
                Console.WriteLine("Saldo não está negativo.");
            }
        }

        public bool SaldoNegativo()
        {
            return this.saldo < 0;
        }

        public double ConsultarSaldo()
        {
            return this.saldo;
        }
    }
}
