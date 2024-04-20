module ex4 (
	input logic [2:0] expA, expB,
	input logic [3:0] fractA,fractB,
	input logic signA, signB,
	output logic result_sign);

	
	
	logic [3:0] biggerfract;

ex2 big (
			.fractA(fractA),
			.fractB(fractB),
			.expA(expA),
			.expB(expB),
			.biggerfract(biggerfract));

always_comb begin 
	if (biggerfract == fractA)
		result_sign = signA;
	else 
		result_sign = signB;
end
endmodule

