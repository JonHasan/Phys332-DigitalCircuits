## Lab 5: Combinatorial Logic on FPGA's 

Goals of the lab were to continue practicing the implementation of combinatorial logic on the Nexys 4 DDR FPGA board. 

It was desired to make a 2x2-bit input and three output digital comparator. There are 4 digital switches used and the outputs will be three LED's and / or RGB LED's. 

# Things I learned: 

To access the RGB Led, needed to uncomment lines in the NEXYS constraint file. One can assign multiple LED's to a single switch. Using boolean logic, an LED can be activated under certain conditions. This boolean logic can be written in verilog with certain symbols. The ampersand (&) represents an AND operation, a tilde (~) represents a NOT operation and a vertical bar (|) represents an OR operation. 

Debugging: 

Originally I tried to do something like this for constraining the RGB LED
`
if(SW[0] == 1) begin
(
//activate RGB
)
end
`

Problem was there were error messages pertaining to SW[0] not being a constant. In the end, I was thinking too hard about how to resolve this. It was as simple as having the RGB LED activate whenever the desired switch was flipped on. This can be done by assigning the RGB LED to the same switch as the numbered LED. 

The RGB LED was also modified to be only lit by switches 1 - 3 when the enable bit, 0 was active. This was possible by adding 

`& SW[0]` to the original RGB LED code 


## Digital Comparator 
Moving on to the setting up of the karnaugh maps it was necessary to setup the conditions. 

For this portion of the lab it was necessary to add two two bit numbers together. 

A = A1A0 where A1 is the MSB
B = B1B0 where B1 is the MSB

There are three variables to consider: e,f, g

e is equal to 1 when A == B

f is equal to 1 when A > B

g is equal to 1 when B < A 

