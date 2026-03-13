using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sistemaFuncionarios
{
    class Gerente : Funcionario, IBeneficio
    {
        public Gerente(string nome, double salario) : base(nome, salario)
        {
        }

        public override double CalcularSalarioFinal()
        {
            return salario * 1.2;
        }

        public void CalcularBeneficio()
        {
            Console.WriteLine($"Benefício do gerente {nome}: R$ {salario * 0.2}:F2")
        }
    }
}
