class mon extends uvm_monitor;
	`uvm_component_utils(mon)
	function new(string name="mon",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

