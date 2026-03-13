using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sistemaFuncionarios
{
    internal class Funcionario
    {
        protected string nome { get; set; }

        protected double salario { get; set; }

        public Funcionario(string nome, double salario) 
        {
            this.nome = nome;
            this.salario = salario;
        }

        public void exibirDados()
        {
            Console.WriteLine($"Nome: {nome} - Salário Base: R$ {salario:F2}");
        }

        public virtual double CalcularSalarioFinal()
        {
            return salario;
        }
    }
}
