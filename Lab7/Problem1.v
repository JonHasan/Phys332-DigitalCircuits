`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:32:55 PM
// Design Name: 
// Module Name: Problem1
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


module Problem1(
    output [2:0] LED, 
    output [1:3] JD, 
    input CLK100MHZ
 );
 wire clk1, clk2; 
 
 assign LED[0] = clk1; 
 assign LED[1] = clk2; 
 assign JD[1] = clk1; 
 assign JD[2] = clk2; 
 
 assign LED[2] = CLK100MHZ; 
 
 create_333mHz_clock clock1(CLK100MHZ, clk1); 
 create_333KHz_clock clock2(CLK100MHZ, clk2); 

    
endmodule

module create_333mHz_clock(
    input incoming_CLK100MHZ,
    output reg outgoing_CLK333mHz
    );
    
    // 100MHZ is 10ns cycles.  If I want 333 mHz output, I need to count 100M/.333 = 30030030.03 cycles 100
    // 2^28 ~ 200000000
    reg [30:0] ctr=0;
    
    always @ (posedge incoming_CLK100MHZ) begin
        if(ctr==((200000000)-1)) begin
            outgoing_CLK333mHz <= 1'b0;
            ctr <= ctr + 1;            
        end else if(ctr==((300000000)-1)) begin
            outgoing_CLK333mHz <= 1'b1;
            ctr <= 0;
        end else begin
            ctr <= ctr + 1;
        end         
    end
endmodule



module create_333KHz_clock(
    input incoming_CLK100MHZ,
    output reg outgoing_CLK333KHz
    );
    
    // 100MHZ is 10ns cycles.  If I want 333KHZ output, I need to count 100M/333K = 300 cycles
    // 2^17 = 131_072
    reg [18:0] ctr=0;
    
    always @ (posedge incoming_CLK100MHZ) begin
        if(ctr==99_999) begin
            outgoing_CLK333KHz <= 1'b0;
            ctr <= ctr + 1;            
        end else if(ctr==299_999) begin
            outgoing_CLK333KHz <= 1'b1;
            ctr <= 0;
        end else begin
            ctr <= ctr + 1;
        end         
    end
endmodule


    
