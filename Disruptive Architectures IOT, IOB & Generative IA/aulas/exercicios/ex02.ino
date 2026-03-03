// C++ code
//
void setup(){
  Serial.begin(9600);
  Serial.println("Calculadora basica (inteiros)");
  Serial.println("Digite dois numeros inteiros separados por espaço. Ex: 10 3");
}

void loop(){
  if (Serial.available() > 0) {
    
    int a = Serial.parseInt();
    
    int b = Serial.parseInt();
    
    Serial.print("Voce digitou: ");
    Serial.print(a);
    Serial.print(" e ");
    Serial.println(b);
    
    int soma = a + b;
    int sub = a - b;
    long mult = (long)a * (long)b;
    
    Serial.print("Adicao: ");
    Serial.println(soma);
    
    Serial.print("Subtracao: ");
    Serial.println(sub);
    
    Serial.print("Multiplicacao: ");
    Serial.println(mult);
    
    if (b == 0) {
      Serial.println("Divisao: nao da para dividir por 0");
    } else {
      
      float div = (float)a / (float)b;
      
      Serial.print("Divisao (decimal): ");
      Serial.println(div, 4);
    }
    
    Serial.println("-----------------------");
    Serial.println("Digite dois numeros de novo:");
  }
}