class btb_agent extends uvm_agent;
  `uvm_component_utils(btb_agent)

  btb_seqcr seqr;
  btb_driver driver_m;
  btb_monitor monitor_m;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqr = btb_seqcr::type_id::create("seqr", this);
    driver_m = btb_driver::type_id::create("driver_m", this);
    monitor_m = btb_monitor::type_id::create("monitor_m", this);
  endfunction : build_phase 

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver_m.seq_item_port.connect(seqr.seq_item_export);
  endfunction : connect_phase 
endclass : btb_agent
