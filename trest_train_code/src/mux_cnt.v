`include "src/defines.v"

module mux_cnt(
input [`CNT_W-1:0] cnt,
output muxout
);

reg muxout;

always @(*)
begin
 case(cnt[`CNT_W-1:`CNT_W-2])
  2'b00 : muxout <= cnt[0];
  2'b01 : muxout <= cnt[1];
  2'b10 : muxout <= cnt[2];
  2'b11 : muxout <= cnt[3];
  default : muxout <= 1'b0;
 endcase
end

endmodule
