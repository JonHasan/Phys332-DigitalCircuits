`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2021 12:33:08 PM
// Design Name: 
// Module Name: Lab6
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Lab6(

/*
//Single bit adder 
    input [3:0] SW,
    output[2:0] LED
    
    );
    wire a1, a0, b1, b0;
    wire s1, s0, cout;
    wire c_in; 
    
    assign a0 = SW[0];
    assign b0 = SW[1]; 
    assign c_in = SW[2]; 
    
    //global ouptuts
    assign LED[0] = s0;
    assign LED[1] = cout; 
    
    fulladder add0(a0, b0, c_in, cout, s0);
    
    */
//End Single Bit adde r

//two bit adder 

/*
    input [3:0] SW,
    output[2:0] LED
    
    );
    wire a1, a0, b1, b0;
    wire s1, s0, cout;
    wire c_mid;
    
    assign a0 = SW[0];
    assign a1 = SW[1];
    assign b0 = SW[1]; 
    assign b1 = SW[3];
    
    //global ouptuts
    assign LED[0] = s0;
    assign LED[1] = s1; 
    assign LED[2] = cout; 
    
    fulladder add0(a0, b0, 0, cout, s0);
    fulladder add1(a1, b1, c_mid, cout, s1);
    
    //End two bit adder 
 
 */
 // 4 bit adder 
 
 
    input [7:0] SW,
    output[4:0] LED
    
    );
    wire a0, a1, a2, a3, b0, b1, b2, b3 ;
    wire s3, s2, s1, s0, cout;
    wire cmid0, cmid1, cmid2;
    
    assign a0 = SW[0];
    assign b0 = SW[1];
    assign a1 = SW[2]; 
    assign b1 = SW[3];
    assign a2 = SW[4];
    assign b2 = SW[5];
    assign a3 = SW[6];
    assign b3 = SW[7]; 
    
    //global ouptuts
    assign LED[0] = s0;
    assign LED[1] = s1;
    assign LED[2] = s2;
    assign LED[3] = s3;  
    assign LED[4] = cout; 
    
    fulladder add0(a0, b0, 0, cmid0, s0);
    fulladder add1(a1, b1, cmid0, cmid1, s1);
    fulladder add2(a2, b2, cmid1, cmid2, s2);
    fulladder add3(a3, b3, cmid2, cout, s3);
    
endmodule

module fulladder(

    input a,
    input b,
    input c_in,
    output c_out,
    output sum);

    assign c_out = (a&b) | (a & c_in) | (b & c_in); 

    assign sum = (~a & ~b & c_in) | (~a & b & ~c_in) | (a & b & c_in) | (a & ~b & ~c_in);

endmodule
