module ex5 (
		input logic cin,
		input logic [2:0] expA,expB,
		input logic [3:0] fractA,fractB,
		output logic [3:0] resultfract,
		output logic [2:0] resultexp,
		input logic signA, signB,
		output logic result_sign,
		output logic [7:0] shifted_manista);
	
logic [6:0] shifted_fract,biggerfract;
logic [7:0] tempfract;
logic [3:0]	temp;
logic [2:0] biggerexp,count;
ex3 lab33 ( 
				.expA(expA),
				.expB(expB),
				.fractA(fractA),
				.fractB(fractB),
				.shifted_fract(shifted_fract));
				
ex2 lab34 (
				.expA(expA),
				.expB(expB),
				.fractA(fractA),
				.fractB(fractB),
				.biggerfract(temp));

assign biggerfract = {1'b1,temp,2'b00};

submanista submanista11 (
									.manistaA(biggerfract),
									.manistaB(shifted_fract),
									.cin(cin ^ signA ^ signB),
									.result(tempfract));
									
ex1 finalexp1 (
					.expA(expA),
					.expB(expB),	
					.finalexp(biggerexp));
					
bit8mux shift11 (.I0(tempfract[6]),		.I1(tempfract[5]),			.I2(tempfract[4]),			.I3(tempfract[3]),		.I4(tempfract[2]),	.I5(tempfract[1]),	.I6(tempfract[0]),	.I7(tempfract[7]),				.sel(count[2:0]),	.f(shifted_manista[7]));
bit8mux shift12 (.I0(tempfract[5]),		.I1(tempfract[4]),			.I2(tempfract[3]),			.I3(tempfract[2]),		.I4(tempfract[1]),	.I5(tempfract[0]),	.I6(1'b0),				.I7(tempfract[6]),				.sel(count[2:0]),	.f(shifted_manista[6]));
bit8mux shift13 (.I0(tempfract[4]),		.I1(tempfract[3]),			.I2(tempfract[2]),			.I3(tempfract[1]),		.I4(tempfract[0]),	.I5(1'b0),				.I6(1'b0),				.I7(tempfract[5]),				.sel(count[2:0]),	.f(shifted_manista[5]));
bit8mux shift14 (.I0(tempfract[3]),		.I1(tempfract[2]),			.I2(tempfract[1]),			.I3(tempfract[0]),		.I4(1'b0),				.I5(1'b0),				.I6(1'b0),				.I7(tempfract[4]),				.sel(count[2:0]),	.f(shifted_manista[4]));
bit8mux shift15 (.I0(tempfract[2]),		.I1(tempfract[1]),			.I2(tempfract[0]),			.I3(1'b0),					.I4(1'b0),				.I5(1'b0),				.I6(1'b0),				.I7(tempfract[3]),				.sel(count[2:0]),	.f(shifted_manista[3]));
bit8mux shift16 (.I0(tempfract[1]),		.I1(tempfract[0]),			.I2(1'b0),						.I3(1'b0),					.I4(1'b0),				.I5(1'b0),				.I6(1'b0),				.I7(tempfract[2]),				.sel(count[2:0]),	.f(shifted_manista[2]));
bit8mux shift17 (.I0(tempfract[0]),		.I1(1'b0),						.I2(1'b0),						.I3(1'b0),					.I4(1'b0),				.I5(1'b0),				.I6(1'b0),				.I7(tempfract[1]),				.sel(count[2:0]),	.f(shifted_manista[1]));
bit8mux shift18 (.I0(1'b0),				.I1(1'b0),						.I2(1'b0),						.I3(1'b0),					.I4(1'b0),				.I5(1'b0),				.I6(1'b0),				.I7(tempfract[0]),				.sel(count[2:0]),	.f(shifted_manista[0]));

always_comb begin  
	case (count)
		3'b111 : resultexp = biggerexp + 1;
		default : resultexp = biggerexp - count;
	endcase 
end 
assign resultfract = shifted_manista[6:3];
assign count[2] = (~tempfract[6] & ~tempfract[5] & ~tempfract[4] & ~tempfract[3] & tempfract[0]) | (~tempfract[6] & ~tempfract[5] & ~tempfract[4] & ~tempfract[3] & tempfract[1]) | (~tempfract[6] & ~tempfract[5] & ~tempfract[4] & ~tempfract[3] & tempfract[2]) | (tempfract[7]);
assign count[1] = (~tempfract[6] & ~tempfract[5] & tempfract[3]) | (~tempfract[6] & ~tempfract[5] & tempfract[4]) | (tempfract[7]);
assign count[0] = (~tempfract[6] & ~tempfract[4] & ~tempfract[2] & tempfract[1]) | (~tempfract[6] & ~tempfract[4] & tempfract[3]) | (~tempfract[6] & tempfract[5]) | (tempfract[7]);




always_comb begin 
	if (temp == fractA)
		result_sign = signA;
	else 
		result_sign = signB ^ cin;
end

endmodule 