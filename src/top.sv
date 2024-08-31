module top (
    input logic clk,
    input logic rst_n,
    input logic button_mode,
    input logic button_up,
    input logic button_down,
    output logic [6:0] s_ones,
    output logic [6:0] s_tens,
    output logic [6:0] m_ones,
    output logic [6:0] m_tens,
    output logic [6:0] h_ones,
    output logic [6:0] h_tens 
);
//---------------------------------
logic [5:0] second_temp;
logic [5:0] minute_temp;
logic [4:0] hour_temp;
clock clock_dut (
    .clk(clk),
    .rst_n(rst_n),
    .button_mode(button_mode),
    .button_up(button_up),
    .button_down(button_down),
    .second(second_temp),
    .minute(minute_temp),
    .hour(hour_temp)
);
//---------------------------------
logic [3:0] de_s0;
logic [3:0] de_s1;
logic [3:0] de_m0;
logic [3:0] de_m1;
logic [3:0] de_h0;
logic [3:0] de_h1;
binary_gen b0 (
    .second(second_temp),
    .minute(minute_temp),
    .hour(hour_temp),
    .second_ones(de_s0),
    .second_tens(de_s1),
    .minute_ones(de_m0),
    .minute_tens(de_m1),
    .hour_ones(de_h0),
    .hour_tens(de_h1)
);
//---------------------------------
hexled_timer h0 (
    .bin0(de_s0),
    .bin1(de_s1),
    .bin2(de_m0),
    .bin3(de_m1),
    .bin4(de_h0),
    .bin5(de_h1),
    .hex0(s_ones),
    .hex1(s_tens),
    .hex2(m_ones),
    .hex3(m_tens),
    .hex4(h_ones),
    .hex5(h_tens)
);
//---------------------------------
endmodule 