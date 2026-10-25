package pkg;
	import uvm_pkg::*;
	`include "uvm_macros.svh";
//agent_config.sv  agent.sv  agent_top.sv  drv.sv  mon.sv  seqr.sv  seqs.sv  
	`include "trans.sv"
	`include "seqs.sv"
	`include "agent_config.sv"

	`include "env_config.sv"
	`include "drv.sv"
	`include "mon.sv"
	`include "seqr.sv"
	`include "agent.sv"
	`include "agent_top.sv"
	`include "env.sv"
	`include "base_test.sv"
endpackage

