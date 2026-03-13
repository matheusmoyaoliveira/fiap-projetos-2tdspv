using IntroducaoPOO;

int opcao = 0;

do
{
    Console.Clear();
    Console.WriteLine("======= CALCUADORA POO =======");
    Console.WriteLine("1 - Somar");
    Console.WriteLine("2 - Subtrair");
    Console.WriteLine("3 - Multiplicar");
    Console.WriteLine("4 - Dividir");
    Console.WriteLine("0 - Sair");
    Console.Write("Escolha uma opção: ");

    opcao = int.Parse(Console.ReadLine());

    if(opcao >= 1 && opcao <= 4)
    {
        Console.Write("Digite o primeiro número: ");
        double num1 = double.Parse(Console.ReadLine());

        Console.Write("Digite o segundo número: ");
        double num2 = double.Parse(Console.ReadLine());

        Calculadora calc = new Calculadora();

        switch (opcao)
        {
            case 1:
                calc.n1 = num1;
                calc.n2 = num2;
                calc.Somar();
                Console.WriteLine($"Resultado: {calc.res}");
                break;

            case 2:
                calc.n1 = num1;
                calc.n2 = num2;
                Console.WriteLine($"Resultado: {calc.Subtrair()}");
                break;

            case 3:
                calc.Multiplicar(num1, num2);
                Console.WriteLine($"Resultado: {calc.res}");
                break;

            case 4:
                Console.WriteLine($"Resultado: {calc.Dividir(num1, num2)}");
                break;

            default:
                Console.WriteLine("Opção inválida.");
                break;
        }

        if(opcao != 0)
        {
            Console.WriteLine("Pressione qualquer tecla para continuar...");
            Console.ReadKey();
        }

    else if(opcao != 0)
        {
            Console.WriteLine("Opção inválida");
            Console.ReadLine();
        }
    }
} while(opcao != 0);
Console.WriteLine("Programa Encerrado!");