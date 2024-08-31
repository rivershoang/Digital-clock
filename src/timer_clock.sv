module timer_clock (
    input logic clk, // Clock 50Mhz from kit de2
    input logic up, // button count up
    input logic down, // button count down
    input logic sec_en, // enable timer clock work in 1hz
    input logic en_5hz, // enable timer clock work in 5hz
    input logic [1:0] mode, // choose mode for timer clock setting
    output logic [5:0] second, // second unit timer clock
    output logic [5:0] minute, // minute unit timer clock
    output logic [4:0] hour // hour unit timer clock 
);
/* Regiter temp */
logic [5:0] second_cnt, minute_cnt;
logic [4:0] hour_cnt;
//----------------------------------------------------------------
//
/* always_ff@(posedge clk) begin 
    if (!rst_n) begin
        second_cnt <= 0;
        minute_cnt <= 0;
        hour_cnt <= 0;
    end
    else begin 
        second_cnt <= second_cnt;
        minute_cnt <= minute_cnt;
        hour_cnt <= hour_cnt; 
    end
end
*/
/* Second unit working */
always_ff@(posedge clk) begin 
    if (sec_en) begin 
        if (second_cnt == 6'd59)  second_cnt <= 0; 
        else second_cnt <= second_cnt + 1'b1; 
    end
    else if ((mode == 2'b01) && (en_5hz)) begin 
        if (!up) begin 
            if (second_cnt == 6'd59) second_cnt <= 0;
            else second_cnt <= second_cnt + 1'b1; 
        end
        else if (!down) begin 
            if (second_cnt == 0) second_cnt <= 6'd59;
            else second_cnt <= second_cnt - 1'b1; 
        end
    end
end
//----------------------------------------------------------------
/* Minute unit working */
always_ff@(posedge clk) begin 
    if ((sec_en) && (second_cnt == 6'd59)) begin 
        if (minute_cnt == 6'd59) minute_cnt <= 0;
        else minute_cnt <= minute_cnt + 1'b1; 
    end
    else if ((mode == 2'b10) && (en_5hz)) begin 
        if (!up) begin 
            if (minute_cnt == 6'd59) minute_cnt <= 0;
            else minute_cnt <= minute_cnt + 1'b1;
        end
        else if (!down) begin 
            if (minute_cnt == 0) minute_cnt <= 6'd59;
            else minute_cnt <= minute_cnt - 1'b1;
        end
    end
end
//----------------------------------------------------------------
/* Hour unit working */
always_ff@(posedge clk) begin 
    if ((sec_en) && (second_cnt == 6'd59) && (minute_cnt == 6'd59)) begin
        if (hour_cnt == 5'd23) hour_cnt <= 0;
        else hour_cnt <= hour_cnt + 1'b1;
    end
    else if ((mode == 2'b11) && (en_5hz)) begin 
        if (!up) begin
            if (hour_cnt == 5'd23) hour_cnt <= 0;
            else hour_cnt <= hour_cnt + 1'b1; 
        end
        else if (!down) begin 
            if (hour_cnt == 0) hour_cnt <= 5'd23;
            else hour_cnt <= hour_cnt - 1'b1; 
        end
    end
end
//----------------------------------------------------------------
/* output */
assign second = second_cnt;
assign minute = minute_cnt;
assign hour = hour_cnt;
//----------------------------------------------------------------
endmodule  

