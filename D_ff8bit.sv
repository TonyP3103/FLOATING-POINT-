module D_ff8bit (
	input logic clk,EN,rst,
	input logic [7:0] d,
	output logic [7:0] q);

always_ff @(negedge rst or posedge clk) begin 
if (!rst) 
  	q <= 0;
 else	if (!EN)
	q <= d;
end 
endmodule 