module clock (
    input logic clk, // clock 50Mhz
    input logic rst_n, // negative reset
    input logic button_mode, // button choose mode
    input logic button_up, // button count up
    input logic button_down, // button count down
    output logic [5:0] second, // second unit
    output logic [5:0] minute, // minute unit
    output logic [4:0] hour // hour unit
);
//-------------------------------------------------
logic [1:0] temp_mode; // register temp 
setting_mode_new se0 (
    .clk(clk),
    .rst_n(rst_n),
    .button_mode(button_mode),
    .mode(temp_mode)
);
//-------------------------------------------------
logic temp_up; // register temp
debouncer d0 (
    .clk(clk), 
	 .rst_n(rst_n),
    .i_debounce(button_up),
    .o_debounce(temp_up)
);
//-------------------------------------------------
logic temp_down; // register temp
debouncer d1 (
    .clk(clk),
	 .rst_n(rst_n),
    .i_debounce(button_down),
    .o_debounce(temp_down)
);
//-------------------------------------------------
logic temp_sec; // register temp
sec_en s0 (
    .clk(clk),
    .sec_en(temp_sec)
);
//-------------------------------------------------
logic temp_5hz; // register temp
en_5hz e0 (
    .clk(clk),
    .en_5hz(temp_5hz)
);
//-------------------------------------------------
timer_clock t0 (
    .clk(clk),
    .sec_en(temp_sec),
    .en_5hz(temp_5hz),
    .up(temp_up),
    .down(temp_down),
    .mode(temp_mode),
    .second(second),
    .minute(minute),
    .hour(hour)
);
//-------------------------------------------------
endmodule 
