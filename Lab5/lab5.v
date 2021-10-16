`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: lab1
//////////////////////////////////////////////////////////////////////////////////


//module lab1(
    //input [3:0] SW,
     //output [3:0] LED,
     //output LED17_R,
     //output LED17_B,
     //output LED17_G
     
    //);
    
    //assign LED[0] = SW[0];
    //assign LED[1] = SW[1];
    //assign LED[2] = SW[2];
    //assign LED[3] = SW[3];
    
    
    ///assign LED17_R = SW[1]&SW[0];
    //assign LED17_G = SW[2]&SW[0]; 
    //assign LED17_B = SW[3]&SW[0]; 
   
    
    
    
     
    
//endmodule

module lab5b(
    input [3:0] SW,
    output[2:0] LED
);

wire e,f,g; 
wire a1, a0, b1 ,b0; 

assign a0 = SW[0]; 
assign a1 = SW[1]; 
assign b0 = SW[2]; 
assign b1 = SW[3]; 

assign LED[0] = e; 
assign LED[1] = f; 
assign LED[2] = g; 
   

//Law of complementarity present would yield a permanent 1. This is incorrect. 
// Need to apply tilde to each unique entry. 
assign e = (~a1&~a0&~b1&~b0) | (a1&a0&b1&b0) | (~a1&a0&~b1&b0) | (a1&~a0&b1&~b0);

assign f = a1&~b1 | a1&a0&b1&~b0 | ~a1&a0&~b1&~b0;

assign g = ~a1&b1 | ~a1&~a0&~b1&b0 | a1&~a0&b1&b0; 

endmodule 
