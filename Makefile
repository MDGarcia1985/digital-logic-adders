RTL = Verilog/RegisterTransferLevel
TB  = Verilog/TestBenches

sim-half:
	iverilog -o sim $(RTL)/HalfAdder.v $(TB)/HalfAdder_tb.v
	vvp sim

sim-full:
	iverilog -o sim $(RTL)/FullAdder.v $(TB)/FullAdder_tb.v
	vvp sim

sim-2bit:
	iverilog -o sim $(RTL)/TwoBitAdder.v $(TB)/TwoBitAdder_tb.v
	vvp sim

sim-4bit:
	iverilog -o sim $(RTL)/FullAdder.v $(RTL)/FourBitRippleAdder.v $(TB)/FourBitRippleAdder_tb.v
	vvp sim

sim-alu:
	iverilog -o sim $(RTL)/HalfAdder.v $(RTL)/FullAdder.v $(RTL)/FourBitRippleAdder.v $(RTL)/ALU.v $(TB)/ALU_tb.v
	vvp sim

clean:
	del sim sim.vcd *.vcd 2>nul || true
