class btb_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(btb_scoreboard)

  //---------------------------------------
  // Port to receive transactions from the btb_monitor
  //---------------------------------------
  uvm_analysis_imp #(btb_seq_item, btb_scoreboard) scoreboard_port;

  //---------------------------------------
  // Internal storage for transactions
  //---------------------------------------
  btb_seq_item exp_trans_q[$];
  btb_seq_item act_trans_q[$];
  virtual btb_interface vif;

  //---------------------------------------
  // Constructor
  //---------------------------------------
  function new(string name = "btb_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH);
  endfunction

  //---------------------------------------
  // Build phase
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH);
    scoreboard_port = new("scoreboard_port", this);
    if (!(uvm_config_db#(virtual btb_interface)::get(this, "", "vif", vif))) begin
      `uvm_fatal(get_type_name(), "Unable to get the interface!")
    end
  endfunction

  //---------------------------------------
  // Connect phase
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH);
  endfunction

  //---------------------------------------
  // Write method
  //---------------------------------------
  function void write(btb_seq_item item);
    $display("btb_scoreboard : inside write method");
    act_trans_q.push_back(item);
  endfunction

  //---------------------------------------
  // Run phase
  //---------------------------------------
  task run_phase(uvm_phase phase);
    fork
      #10;
    join_none
  endtask

endclass : btb_scoreboard
