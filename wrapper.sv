module wrapper (
	input logic [9:0] SW,
	output logic [7:0] LEDR,
	input logic [3:0] KEY,
	input logic CLOCK_50);

logic [7:0] tempA,tempB,tempA_ff;	

	D_ff8bit A (
					.clk(CLOCK_50),
					.d(SW[7:0]),
					.rst(KEY[2]),
					.EN (KEY[0]),
					.q(tempA));
					
	D_ff8bit B (
					.clk(CLOCK_50),
					.d(SW[7:0]),
					.rst(KEY[2]),
					.EN (KEY[1]),
					.q(tempB));
	
	D_ff8bit A_ff (
					.clk(CLOCK_50),
					.d(tempA),
					.rst(KEY[2]),
					.EN (KEY[1]),
					.q(tempA_ff));
					
ex5 finalform (
					.cin(SW[8]),
					.expA(tempA_ff[6:4]),
					.expB(tempB[6:4]),
					.fractA(tempA_ff[3:0]),
					.fractB(tempB[3:0]),
					.signA(tempA_ff[7]),
					.signB(tempB[7]),
					.result_sign(LEDR[7]),
					.resultexp(LEDR[6:4]),
					.resultfract(LEDR[3:0]));
					
endmodule
