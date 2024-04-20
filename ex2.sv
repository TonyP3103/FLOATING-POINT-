module ex2 (
			input logic [2:0] expA,expB,
			input logic [3:0] fractA, fractB,
			output logic [3:0] biggerfract,smallerfract);
			
			logic [3:0] expdiff;
		logic [4:0] fractdiff;
ex1 lab3 ( 
				.expA(expA),
				.expB(expB),
				.expdiff(expdiff));
				
subfract lab31 (
				.fractA(fractA),
				.fractB(fractB),
				.cin(1'b1),
				.result(fractdiff));
				
always @* begin 
	if (expdiff == 0) begin 
		if (fractdiff[4] == 0) begin 	
		biggerfract = fractA;
		smallerfract = fractB;
		end 
		else begin
		biggerfract = fractB;
		smallerfract = fractA;
		end 
		end 
	else if (expdiff[3] == 0) begin	
			biggerfract = fractA;
			smallerfract = fractB;
			end
			else begin
			biggerfract = fractB;
			smallerfract = fractA;
			end
			end 

			endmodule

		