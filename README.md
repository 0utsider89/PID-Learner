PID-Learner
===========

This is a tool for helping visualize a PID loop, and gives you a good way to learn how to tune them.

How-TO:
To run this you need to have processing install on your computer from this site 
http://processing.org/

Now you need to download the file from github. Dose not matter where they go on you computer. 
With Processing open, goto File->Open, look for the place where you downloaed/unextracted the code too. 
Processing is going to tell you that the code need to be in a folder called "PID", and that it wants to copy the files to its project/sketchbook folder.
If this dose not work you need to put the files in a folder named "PID", and have them in the folder that processing uses as its project/sketchbook folder.    
Windows: C:\Users\<your username>\Documents\Processing
Linux: ~/sketches/
I don't uses Macs, sorry your on own.

When you start the program it will begin to draw a wave pattern.
The YELLOW line is the input to the PID loop, and the RED is the error.

To begin tuning the PID loop you need to set the I and D to 0.

Start with the P, and slowly increasing the value until the RED line starts
to osculating and ring.  If it starts to osculating out of control, decrease
until it rings out and stops osculating after the Yellow lines sharp movements.
  
Now working with the I, you want to slowly increase the value until the 
RED line start to osculate again.  But not to the point where its 
going out of control. And you don't want it to die out, it need to be a constent 
osculation. 

Once you have that working, you can begin to increase the value of D until the 
RED line is move in syce with the YELLOW line, as much as you can, without
having a sharp ring when the YELLOW line jumps.

With any luck you have a tuned pid loop.

At this point you can go back and play with P and I, and see if changing them 
helps any.

This software can be used with any tuning method.

Thank for reading, and happy tuning.   
