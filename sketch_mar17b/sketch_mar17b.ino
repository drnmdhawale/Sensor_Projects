/* To control the speed and position of the OSA drill motor
 created and Nov 2013
 modified Mar 2014
 by Nandkishor Dhawale
 
 This example code is in the public domain.
 code used for reference available at  
 http://www.arduino.cc/en/Tutorial/BlinkWithoutDelay
 */

//
String inputString = "";         // a string to hold incoming data
//String stringOne, stringTwo, stringThree;
boolean stringComplete = false;  // whether the string is complete

// constants won't change. Used here to 
// set pin numbers:

const int motCmdPin =  3;      // the number of the Motor pin
int motPosPin = A0;    // select the input pin for the potentiometer

// Variables will change:
int motCmdState = LOW;             // ledState used to set the LED
unsigned long initial_time = millis();       //initial time
unsigned long time =0 ;                     //  time
int PulseCmd=1500;                              // hh

// filtering Position data
const int numReadings = 50;
double readings[numReadings];
double PosValue = 0.00;  // variable to store the value coming from the sensor
int index = 0;
double total = 0.00;

void setup() {
  // set the digital pin as output:
   pinMode(motCmdPin, OUTPUT); 
   Serial.begin(9600);   
   // reserve 200 bytes for the inputString:
  inputString.reserve(200);
   for (int thisReading = 0; thisReading < numReadings; thisReading++)
   readings[thisReading] = 0;   
}

void loop()
{  
   // print the string when a newline arrives:
  if (stringComplete) {
             
     if (inputString.toInt() == 1) { 
     PulseCmd= 1500; 
   Serial.println(inputString);}
     
     if (inputString.toInt() == 2) { 
     PulseCmd= 1650;
   Serial.println(inputString);}
     
     if (inputString.toInt() == 3){ 
     PulseCmd= 1350; 
   Serial.println(inputString);}
     
    // Serial.println(inputString);
    
    // clear the string:
    inputString = "";
    stringComplete = false;
  }
      // Motor Command
      motCmdState = HIGH;
      digitalWrite(motCmdPin, motCmdState);   
      delayMicroseconds(PulseCmd);
      motCmdState = LOW;
      digitalWrite(motCmdPin, motCmdState);
      delay(1);
            
  total= total - readings[index];   
    // read from the sensor:  
  readings[index] = ((analogRead(motPosPin)/10)*0.3390)-1.0159; 
    // add the reading to the total:
  total= total + readings[index];
  // advance to the next position in the array:  
  index = index + 1;    
  
  if (index >= numReadings)    {          
    // ...wrap around to the beginning: 
    index = 0; 

   // calculate the average:
   PosValue = (total / numReadings);
   time = millis() - initial_time; 
   
     // send it to the computer as ASCII digits
 Serial.print(time);  Serial.print(',');  Serial.print(PulseCmd); Serial.print(','); Serial.println(PosValue); 
  delay(1);        // delay in between reads for stability  
  }   
    
  }
    
  void serialEvent() {
  while (Serial.available()) {
    // get the new byte:
    char inChar = (char)Serial.read(); 
    // add it to the inputString:
    inputString += inChar;
    // if the incoming character is a newline, set a flag
    // so the main loop can do something about it:
    if (inChar == '\n') {
      stringComplete = true;
    } 
  }
}


