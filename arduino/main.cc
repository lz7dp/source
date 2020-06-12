//  main.cc -- from Blink.ino
//
//  Turns on an LED on for one second,
//  then off for one second, repeatedly.
//
//  This example code is in the public domain.

// include Arduino.h header file
#include <Arduino.h>

// Pin 13 has an LED connected on most
// Arduino boards.
//int led = 13;

// the setup routine runs once when you press reset
void setup() {
  // initialize the digital pin as an output.
//  pinMode(led, OUTPUT);
  Serial.begin(115200); // Ignored by Maple. But needed by boards using hardware serial via a USB to Serial adaptor
}

// the loop routine runs over and over
void loop() {
  // turn the LED on (HIGH is the voltage level)
//  digitalWrite(led, HIGH);

  // wait for a second
//  delay(1000);

  // turn the LED off by making the voltage LOW
//  digitalWrite(led, LOW);

  // wait for a second
  Serial.println("Hi World!");
  delay(1000);
}

// main function
int main(void) {
  // call init()
  init();

  // make explicit call to setup()
  setup();

  // use a for-loop -- to make loop
  for (;;) {
    loop();
  }
}
