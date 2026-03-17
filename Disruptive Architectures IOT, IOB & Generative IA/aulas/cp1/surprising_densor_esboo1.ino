//CP1 IOT
//GABRIEL AMBROSIO SARAIVA - RM566552
//MATHEUS MOYA - RM562822
//JOAO VICTOR VENDRAMETO - RM563665
 
int valorSensor = 0;
int ledVerde   = A1;
int ledAmarelo = A2;
int ledVermelho= A3;
 
void setup() {
  pinMode(ledVerde, OUTPUT);
  pinMode(ledAmarelo, OUTPUT);
  pinMode(ledVermelho, OUTPUT);
 
  Serial.begin(9600);
}
 
void loop() {
  valorSensor = analogRead(A0);
  Serial.print("Valor do sensor: ");
  Serial.println(valorSensor);
 
 
  if (valorSensor < 300) {
    digitalWrite(ledVerde, HIGH);
    digitalWrite(ledAmarelo, LOW);
    digitalWrite(ledVermelho, LOW);
  }
  else if (valorSensor >= 300 && valorSensor <= 700) {
    digitalWrite(ledVerde, LOW);
    digitalWrite(ledAmarelo, HIGH);
    digitalWrite(ledVermelho, LOW);
  }
  else {
    digitalWrite(ledVerde, LOW);
    digitalWrite(ledAmarelo, LOW);
    digitalWrite(ledVermelho, HIGH);
  }
 
  delay(100);
}