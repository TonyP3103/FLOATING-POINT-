module ex3 (
	input logic [2:0] expA,expB,
	input logic [3:0] fractA,fractB,
	output logic [6:0] shifted_fract);
	
	logic [3:0] smallerfract;
	logic [3:0] expdiff;
	logic [3:0] count;
ex2 lab32 (
				.expA(expA),
				.expB(expB),
				.fractA(fractA),
				.fractB(fractB),
				.smallerfract(smallerfract));
				
ex1 lab3 ( 
				.expA(expA),
				.expB(expB),
				.expdiff(expdiff));
				
				

always @* begin 
	if (expdiff[3] == 0) 
		count = expdiff;
	else 
		count = -expdiff;
end 

bit8mux shift1 (.I0(1'b1),						.I1(1'b0),							.I2(1'b0),						.I3(1'b0),						.I4(1'b0),					.I5(1'b0),						.I6(1'b0),		.I7(1'b0),						.sel(count[2:0]),.f(shifted_fract[6]));
bit8mux shift2 (.I0(smallerfract[3]),		.I1(1'b1),							.I2(1'b0),						.I3(1'b0),						.I4(1'b0),					.I5(1'b0),						.I6(1'b0),		.I7(1'b0),						.sel(count[2:0]),.f(shifted_fract[5]));
bit8mux shift3 (.I0(smallerfract[2]),		.I1(smallerfract[3]),			.I2(1'b1),						.I3(1'b0),						.I4(1'b0),					.I5(1'b0),						.I6(1'b0),		.I7(1'b0),						.sel(count[2:0]),.f(shifted_fract[4]));
bit8mux shift4 (.I0(smallerfract[1]),		.I1(smallerfract[2]),			.I2(smallerfract[3]),		.I3(1'b1),						.I4(1'b0),					.I5(1'b0),						.I6(1'b0),		.I7(1'b0),						.sel(count[2:0]),.f(shifted_fract[3]));
bit8mux shift5 (.I0(smallerfract[0]),		.I1(smallerfract[1]),			.I2(smallerfract[2]),		.I3(smallerfract[3]),		.I4(1'b1),					.I5(1'b0),						.I6(1'b0),		.I7(1'b0),						.sel(count[2:0]),.f(shifted_fract[2]));
bit8mux shift6 (.I0(1'b0),						.I1(smallerfract[0]),			.I2(smallerfract[1]),		.I3(smallerfract[2]),		.I4(smallerfract[3]),	.I5(1'b1),						.I6(1'b0),		.I7(1'b0),						.sel(count[2:0]),.f(shifted_fract[1]));
bit8mux shift7 (.I0(1'b0),						.I1(1'b0),							.I2(smallerfract[0]),		.I3(smallerfract[1]),		.I4(smallerfract[2]),	.I5(smallerfract[3]),		.I6(1'b1),		.I7(1'b0),						.sel(count[2:0]),.f(shifted_fract[0]));


endmodule 