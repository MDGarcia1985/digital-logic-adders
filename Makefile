RTL      := Verilog/RegisterTransferLevel
TB       := Verilog/TestBenches
SIM_OUT  := sim

.PHONY: sim-half sim-full sim-2bit sim-4bit sim-alu clean

sim-half:
	iverilog -o $(SIM_OUT) $(RTL)/HalfAdder.v $(TB)/HalfAdder_tb.v
	vvp $(SIM_OUT)

sim-full:
	iverilog -o $(SIM_OUT) $(RTL)/FullAdder.v $(TB)/FullAdder_tb.v
	vvp $(SIM_OUT)

sim-2bit:
	iverilog -o $(SIM_OUT) $(RTL)/TwoBitAdder.v $(TB)/TwoBitAdder_tb.v
	vvp $(SIM_OUT)

sim-4bit:
	iverilog -o $(SIM_OUT) $(RTL)/FullAdder.v $(RTL)/FourBitRippleAdder.v $(TB)/FourBitRippleAdder_tb.v
	vvp $(SIM_OUT)

sim-alu:
	iverilog -o $(SIM_OUT) $(RTL)/FullAdder.v $(RTL)/FourBitRippleAdder.v $(RTL)/ALU.v $(TB)/ALU_tb.v
	vvp $(SIM_OUT)

clean:
	powershell -NoProfile -Command "Remove-Item -Force -ErrorAction SilentlyContinue '$(SIM_OUT)', 'sim.vcd', '*.vcd'"
