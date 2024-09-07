import processing.video.*;
import processing.serial.*;

Serial myPort;
Movie myMovie;
int volume = 50;  // Volumen inicial

void setup() {
  size(640, 480);

  // Carga el video
  myMovie = new Movie(this, "video.mp4");
  myMovie.loop();

  // Inicia la conexión con el Arduino Esplora
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');  // Lee hasta que reciba una nueva línea
}

void draw() {
  background(0);

  // Dibuja el video
  if (myMovie.available()) {
    myMovie.read();
  }
  image(myMovie, 0, 0, width, height);

  // Ajusta el volumen según el valor recibido
  myMovie.volume(map(volume, 0, 100, 0.0, 1.0));
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');  // Lee los datos seriales
  if (inString != null) {
    volume = int(trim(inString));  // Convierte el dato en número entero
  }
}
