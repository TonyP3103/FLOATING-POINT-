module bit8mux (
			input logic I0,I1,I2,I3,I4,I5,I6,I7,
			input logic [2:0] sel,
			output logic f);
			
always @* begin 
case (sel)  
		3'b000: f = I0;
		3'b001: f = I1;
		3'b010: f = I2;
		3'b011: f = I3;
		3'b100: f = I4;
		3'b101: f = I5;
		3'b110: f = I6;
		3'b111: f = I7;
endcase 
end 
endmodule
	
	