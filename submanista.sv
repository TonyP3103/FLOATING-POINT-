module submanista (
	input logic [6:0] manistaA,manistaB,
	input logic cin,
	output logic [7:0] result);
	
	
	logic [6:0] cout;
	
adder submanista1 (
						.a(manistaA[0]),
						.b(manistaB[0] ^ cin),
						.cin(cin),
						.cout(cout[0]),
						.sum(result[0]));

adder submanista2 (
						.a(manistaA[1]),
						.b(manistaB[1] ^ cin),
						.cin(cout[0]),
						.cout(cout[1]),
						.sum(result[1]));
						
adder submanista3 (
						.a(manistaA[2]),
						.b(manistaB[2] ^ cin),
						.cin(cout[1]),
						.cout(cout[2]),
						.sum(result[2]));
						
adder submanista4 (
						.a(manistaA[3]),
						.b(manistaB[3] ^ cin),
						.cin(cout[2]),
						.cout(cout[3]),
						.sum(result[3]));
						
adder submanista5 (
						.a(manistaA[4]),
						.b(manistaB[4] ^ cin),
						.cin(cout[3]),
						.cout(cout[4]),
						.sum(result[4]));
						
adder submanista6 (
						.a(manistaA[5]),
						.b(manistaB[5] ^ cin),
						.cin(cout[4]),
						.cout(cout[5]),
						.sum(result[5]));
						
adder submanista7 (
						.a(manistaA[6]),
						.b(manistaB[6] ^ cin),
						.cin(cout[5]),
						.cout(cout[6]),
						.sum(result[6]));
						
adder submanista8 (
						.a(0),
						.b(cin),
						.cin(cout[6]),
						.sum(result[7]));

endmodule 