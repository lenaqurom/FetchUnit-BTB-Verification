class btb_driver extends uvm_driver #(btb_seq_item);


  `uvm_component_utils(btb_driver);

  //--------------------------------------- 
  // Virtual Interface
  //--------------------------------------- 
  virtual btb_interface vif;
  btb_seq_item item;
  //--------------------------------------- 
  // Constructor
  //--------------------------------------- 
  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("DRIVER_CLASS","Inside Constructor!", UVM_HIGH); 
  endfunction
  //--------------------------------------- 
  // build phase
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase); 
    `uvm_info("DRIVER_CLASS","Build Phase!", UVM_HIGH);
    if(!(uvm_config_db #(virtual btb_interface)::get(this,"*","vif",vif)))
      begin
        `uvm_error("DRIVER_CLASS", "Failed to get VIF from config DB!");
      end

  endfunction:build_phase
  //--------------------------------------- 
  // connect phase
  //--------------------------------------- 
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase); 
    `uvm_info("DRIVER_CLASS","connect Phase!", UVM_HIGH); 

  endfunction:connect_phase
  //---------------------------------------  
  // run phase
  //---------------------------------------  
  task run_phase(uvm_phase phase);
    super.run_phase(phase); 
    `uvm_info("DRIVER_CLASS","RUN Phase!", UVM_HIGH); 
    forever
     begin
      seq_item_port.get_next_item(item);
    //`uvm_info(get_type_name(), $sformatf("Received itemuest: %s", item.convert2string()), UVM_HIGH);
      drive(item);
      // #10;
      seq_item_port.item_done();
      // #10;
    end
  endtask
  //---------------------------------------
  // drive - transaction level to signal level
  // drives the value's from btb_seq_item to interface signals
  //---------------------------------------
 task drive(btb_seq_item item );
 @(posedge vif.clk);
`uvm_info("inside btb_driver", $sformatf("Driving item with BrAddress: %0h, FedAddress: %0h, BrAddr: %0h, FedToken: %b",
                                        item.BrAddress, item.FedAddress, item.BrAddr, item.FedToken), UVM_LOW);
    vif.BrAddress <= item.BrAddress;
    vif.FedAddress <= item.FedAddress;
    vif.BrAddr <= item.BrAddr;
    vif.FedToken <= item.FedToken;    
  endtask : drive
endclass : btb_driver
