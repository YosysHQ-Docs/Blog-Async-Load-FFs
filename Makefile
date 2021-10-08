#!/bin/bash

run: run0 run1 run2 run3

run0: sim0
	./sim0

run1: sim1
	./sim1

run2: sim2
	./sim2

run3: sim3
	./sim3

sim0: tb.sv dut.sv
	iverilog -g2012 -o $@ -s tb $^

sim1: tb.sv dut.sv
	iverilog -g2012 -o $@ -s tb -DDOUBLE_ARST $^

sim2: tb.sv dut_myff.sv myff_udp.sv
	iverilog -g2012 -o $@ -s tb $^

sim3: tb.sv dut_myff.sv myff_force.sv
	iverilog -g2012 -o $@ -s tb $^

clean:
	rm -f sim[0-9] sim.vcd

.PHONY: run clean
