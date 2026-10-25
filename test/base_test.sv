class base_test extends uvm_test;
	`uvm_component_utils(base_test)	
	env_config e_cfg;
	agent_config a_cfg[];
	virtual sr_if vif;
	bit has_agent=1;
	int no_of_agents=2;
	env ev;
	
	function new(string name="base_test",uvm_component parent);
		super.new(name,parent);
	endfunction
	function void config_agent();	
		e_cfg.has_agent=has_agent;
		if(!uvm_config_db#(virtual sr_if)::get(this,"","vif",vif))
				`uvm_fatal("error","error")
		foreach(a_cfg[i])begin
			a_cfg[i].vif=vif;
			e_cfg.a_cfg[i]=a_cfg[i];
		end

		uvm_config_db#(int)::set(this,"*","int",no_of_agents);
		uvm_config_db#(env_config)::set(this,"*","env_config",e_cfg);
					
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		e_cfg=env_config::type_id::create("e_cfg");
		e_cfg.a_cfg=new[no_of_agents];// dynamic assigment for  env config lo unna a_cfg 
				
		a_cfg=new[no_of_agents];//change/////////////////////////
		if(has_agent==1)
			begin
			foreach(a_cfg[i])
				begin
				a_cfg[i]=agent_config::type_id::create($sformatf("a_cfg[%0d]",i));
				
				if(i==0)
					a_cfg[i].is_active=UVM_ACTIVE;
				else
					a_cfg[i].is_active=UVM_PASSIVE;
				end
			
			end
		config_agent();
		ev=env::type_id::create("ev",this);
	endfunction
	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();
	endfunction

endclass

