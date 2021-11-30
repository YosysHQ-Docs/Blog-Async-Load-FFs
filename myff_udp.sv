`ifdef SYNTHESES
	module myff (
		output reg q,
		input d, clk, arst, rval
	);
		always_ff @(posedge clk or posedge arst)
			if (arst) q <= rval;
			else      q <= d;
	endmodule
`else
	module myff (
		output q,
		input d, clk, arst, rval
	);
		// wrap myff UDP in myff module because Icarus Verilog
		// does not support array instances of primitives yet
		myff_prim u (q, d, clk, arst, rval);
	endmodule

	primitive myff_prim (q, d, clk, arst, rval);
		input d, clk, arst, rval;
		reg q;
		output q;
		table
		// D C R V : Q : Q'
		   ? ? 1 0 : ? : 0 ; // async reset
		   ? ? 1 1 : ? : 1 ; // async set
		   0 p 0 ? : ? : 0 ; // posedge clock, d=0
		   1 p 0 ? : ? : 1 ; // posedge clock, d=1
		   ? n 0 ? : ? : - ; // negedge clock
		   * ? ? ? : ? : - ; // any data edge
		   ? ? * ? : ? : - ; // any arst edge
		   ? ? ? * : ? : - ; // any rval edge
		endtable
	endprimitive
`endif
