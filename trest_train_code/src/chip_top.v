`include "src/defines.v"

module chip_top(
input clk, rstn,
output pulse
);
wire [`CNT_W-1:0] cnt;

counter u0(.clk(clk), .rstn(rstn), .cnt(cnt));
comparator u1(.comp_i(cnt), .comp_o(pulse));
//mux_cnt u1(cnt, pulse);
//fsm_cnt u1(clk, rstn,cnt, pulse);

endmodule
