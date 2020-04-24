int RedPin = 10;
int Btn1 = 8;
int curBtnState;

int before = 0;
int btnCnt = 0;

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);
  
  pinMode(RedPin, OUTPUT);
  pinMode(Btn1, INPUT);
}

// the loop function runs over and over again forever
void loop() {
  
   curBtnState = digitalRead(Btn1);

   Serial.print(curBtnState);
   Serial.print(" : " );
   Serial.println(before);
  
   if(curBtnState == 1){
      if(before == 0){
        btnCnt++;
        before = 1;
      }

      if(btnCnt == 2){
        btnCnt = 0;
      }
   }

   if(curBtnState == 0){
      before = 0;
   }

   if(btnCnt == 0){
      digitalWrite(RedPin, LOW);
   }

   if(btnCnt == 1){
      digitalWrite(RedPin, HIGH);
   }  
 
}
