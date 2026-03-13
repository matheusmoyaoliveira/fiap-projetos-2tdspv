using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sistemaFuncionarios
{
    class Desenvolvedor : Funcionario, IBeneficio
    {
        public Desenvolvedor(string nome, double salario) : base(nome, salario) 
        {
        }

        public override double CalcularSalarioFinal()
        {
            return salario * 1.1;
        }

        public void CalcularBeneficio()
        {
            Console.WriteLine($"Benefício do desenvolvedor {nome}: R$ {salario * 0.2}:F2")
        }
    }
}
