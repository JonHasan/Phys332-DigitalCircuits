`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:32:55 PM
// Design Name: 
// Module Name: Problem4
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


module Problem4(
    input CLK100MHZ,
    output [7:0] AN,
    output CA, CB, CC, CD, CE, CF, CG, DP
    ); 
    
    wire [7:0] CAs; 
   
    assign CA=CAs[7];
    assign CB=CAs[6];
    assign CC=CAs[5];
    assign CD=CAs[4];
    assign CE=CAs[3];
    assign CF=CAs[2];
    assign CG=CAs[1];
    assign DP=CAs[0];
    
    wire CLK1Hz; 
    
    create_1KHZ_clock clk1(CLK100MHZ, CLK1HZ); 
    
    write_To_Display(CLK1HZ, AN, CAs); 
    
    
    
endmodule

module write_To_Display(
input CLK, 
output reg [7:0] outAN,
output reg [7:0] outCAs); 

reg [4:0] ctr = 0; 

always @(posedge CLK) begin
    //1
    if(ctr==4'b0000) begin
    outAN <= 4'b0111; 
    outCAs <= 8'b1001_1111; 
    
    end else if(ctr==4'b0001) begin
    //2
    outAN <= 4'b1011; 
    outCAs <= 8'b0010_0101; 
    
    end else if(ctr==4'b0010) begin
    //3
    outAN <= 4'b1101;
    outCAs <= 8'b0000_1101; 
    
    end else if(ctr==4'b0011) begin
    //4
    outAN <= 4'b1110;
    outCAs <= 8'b1001_1001; 
    
    end else begin
        outAN <= 8'b1111_1111;
        outCAs <= 8'b1111_1111;
    end
// update the counter
        if(ctr==4'b0100) begin
            ctr <= 4'b0000;
        end else begin
            ctr <= ctr + 1;        
        end   
    end
endmodule

module create_1KHZ_clock(
    input incoming_CLK100MHZ,
    output reg outgoing_CLK1KHZ
    );
    
    // 100MHZ is 10ns cycles.  If I want 1KHZ output, I need to count 100M/1K = 1e5 cycles = 100_000 cycles
    // 2^17 = 131_072
    reg [16:0] ctr=0;
    
    always @ (posedge incoming_CLK100MHZ) begin
        if(ctr==49_999) begin
            outgoing_CLK1KHZ <= 1'b0;
            ctr <= ctr + 1;            
        end else if(ctr==99_999) begin
            outgoing_CLK1KHZ <= 1'b1;
            ctr <= 0;
        end else begin
            ctr <= ctr + 1;
        end         
    end
endmodule
