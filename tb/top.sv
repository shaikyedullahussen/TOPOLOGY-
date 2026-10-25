module top;
		import uvm_pkg::*;
		import pkg::*;

	`include "uvm_macros.svh"
	bit clk=0;
	always
		#10 clk=!clk;
		sr_if in0(clk);
		
	
	initial begin
		uvm_config_db#(virtual sr_if)::set(null,"*","vif",in0);

		run_test();
	end
endmodule

