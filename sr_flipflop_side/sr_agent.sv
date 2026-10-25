class agent extends uvm_agent;
	`uvm_component_utils(agent)
	drv drvs;
	mon mons;
	seqr seqrs;
	agent_config a_cfg;

	function new(string name="agent",uvm_component parent);
		super.new(name,parent);
	endfunction
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(agent_config)::get(this,"","agent_config",a_cfg))
			`uvm_fatal("error","getting")
		mons=mon::type_id::create("mons",this);
		if(a_cfg.is_active==UVM_ACTIVE)
			begin
			drvs=drv::type_id::create("drvs",this);
			seqrs=seqr::type_id::create("seqrs",this);
			end
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		if(a_cfg.is_active==UVM_ACTIVE)
			drvs.seq_item_port.connect(seqrs.seq_item_export);
	endfunction
endclass



