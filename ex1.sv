module ex1 (
	input logic [2:0] expA,expB,
	output logic [3:0] expdiff,
	output logic [2:0] finalexp);
	
subexp subexp01 (
						.a(expA),
						.b(expB),
						.cin(1'b1),
						.result (expdiff));
						
always @* begin 
if (expdiff[3] == 0 ) 
			finalexp = expA;
else
			finalexp = expB;
end 
endmodule
