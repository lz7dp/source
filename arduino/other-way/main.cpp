#include <WProgram.h>

int ledPin =  13;    // LED connected to digital pin 13

void setup() {
    pinMode(ledPin, OUTPUT);
}

void loop() {
    digitalWrite(ledPin, HIGH);   // set the LED on
    delay(500);                   // wait for half a second
    digitalWrite(ledPin, LOW);    // set the LED off
    delay(500);                   // wait for half a second
}

int main(void) {
    init();
    setup();
    for (;;) {
       loop();
    }
}
