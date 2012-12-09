//Copyright 2012 My Winston Lowe

//This file is part of PID Learner.
//PID Learner is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
//PID Learner is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
//You should have received a copy of the GNU General Public License along with PID Learner. If not, see http://www.gnu.org/licenses/.

float Y, Out, Mass, LPos1, LPos, Pos, LSP, SetPoint, SP, PErr, Err,Int,Der , P, I, D, DT , L;
int Next = 6;
int MO = 0;
int II=0;

Slider S1 = new Slider(10,20,"P",0.8,0.01);
Slider S2 = new Slider(100,20,"I",0.0,0.001);
Slider S3 = new Slider(185,20,"D",20.0,0.5);
Slider S4 = new Slider(330,20,"Wind",0.0,1);
Slider S5 = new Slider(450,20,"Mass",99.0,1);

void setup()
{
  size(1024, 768);
  
  P = 0.5;
  I = 0.000;
  D = 0;
  
  Pos = height/3.5;
  Int = 0;
  DT = 5;
  SetPoint = height/3;
  PErr = SetPoint - Pos;
  
  background(0);
}

void draw()
{

  //line(pmouseX, pmouseY, mouseX, mouseY);
  MO = MO | S1.Draw(MO);
  P = S1.Value();
 
  MO = S2.Draw(MO);
  I = S2.Value();
 
  MO = S3.Draw(MO);
  D = S3.Value();
  
  MO = S4.Draw(MO);
  L = S4.Value();
  
  MO = S5.Draw(MO);
  
  
  Err = SetPoint - Pos;
  Int = Int + (Err*DT);
  Der = (Err - PErr)/DT;
  Out = (P*Err) + (I*Int) + (D*Der);
  PErr = Err;
  
  Mass = Mass - (Mass-Out) / (S5.Value()+1);
  Pos += Mass + L;
  
  if(Pos < -2000) Pos=-2000;
  if(Pos > 2000) Pos=2000;
  
  if(Int < -200) Int=-200;
  if(Int > 200) Int=200;
  
  stroke(color(50,50,50));
  line(0, (height/1.3), width, (height/1.3));
  
  stroke(color(255,255,255));
  line(Y, (height/1.3) + LPos1, Y+1, (height/1.3) + (SetPoint - Pos));  
  LPos1 =  SetPoint - Pos;
  
  stroke(color(255,0,0));
  line(Y, LPos, Y+1, Pos);
  
  stroke(color(255,255,0));
  line(Y, LSP, Y+1, SetPoint);
  
  LPos = Pos;
  LSP = SetPoint;
  Y+=1;
  
  delay((int)DT);
  

  //SetPoint = (200 + sin(Y/10)*100) + L;
  if(Y % 80 == 0)
  {
    if(II == 0)
    {
      II = 1;
      SP = 200;
    }else{
      II = 0;
      SP = 100;
    }
  }
  SetPoint = SP + sin(Y/8)*20;
  SetPoint+=height/3.5;
  if(Y > width){Y=0; background(0);}
  
  fill(255);
  stroke(255);
  text("Error:", 2, height/1.4);
  
  fill(255,255,0);
  stroke(255,255,0);
  text("Input:", 2, height/6);
  
  fill(255,0,0);
  stroke(255,0,0);
  text("Output:", 2, height/5.0);
  
}
