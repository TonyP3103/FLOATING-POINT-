module subfract (
	input logic [3:0] fractA,fractB,
	input logic cin,
	output logic [4:0] result);
	
	logic [3:0] cout;
	
adder subfract1 (
						.a(fractA[0]),
						.b(fractB[0] ^ cin),
						.cin(cin),
						.cout(cout[0]),
						.sum(result[0]));

adder subfract2 (
						.a(fractA[1]),
						.b(fractB[1] ^ cin),
						.cin(cout[0]),
						.cout(cout[1]),
						.sum(result[1]));
						
adder subfract3 (
						.a(fractA[2]),
						.b(fractB[2] ^ cin),
						.cin(cout[1]),
						.cout(cout[2]),
						.sum(result[2]));
						
adder subfract4 (
						.a(fractA[3]),
						.b(fractB[3] ^ cin),
						.cin(cout[2]),
						.cout(cout[3]),
						.sum(result[3]));
						

adder subfract5 (
						.a(1'b0),
						.b(cin),
						.cin(cout[3]),
						.sum(result[4]));

endmodule 
	
	
	
	
	
