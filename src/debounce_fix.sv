module debounce_fix (
    input logic clk,
    input logic in,
    output logic out
);
logic flipflop;
//
always_ff@(posedge clk) begin 
    flipflop <= in; 
    end  
//
assign out = (~flipflop) & in;
endmodule 