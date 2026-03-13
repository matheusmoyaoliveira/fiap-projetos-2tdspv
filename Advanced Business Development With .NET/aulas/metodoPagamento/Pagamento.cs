using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace metodoPagamento
{
    abstract class Pagamento
    {
        public decimal Valor {  get; set; }

        public abstract void ProcessarPagamento();
    }
}
