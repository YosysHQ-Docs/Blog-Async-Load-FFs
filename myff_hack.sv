module myff (
	output q,
	input d, clk, arst, rval
);
	// a latch to store the async-load value
	reg latched_rval;
	always @*
		if (arst) latched_rval = rval;

	// a regular FF to store the clocked data value
	reg q_without_reset;
	always @(posedge clk)
		q_without_reset <= d;

	// an asynchronous-reset flip-flop to remember last event
	reg last_event_was_clock;
	always @(posedge clk or posedge arst)
		if (arst) last_event_was_clock <= 0;
		else      last_event_was_clock <= 1;
	
	// output either the latched reset value or clocked data value
	assign q = last_event_was_clock ? q_without_reset : latched_rval;
endmodule
