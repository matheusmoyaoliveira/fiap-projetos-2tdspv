using metodoPagamento;

bool sair = false;

while (!sair)
{
    Console.WriteLine("1 - Cartão à vista");
    Console.WriteLine("2 - Cartão parcelado");
    Console.WriteLine("3 - Boleto");
    Console.WriteLine("0 - Sair");
    Console.Write("Selecione uma opção: ");
    
    string opcao = Console.ReadLine();

    Console.WriteLine("Digite o valor do pagamento: ");
    decimal valor = decimal.Parse(Console.ReadLine());

    switch (opcao)
    {
        case "1":
            PagamentoCartao cartaoVista = new PagamentoCartao
            {
                Valor = valor
            };
            cartaoVista.ProcessarPagamento();

            break;

        case "2":
            Console.Write("Número de parcelas: ");
            int parcelas = int.Parse(Console.ReadLine());
            PagamentoCartao cartaoParcelado = new PagamentoCartao { Valor = valor };
            cartaoParcelado.ProcessarPagamento(parcelas);

            break;

        case "3":
            PagamentoBoleto boleto = new PagamentoBoleto { Valor = valor };
            boleto.ProcessarPagamento();
            break;

        case "0":
            sair = true;

            break;

        default:
            Console.WriteLine("Opção inválida");
            break;
    }

    Console.WriteLine("Encerrando o programa...");
}