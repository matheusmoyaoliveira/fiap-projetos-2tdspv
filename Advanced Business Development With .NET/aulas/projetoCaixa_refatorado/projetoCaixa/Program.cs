
using projetoCaixa;

int opcao = 0;
Caixa caixa = new Caixa();

do
{
    Console.Clear();
    Console.WriteLine("===== SISTEMA DE CAIXA =====");
    Console.WriteLine("1 - Registrar Entrada");
    Console.WriteLine("2 - Registrar Saída");
    Console.WriteLine("3 - Investir Valor");
    Console.WriteLine("4 - Cobrar Juros (se negativo)");
    Console.WriteLine("5 - Consultar Saldo");
    Console.WriteLine("0 - Sair");
    Console.Write("Escolha uma opção: ");

    opcao = int.Parse(Console.ReadLine());

    switch (opcao)
    {
        case 1:
            Console.Write("Digite o valor da entrada: ");
            double entrada = double.Parse(Console.ReadLine());
            caixa.RegistrarEntrada(entrada);
            Console.WriteLine("Entrada registrada com sucesso!");
            break;

        case 2:
            Console.Write("Digite o valor da saída: ");
            double saida = double.Parse(Console.ReadLine());
            caixa.RegistrarSaida(saida);
            Console.WriteLine("Saída registrada com sucesso!");
            break;

        case 3:
            Console.Write("Digite o valor para investir: ");
            double valor = double.Parse(Console.ReadLine());

            Console.Write("Digite a taxa (ex: 0.1 para 10%): ");
            double taxa = double.Parse(Console.ReadLine());

            double rendimento = caixa.Investir(valor, taxa);
            Console.WriteLine($"Rendimento obtido: {rendimento}");
            break;

        case 4:
            caixa.CobrarJuros();
            break;

        case 5:
            Console.WriteLine($"Saldo atual: {caixa.ConsultarSaldo()}");
            break;

        case 0:
            Console.WriteLine("Programa Encerrado!");
            break;

        default:
            Console.WriteLine("Opção inválida!");
            break;
    }

    if (opcao != 0)
    {
        Console.WriteLine("Pressione qualquer tecla para continuar...");
        Console.ReadKey();
    }

} while (opcao != 0);
