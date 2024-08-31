module wrapper (
    input logic CLOCK_50,
    input logic [0:0] SW,
    input logic [2:0] KEY,
	 output logic [2:0] LEDG,
    output logic [6:0] HEX0,
    output logic [6:0] HEX1,
    output logic [6:0] HEX2,
    output logic [6:0] HEX3,
    output logic [6:0] HEX4,
    output logic [6:0] HEX5
);
//--------------------------
top t1 (
    .clk(CLOCK_50),
    .rst_n(SW[0]),
    .button_mode(KEY[0]),
    .button_up(KEY[1]),
    .button_down(KEY[2]),
    .s_ones(HEX0),
    .s_tens(HEX1),
    .m_ones(HEX2),
    .m_tens(HEX3),
    .h_ones(HEX4),
    .h_tens(HEX5)
);
assign LEDG = ~KEY;
endmodule 