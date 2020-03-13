module detect_r(
input clk, 
input rstn,
input d_in,
output detect
);
reg ff_0, ff_1;

always @(posedge clk or negedge rstn)
begin
 if(~rstn)
  begin
   ff_0 <= 0;
   ff_1 <= 0;
  end
 else
  begin
   ff_0 <= d_in;
   ff_1 <= ff_0;
  end
end

assign detect = ff_0 & ~ff_1;

endmodule


 
