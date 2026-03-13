using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace metodoPagamento
{
    class PagamentoCartao : Pagamento
    {
        public override void ProcessarPagamento()
        {
            Console.WriteLine($"Pagamento de R${Valor} realizado com cartão a vista");
        }

        public void ProcessarPagamento(int parcelas)
        {
            Console.WriteLine($"Pagamento de R${Valor} realizado com cartão em {parcelas}x de R${Valor/parcelas:F2}.");
        }
    }
}
