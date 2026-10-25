class env_config extends uvm_object;
	`uvm_object_utils(env_config)
	agent_config a_cfg[];  // i  removed the [2]

	bit has_agent=1;
	bit has_sc=1;

	function new(string name="env_config");
		super.new(name);
	endfunction
endclass

