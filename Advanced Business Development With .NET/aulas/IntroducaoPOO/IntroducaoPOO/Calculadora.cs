using System;
using System.Collections.Generic;
using System.Text;

namespace IntroducaoPOO
{
    internal class Calculadora
    {
        public double n1 { get; set; }
        public double n2 { get; set; }
        public double res { get; set; }

        public Calculadora()
        {
            n1 = 0;
            n2 = 0;
            res = 0;
        }

        public Calculadora(double num1, double num2)
        {
            this.n1 = num1;
            this.n2 = num2;
            res = 0;
        }

        public void Somar()
        {
            this.res = this.n1 + this.n2;
        }

        public double Subtrair()
        {
            return this.n1 - this.n2;
        }

        public void Multiplicar(double num1, double num2)
        {
            this.res = num1 * num2;
        }

        public double Dividir(double num1, double num2)
        {
            if (num2 == 0)
            {
                Console.WriteLine("Não é possível dividir por zero.");
                return 0;
            }
            return num1 / num2;
        }

        /*
         * Anatomia de um método:
         * retorno nulo e sem parâmetros: void NomeMetodo() { }
         * retorno nulo e com parâmetros: void NomeMetodo(tipo nomeParametro) { }
         * retorno com valor e sem parâmetros: tipo NomeMetodo() { }
         * retorno com valor e com parâmetros: tipo NomeMetodo(tipo nomeParametro) { }
         */
    }
}
