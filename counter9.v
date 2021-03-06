module counter9 #(parameter max_value=15) (
input clk,rst,clr,en,
output reg [3:0] count);

always @(posedge clk)
begin
if(rst==0) count <='d0;
else if(clr==1) count<='d0;
else
begin
if(en==1)
if(count==max_value) count<='d0;
else count<=count+1;
else count<=count;
end
end
endmodule


