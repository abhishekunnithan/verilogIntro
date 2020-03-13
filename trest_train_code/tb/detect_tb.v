
`include "src/defines.v"

module detect_tb();
reg clk, rstn;
reg d_in;
wire pulse;

detect_r dut0(.clk(clk), .rstn(rstn), .d_in(d_in), .detect(pulse));

initial
begin
 clk = 0;
 forever #5 clk = ~clk;
end

initial
begin
 $dumpfile("detect_r.vcd");
 $dumpvars(0,detect_tb);

 rstn = 0;
 d_in = 0;
 #20; rstn = 1;

 #100;
 @(posedge clk);
 d_in = 1'b1;
 #100;
 d_in = 1'b0;
 #200;
 @(posedge clk);
 d_in = 1'b1;
 #200;
 @(posedge clk);
 d_in = 1'b0;

 #500;
 $display("\n**************************\n");
 $display("finishing RUN ... Good Bye \n");
 $display("\n**************************\n");
 $finish;
end

endmodule
