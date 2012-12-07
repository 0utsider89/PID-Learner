//Copyright 2012 My Winston Lowe

//This file is part of PID Learner.
//PID Learner is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
//PID Learner is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
//You should have received a copy of the GNU General Public License along with PID Learner. If not, see http://www.gnu.org/licenses/.

class Slider {

    float Val, Scale;
    int x, y, Cx, Cy, MD;
    
    String Name, STR;
    //textWidth(name);

    Slider(int xx, int yy, String N, float v, float s)
    {
      Val = v;
      x = xx;
      y = yy;
      Name = N;
      Scale = s;
    }

    int Draw(int OM){
      
      String STR1 = str((int)Val);
      String STR2 = str(Val);
      String STR3 = STR2;
      
      while(STR3.length() < 7 )
      {
         STR3 += "0";
      }
      if(STR3.length() > 7)
      {
        STR3 = STR3.substring(0, 7);
      }
      println(STR3);
      
      STR = Name + ": " + STR3;
      
      if (MD==1 || (OM == 0 && mousePressed == true && (mouseX > x-5 && mouseX < x + textWidth(STR)+5 && mouseY > y && mouseY < y+12))) {
        if(MD==1){
          Val += (mouseY - Cy) * Scale;
          if(Val < 0){Val = 0;}
          Cy = mouseY;
        }else{
          Cx = mouseX;
          Cy = mouseY;
          MD=1;
        }
      }
      
      if(mousePressed == false) {
        MD = 0;
      }
      
      fill(0);
      stroke(0);
      rect(x-8, y, textWidth(STR)+16, 12 );
      stroke(255);
      fill(0);
      rect(x-5, y, textWidth(STR)+10, 12 );
      fill(255);
      stroke(255);
      text(STR, x, y+10);
    
      return MD;  
}
    
    float Value()
    {
      return Val;
    }
}


