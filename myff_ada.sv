module myff (
	output reg q,
	input d, clk, arst, rval
);
	always_ff @(posedge clk or posedge arst)
		if (arst) q <= rval;
		else      q <= d;
`ifndef SYNTHESES
	always @(arst)
		if (arst) assign q = rval;
		else    deassign q;
`endif
endmodule
