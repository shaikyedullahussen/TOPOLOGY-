class agent_top extends uvm_env;
	`uvm_component_utils(agent_top)
	agent a[];
	int no_of_agents;
	function new(string name="agent_top",uvm_component parent);
		super.new(name,parent);
	endfunction
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(int)::get(this,"","int",no_of_agents))
			`uvm_fatal("error",get_type_name())
		a=new[no_of_agents];
		foreach(a[i])
			a[i]=agent::type_id::create($sformatf("a[%0d]",i),this);
	endfunction
	
endclass
