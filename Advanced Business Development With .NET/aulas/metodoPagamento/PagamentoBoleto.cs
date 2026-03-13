using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace metodoPagamento
{
    internal class PagamentoBoleto : Pagamento
    {
        public override void ProcessarPagamento()
        {
            Console.WriteLine($"Pagamento de R${Valor} realizado com boleto");
        }
    }
}
