PID-Learner
===========

This is a tool for helping visualize a PID loop, and gives a good way to learn how to tune them.

How-TO:
To run this you need to have processing install on your computer from this site 
http://processing.org/

When you start the program it will begin to draw a wave pattern.
The YELLOW line is the input to the PID loop, and the RED is the error.

To begin tuning the PID loop you need to set the I and D to 0.

Start with the P, and slowly increasing the value until the RED line starts
to osculating and ring.  If it starts to osculating out of control decrease
until it rings out and stops osculating after the Yellow line sharp movement.
  
Now working with the I we want to slowly increase the value until the 
RED line start to again osculate, but not to the point where its 
going out of control and not dieing out. 

Once you have that working, you can begin to increase the value of D until the 
RED line is move in syce with the YELLOW line as much as you can without
having a sharp ring when the YELLOW line jumps.

This software can be used with any tuning method.

Thank for read and happy tuning.   
