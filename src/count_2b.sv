module count_2b (
    input logic clk,
    input logic sec_en,
    input logic rst_n,
    output logic [1:0] mode
);
//
/* Reset register */
always_ff@(posedge clk or negedge rst_n) begin 
    if (!rst_n) begin 
        mode <= 2'b00;
    end
    else begin 
        if (sec_en) begin
            mode <= mode + 1;
        end
    end
end
endmodule 