class btb_monitor extends uvm_monitor;
  `uvm_component_utils(btb_monitor)

  // Virtual Interface
  virtual btb_interface vif;

  //------------------------------------------------------------------

  // analysis port, to send the transaction to scoreboard
  uvm_analysis_port #(btb_seq_item) item_collected_port;


  // The following property holds the transaction information currently
  // begin captured (by the collect_address_phase and data_phase methods).

  btb_seq_item    trans_collected;


  // New - Constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new


  // build_phase - getting the interface handle

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    trans_collected = new();
    item_collected_port = new("item_collected_port", this);
    if (!uvm_config_db#(virtual btb_interface)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
  endfunction : build_phase

  // run_phase - convert the signal level activity to transaction level.
  // i.e, sample the values on interface signal ans assigns to transaction class fields

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
     `uvm_info(get_type_name(), "We are at the btb_monitor", UVM_NONE)

    forever begin
      @(posedge vif.clk);
      // trans_collected.scan_mode =  vif.scan_mode;
      `uvm_info(get_type_name(), "Data sent to Scoreboard", UVM_NONE)
      trans_collected.print();
      item_collected_port.write(trans_collected);
    end
  endtask
endclass
