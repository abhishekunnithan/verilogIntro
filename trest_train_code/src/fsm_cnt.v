`include "src/defines.v"

module fsm_cnt(
input clk,
input rstn,
input [`CNT_W-1:0] cnt,
output fsm_out
);

parameter IDLE = 2'b00;
parameter STATE_1 = 2'b01;
parameter STATE_2 = 2'b10;
parameter FINAL = 2'b11;

reg [1:0] p_state;
reg [1:0] n_state;

always @(posedge clk or negedge rstn)
begin
 if(~rstn)
  p_state <= IDLE;
 else
  p_state <= n_state;
end

always @(*)
begin
 case(p_state)
	 IDLE : 
	        begin
		  if(cnt == 4)
		    n_state <= STATE_1;
		  else
		    n_state <= IDLE;
	        end
	 STATE_1 : 
	        begin
		  if(cnt == 5)
		    n_state <= STATE_2;
		  else
		    n_state <= IDLE;
	        end
	 STATE_2 : 
	        begin
		  if(cnt == 6)
		    n_state <= FINAL;
		  else
		    n_state <= IDLE;
	        end
	 FINAL : 
	        begin
		  n_state <= IDLE;
	        end
  default : n_state <= IDLE;
 endcase
end

assign fsm_out = (p_state == FINAL) ? 1'b1 : 1'b0;

endmodule
