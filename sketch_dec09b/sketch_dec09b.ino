/*
  Uses LiquidCrystal Library - Hello World
 
 Demonstrates the use a 16x2 LCD display.  The LiquidCrystal
 library works with all LCD displays that are compatible with the 
 Hitachi HD44780 driver. There are many of them out there, and you
 can usually tell them by the 16-pin interface.
 
 This sketch prints "CO2 Sensors output readings in V" to the LCD
 and also dsiplays the time and if the reading is stable or unstable
 
  The circuit:
 * LCD RS pin to digital pin 12
 * LCD Enable pin to digital pin 11
 * LCD D4 pin to digital pin 5
 * LCD D5 pin to digital pin 4
 * LCD D6 pin to digital pin 3
 * LCD D7 pin to digital pin 2
 * LCD R/W pin to ground
 * 10K resistor:
 * ends to +5V and ground
 * wiper to LCD VO pin (pin 3)
 * CO2 Sensors Analog o/p to A0 pin
 
 Library originally added 18 Apr 2008
 by David A. Mellis
 library modified 5 Jul 2009
 by Limor Fried (http://www.ladyada.net)
 example added 9 Jul 2009
 by Tom Igoe
 modified 22 Nov 2010
 by Tom Igoe
 modified Dec 2013
 by Nandkishor Dhawale
 
 This example code is in the public domain.

// http://www.arduino.cc/en/Tutorial/LiquidCrystal
 */

// include the library code:
#include <LiquidCrystal.h>


// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);


const int numReadings2 = 3;
int index2 = 0;
int total2 = 0;
int readings2[numReadings2];
double sdev = 0;
double average2 = 0;

const int numReadings = 10;
int readings[numReadings];      // the readings from the analog input
unsigned long readings1[numReadings];      // the readings from the timer input
int index = 0;                  // the index of the current reading
int total = 0;                  // the running total
unsigned long total1 = 0;                  // the running total
double average = 0;                // the average
unsigned long initial_time = millis();       //initial time
unsigned long time =0 ;                     // average time


int inputPin = A0;    // select the input pin for the potentiometer

void setup() {
  
  // initialize serial communication with computer:
  Serial.begin(9600);                   
  // initialize all the readings to 0: 
  for (int thisReading = 0; thisReading < numReadings; thisReading++)
    readings[thisReading] = 0;  
  
   for (int thisReading1 = 0; thisReading1 < numReadings; thisReading1++)
   readings1[thisReading1] = 0;  
 
 for (int thisReading2 = 0; thisReading2 < numReadings; thisReading2++)
   readings2[thisReading2] = 0;    
    
  // set up the LCD's number of columns and rows: 
  lcd.begin(16, 2);
  // Print a message to the LCD.
  lcd.print("TIME V STABILITY");
  
}

void loop() {
  
  delay(95);        // delay in between reads for stability
  // subtract the last reading:
  total= total - readings[index];   
  total1= total1 - readings1[index];   
  // read from the sensor:  
  readings[index] = analogRead(inputPin); 
  readings1[index] = millis(); 
  // add the reading to the total:
  total= total + readings[index];
  total1= total1 + readings1[index];   
  // advance to the next position in the array:  
  index = index + 1;                    

  // if we're at the end of the array...
  if (index >= numReadings)    {          
    // ...wrap around to the beginning: 
    index = 0;                           

  // calculate the average:
  average = (total / numReadings);
  time = ((total1 / numReadings) /1000) - initial_time; 
  
  total2 = total2 - readings2[index2];  
  readings2[index2] = average; 
  total2 = total2 + readings2[index2];
  index2 = index2 + 1;
  // if we're at the end of the array...
  if (index2 >= numReadings2)    {          
    // ...wrap around to the beginning: 
  average2 = (total2 / numReadings2);
  sdev= sqrt(( square(readings2[0] - average2) + square(readings2[1] - average2) + square(readings2[2] - average2))/3);
  //Serial.println(sdev*0.0049);
  //delay(1); 
  index2 = 0;  
  }
  
  // send it to the computer as ASCII digits
  Serial.print(time);  Serial.print(',');  Serial.println(average*0.0049); 
  delay(1);        // delay in between reads for stability     
  
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  lcd.setCursor(0, 1);
    // print the Sensor output in V:
  lcd.print(time);
  delay(1);        // delay in between reads for stability   
  
  lcd.setCursor(5, 1);
    // print the Sensor output in V:
  lcd.print(average*0.0049);
  delay(1);        // delay in between reads for stability  
  
 /* lcd.setCursor(10, 1);
    // print the Sensor output in V:
  lcd.print(sdev*0.0049);
  delay(1);        // delay in between reads for stability  */
  
  if ((sdev*0.0049) > 0.01){
  lcd.setCursor(12, 1);
  // print the Sensor output in V:
  lcd.print("R");
  delay(1);        // delay in between reads for stability  
    
  } else {
  lcd.setCursor(12, 1);
  // print the Sensor output in V:
  lcd.print("S");
  delay(1);        // delay in between reads for stability  
    
  }
  
  }
    
}

