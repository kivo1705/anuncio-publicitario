#include <Esplora.h>

void setup() {
  Serial.begin(9600);  // Inicia la comunicación serial
}

void loop() {
  int potValue = Esplora.readSlider();  // Lee el valor del potenciómetro lineal
  int volume = map(potValue, 0, 1023, 0, 100);  // Mapea el valor a un rango de 0 a 100 para el volumen

  // Envía el valor del volumen a través del puerto serial
  Serial.println(volume);

  delay(100);  // Ajusta el intervalo de actualización del volumen
}
