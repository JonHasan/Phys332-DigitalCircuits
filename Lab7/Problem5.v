 `timescale 1ns / 1ps



module Problem5(
input CLK100MHZ,
input [6:0] SW,
output CA,
output CB,
output CC,
output CD,
output CE,
output CF,
output CG,
output DP,
output [7:0] AN );





wire da,db,dc,dd,de,df,dg;
wire ca, cb, cc, cd, ce, cf, cg;

assign DP=1'b1; // active low, turn off

reg [7:0] outAN;
reg [6:0] outCAs;

// reg [4:0] ctr = 0;
reg ctr = 0;



create_1KHZ_clock clk1(CLK100MHZ, CLK);

generate_7seg_bits gen1(SW[3], SW[2], SW[1], SW[0], da, db, dc, dd, de, df, dg);

generate_7seg_bits gen2(0,0, SW[5], SW[4], ca, cb, cc, cd, ce, cf, cg);



assign AN[7:0] = outAN[7:0];
assign CG = outCAs[0];
assign CF = outCAs[1];
assign CE = outCAs[2];
assign CD = outCAs[3];
assign CC = outCAs[4];
assign CB = outCAs[5];
assign CA = outCAs[6];

always @(posedge CLK) begin
//1
if(ctr==0) begin
outAN <= 8'b1111_1110;
outCAs[6] <= ~da ;
outCAs[5] <= ~db;
outCAs[4] <= ~dc;
outCAs[3] <= ~dd;
outCAs[2] <= ~de;
outCAs[1] <= ~df;
outCAs[0] <= ~dg;

end else if(ctr==1) begin
//2
outAN <= 8'b1111_1101;
outCAs[6] <= ~ca ;
outCAs[5] <= ~cb;
outCAs[4] <= ~cc;
outCAs[3] <= ~cd;
outCAs[2] <= ~ce;
outCAs[1] <= ~cf;
outCAs[0] <= ~cg;

end
ctr <= ctr + 1;
// end else begin
// outAN <= 8'b1111_1111;
// outCAs <= 8'b1111_1111;
// end
// update the counter
// if(ctr==4'b0010) begin
// ctr <= 4'b0000;
// end else begin
// ctr <= ctr + 1;
// end
end




// //Which digit are you driving? only #0, reminder, active LOW
// assign AN[7:1]=7'b111_1111;
// assign AN[0]=1'b0;




endmodule



module create_1KHZ_clock(
input incoming_CLK100MHZ,
output reg outgoing_CLK1KHZ
);

// 100MHZ is 10ns cycles. If I want 1KHZ output, I need to count 100M/1K = 1e5 cycles = 100_000 cycles
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



module generate_7seg_bits(
input s3,
input s2,
input s1,
input s0,
output da,
output db,
output dc,
output dd,
output de,
output df,
output dg);



// this would be more compact with a Karnaugh map for each segment da - dg
// writing this way for readability
wire zero, one, two, three, four, five, six, seven, eight, nine;
assign zero = ~s3&~s2&~s1&~s0;
assign one = ~s3&~s2&~s1& s0;
assign two = ~s3&~s2& s1&~s0;
assign three = ~s3&~s2& s1& s0;
assign four = ~s3& s2&~s1&~s0;
assign five = ~s3& s2&~s1& s0;
assign six = ~s3& s2& s1&~s0;
assign seven = ~s3& s2& s1& s0;
assign eight = s3&~s2&~s1&~s0;
assign nine = s3&~s2&~s1& s0;
assign ten = s3&~s2& s1&~s0;
assign eleven = s3&~s2& s1& s0;
assign twelve = s3& s2&~s1&~s0;
assign thirteen = s3& s2&~s1& s0;
assign fourteen = s3& s2& s1&~s0;
assign fifteen = s3& s2& s1& s0;

assign da = zero | two | three | five | six | seven | eight | nine | ten | fourteen | fifteen;
assign db = zero | one | two | three | four | seven | eight | nine | ten | thirteen;
assign dc = zero | one | three | four | five | six | seven | eight | nine | ten | eleven | thirteen ;
assign dd = zero | two | three | five | six | eight | eleven | twelve | thirteen | fourteen ;
assign de = zero | two | six | eight | ten | eleven | twelve | thirteen | fourteen | fifteen ;
assign df = zero | four | five | six | eight | nine | ten | eleven | fourteen | fifteen ;
assign dg = two | three | four | five | six | eight | nine | ten | eleven | twelve | thirteen | fourteen | fifteen ;

endmodule