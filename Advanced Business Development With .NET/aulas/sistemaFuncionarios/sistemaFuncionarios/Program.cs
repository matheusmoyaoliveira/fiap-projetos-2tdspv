using sistemaFuncionarios;

bool sair = false;

while(!sair)
{
    Console.WriteLine("1 - Cadastrar e exibir gerente");
    Console.WriteLine("\n2 - Cadastrar e exibir desenvolvedor");
    Console.WriteLine("\n0 - Sair");
    Console.Write("Digite uma das opções acima: ");

    string opcao = Console.ReadLine();

    switch (opcao)
    {
        case "0":
            sair = true; 
            break;

        case "1":
            Console.Write("Nome do gerente: ");
            string nomeG = Console.ReadLine();
            Console.Write("Salário do gerente: ");
            double salarioG = double.Parse(Console.ReadLine());

            Gerente gerente = new Gerente(nomeG, salarioG);
            gerente.exibirDados();

            Console.WriteLine($"Salário final: R$ {gerente.CalcularSalarioFinal():F2}");
            gerente.CalcularBeneficio();

            break;

        case "2":
            Console.Write("Nome do desenvolvedor: ");
            string nomeD = Console.ReadLine();
            Console.Write("Salário do desenvolvedor: ");
            double salarioD = double.Parse(Console.ReadLine());

            Desenvolvedor dev = new Desenvolvedor(nomeD, salarioD);
            dev.exibirDados();

            Console.WriteLine($"Salário final: R$ {dev.CalcularSalarioFinal():F2}");
            dev.CalcularBeneficio();

            break;

        default:
            Console.WriteLine("Opção inválida!");
            break;
    }
}