module hexled (
    input logic [3:0] bcd_i,
    output logic [6:0] hex_o
); 
always_comb begin 
	case(bcd_i)
		4'b0000: hex_o= 7'b1000000;//0
		4'b0001: hex_o= 7'b1111001; // 1
		4'b0010: hex_o= 7'b0100100; //2
		4'b0011: hex_o= 7'b0110000; //3
		4'b0100: hex_o= 7'b0011001; //4
		4'b0101: hex_o= 7'b0010010; // 5
		4'b0110: hex_o= 7'b0000010; //6
		4'b0111: hex_o= 7'b1011000; // 7
		4'b1000: hex_o= 7'b0000000; //8
		4'b1001: hex_o= 7'b0010000; //9
		default: hex_o= 7'b1111111; //loi
	endcase 
end
endmodule 