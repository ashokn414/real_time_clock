module rtcc (
input clk,rst,
output [6:0]hrm,hrl,minm,minl,secm,secl);

wire [3:0]hrms,hrls,minms,minls,secms,secls;
wire hrclr;
assign hrclr = ((secls==4'd9) && (secms==4'd5) && (minls==4'd9) && (minms==4'd5) && (hrls==4'd3) && (hrms==4'd2));
counter #(9) c1(.clk(clk),.rst(rst),.clr(1'b0),.en(1'b1),.count(secls));
counter #(5) c2(.clk(clk),.rst(rst),.clr(1'b0),.en(secls==4'd9),.count(secms));
counter #(9) c3(.clk(clk),.rst(rst),.clr(1'b0),.en((secls==4'd9) && (secms==4'd5)),.count(minls));
counter #(5) c4(.clk(clk),.rst(rst),.clr(1'b0),.en((secls==4'd9) && (secms==4'd5) && (minls==4'd9)),.count(minms));
counter #(9) c5(.clk(clk),.rst(rst),.clr(hrclr),.en((secls==4'd9) && (secms==4'd5) && (minls==4'd9) && (minms==4'd5)),.count(hrls));
counter #(2) c6(.clk(clk),.rst(rst),.clr(hrclr),.en((secls==4'd9) && (secms==4'd5) && (minls==4'd9) && (minms==4'd5) && (hrls==4'd9)),.count(hrms));
bcdto7 b1(.a(hrms[3]),.b(hrms[2]),.c(hrms[1]),.d(hrms[0]),.a1(hrm[6]),.b1(hrm[5]),.c1(hrm[4]),.d1(hrm[3]),.e1(hrm[2]),.f1(hrm[1]),.g1(hrm[0]));
bcdto7 b2(.a(hrls[3]),.b(hrls[2]),.c(hrls[1]),.d(hrls[0]),.a1(hrl[6]),.b1(hrl[5]),.c1(hrl[4]),.d1(hrl[3]),.e1(hrl[2]),.f1(hrl[1]),.g1(hrl[0]));
bcdto7 b3(.a(minms[3]),.b(minms[2]),.c(minms[1]),.d(minms[0]),.a1(minm[6]),.b1(minm[5]),.c1(minm[4]),.d1(minm[3]),.e1(minm[2]),.f1(minm[1]),.g1(minm[0]));
bcdto7 b4(.a(minls[3]),.b(minls[2]),.c(minls[1]),.d(minls[0]),.a1(minl[6]),.b1(minl[5]),.c1(minl[4]),.d1(minl[3]),.e1(minl[2]),.f1(minl[1]),.g1(minl[0]));
bcdto7 b5(.a(secms[3]),.b(secms[2]),.c(secms[1]),.d(secms[0]),.a1(secm[6]),.b1(secm[5]),.c1(secm[4]),.d1(secm[3]),.e1(secm[2]),.f1(secm[1]),.g1(secm[0]));
bcdto7 b6(.a(secls[3]),.b(secls[2]),.c(secls[1]),.d(secls[0]),.a1(secl[6]),.b1(secl[5]),.c1(secl[4]),.d1(secl[3]),.e1(secl[2]),.f1(secl[1]),.g1(secl[0]));

endmodule
