#!/bin/bash

run: sim0 sim1
	./sim0
	./sim1

sim0:
	iverilog -g2012 -o sim0 -s tb tb.sv dut.sv

sim1:
	iverilog -g2012 -o sim1 -s tb -DDOUBLE_ARST tb.sv dut.sv

clean:
	rm -f sim0 sim1 sim.vcd

.PHONY: run clean
