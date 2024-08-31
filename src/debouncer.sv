
module debouncer
    // Parameters section
    #(parameter CLOCK_FREQ     = 50_000_000, //the same as the board default clock
      parameter STABLE_TIME_ms = 10
    ) 
    // Ports section
    (
    input logic  clk,
	input logic rst_n,
	input logic i_debounce,
    output logic o_debounce
    );
	
    localparam COUNTER_MAX = (CLOCK_FREQ*STABLE_TIME_ms)/1000;  

	// Internal logic 
	logic [1:0] ff_i;
	logic       ff_o;
	logic       [23:0] counter; // more than enough for most frequencies

	logic clear_counter;
    logic counter_max;
	
	// Run the button through two flip-flops to avoid metastability issues
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			ff_i <= 0;
		end else begin
			ff_i[1:0] <= {ff_i[0], i_debounce};
		end
	end	

	assign clear_counter = ^ff_i;
	
	// Create the counter. 
    // For a freq of 50MHz a 19bit counter will create a time period
    // to validate the button's stability of 50mil/2**19
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			counter <= 0;
		end else if (clear_counter || counter_max) begin
			counter <= 0;
		end else begin
			counter <= counter + 1'b1;
        end
	end

    assign counter_max = (counter == COUNTER_MAX);

    // Create the output data logic
    always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			ff_o <= 0;
		end else if(counter_max) begin
			ff_o <= ff_i[1];
		end
	end

	assign o_debounce = ff_o;

endmodule