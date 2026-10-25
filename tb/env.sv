class env extends uvm_env;
	`uvm_component_utils(env)
	agent_top a_top;
	env_config e_cfg;
	function new(name="env",uvm_component parent);
			super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(env_config)::get(this,"","env_config",e_cfg))
			`uvm_fatal(get_type_name,"error")
		if(e_cfg.has_agent==1)
			begin
			foreach(e_cfg.a_cfg[i])
			uvm_config_db#(agent_config)::set(this,$sformatf("a_top.a[%0d]",i),"agent_config",e_cfg.a_cfg[i]);
			end
			a_top=agent_top::type_id::create("a_top",this);
		
	endfunction
endclass

