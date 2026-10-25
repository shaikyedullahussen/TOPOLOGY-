class drv extends uvm_driver#(trans);
	`uvm_component_utils(drv)
	function new(string name="drv",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

