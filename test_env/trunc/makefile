verilator:
	verilator --binary -j 0 --trace *.v -o ../sim
	./sim
	gtkwave waveform.vcd

iverilog:
	iverilog -o sim.vvp *.v
	vvp sim.vvp
	gtkwave waveform.vcd

cleanator:
	@rm -r ./obj_dir sim *.vcd
	@ls
	@ls
	@ls
	@ls
	@ls

iclean:
	@rm *.vvp *.vcd
	@ls
	@ls
	@ls
	@ls
	@ls
