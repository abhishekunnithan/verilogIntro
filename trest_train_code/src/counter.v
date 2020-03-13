`include "src/defines.v"

module counter(
input clk, rstn,
output [`CNT_W-1:0] cnt
);
reg [`CNT_W-1:0] cnt_i;
reg k;

always @(posedge clk or negedge rstn)
begin
 if(~rstn)
  begin
  cnt_i <= 0;
  k <= 0;
  end
 else
  begin
  cnt_i <= cnt_i + 1;
  k <= &(cnt_i);
  end
end

assign cnt = cnt_i;

endmodule


 
