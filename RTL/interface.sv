interface sr_if(input bit clock);
	logic s;
	logic r;
	logic q;
	logic q0;

clocking drv@(posedge clock);
	default input #1 output #1;
	output s;
	output r;
endclocking

clocking mon@(posedge clock);
	default input #1 output #1;
	input s;
	input r;
	input q;
	input q0;
endclocking

modport DRV(clocking drv);
modport MON(clocking mon);
endinterface



