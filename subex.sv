
module subexp ( 
					input logic [2:0] a,b,
					input logic cin,
					output logic [3:0] result);
	logic [2:0] cout;			
adder subexp1 ( 
					.a(a[0]),
					.b(b[0] ^ cin),
					.cin(cin),
					.sum(result[0]),
					.cout(cout[0]));
					
adder subexp2 ( 
					.a(a[1]),
					.b(b[1] ^ cin),
					.cin(cout[0]),
					.sum(result[1]),
					.cout(cout[1]));
					
adder subexp3 ( 
					.a(a[2]),
					.b(b[2] ^ cin),
					.cin(cout[1]),
					.sum(result[2]),
					.cout(cout[2]));
					
adder subexp4 ( 
					.a(0),
					.b(cin),
					.cin(cout[2]),
					.sum(result[3]));

endmodule 			




module adder ( 
		input logic a, b, cin,
		output logic cout, sum);
		
		assign cout = (a & b)  | ((a ^ b ) & cin);
		assign sum = a ^ b ^ cin;
endmodule 