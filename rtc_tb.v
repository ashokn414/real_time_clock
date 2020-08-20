module rtc_tb();
  reg clk,rst;
  wire [6:0]hrm,hrl,minm,minl,secm,secl;

 rtcc r1(.clk(clk),.rst(rst),.hrm(hrm),.hrl(hrl),.minm(minm),.minl(minl),.secm(secm),.secl(secl));
 
 always #5 clk=~clk;

initial begin
  clk=0;rst=0;
  #20 rst=1;
  #999880 rst=0;
  #100 $finish;
end
endmodule
  
  

