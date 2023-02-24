#VHDL FSM Example
fsm:
	ghdl -a fsmBehav.vhd
	ghdl -a fsmBehav_tb.vhd
	ghdl -e fsmBehav_tb
	ghdl -r fsmBehav_tb  --wave=./fsmBehav_tb.ghw --stop-time=150ns
	
verilog: 
	yosys -m ghdl -p 'ghdl fsmBehav.vhd -e fsmBehav; write_verilog fsmBehav.v'	
	
	
clean:
	rm *.o
	rm *.cf
	rm *.ghw
	rm fsmbehav
	rm fsmbehav_tb
