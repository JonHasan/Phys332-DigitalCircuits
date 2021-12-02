`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:32:55 PM
// Design Name: 
// Module Name: Problem3
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


module Problem3(

input CLK100MHZ,
output [7:0] LED
   );

 
clk_1Hz_1000ms clk1(CLK100MHZ, CLK1HZ); 

reg[8:0] counts; 

assign LED[0] = counts[0]; 
assign LED[1] = counts[1]; 
assign LED[2] = counts[2]; 
assign LED[3] = counts[3]; 
assign LED[4] = counts[4]; 
assign LED[5] = counts[5]; 
assign LED[6] = counts[6]; 
assign LED[7] = counts[7];
    

always @(posedge CLK1HZ) begin

    counts <= counts + 8'b0000_0001;
    
end 

endmodule

module clk_1Hz_1000ms(
    input incoming_CLK100MHZ,
    output reg outgoing_CLK
    );
    
    // creates 1HZ clock from a 100MHZ clock
    // 1HZ clock has a period of 1 second = 1000ms
    // 100MHz is 100,000,000 cycles
    // log2(10,0000,000) = 26.6, so 27 bits needed for counter
    reg[27:0] ctr;
    
    always @ (posedge incoming_CLK100MHZ) begin
        if (ctr == 49_999_999) begin
            outgoing_CLK <= 1'b1;
            ctr <= ctr + 1;            
        end
        else if (ctr == 99_999_999) begin
            outgoing_CLK <= 1'b0;
            ctr <= 0;
        end
        else begin
            ctr <= ctr + 1;
        end
    end
endmodule



