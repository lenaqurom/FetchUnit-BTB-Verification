
class btb_base_test extends uvm_test;
 
  `uvm_component_utils(btb_base_test)
 
  //---------------------------------------
  // env instance
  //---------------------------------------
  btb_env environment;
 
  //---------------------------------------
  // constructor
  //---------------------------------------
  function new(string name = "btb_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new
 
  //---------------------------------------
  // build_phase
  //---------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
 
    // Create the btb_env
    environment = btb_env::type_id::create("environment", this);
  endfunction : build_phase
 
  //---------------------------------------
  // end_of_elobaration phase
  //---------------------------------------  
  function void end_of_elaboration();
    //print's the topology
    print();
  endfunction

   task run_phase(uvm_phase phase);
//     super.run_phase(phase); 
    `uvm_info("TEST_CLASS","Run Phase!", UVM_HIGH); 
  endtask
 
 
  //---------------------------------------
  // end_of_elobaration phase
  //---------------------------------------  
  function void report_phase(uvm_phase phase);
    uvm_report_server svr;
    super.report_phase(phase);
 
    svr = uvm_report_server::get_server();
    if (svr.get_severity_count(UVM_FATAL) + svr.get_severity_count(UVM_ERROR) > 0) begin
      `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
      `uvm_info(get_type_name(), "----            TEST FAIL          ----", UVM_NONE)
      `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    end else begin
      `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
      `uvm_info(get_type_name(), "----           TEST PASS           ----", UVM_NONE)
      `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    end
  endfunction
 
endclass : btb_base_test
 
