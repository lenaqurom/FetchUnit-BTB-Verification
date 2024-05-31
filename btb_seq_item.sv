
class btb_seq_item extends uvm_sequence_item;

  rand logic PCSrcE;
  rand logic [31:0] PCTargetE;
  logic [31:0] InstrD,PCD,PCPlus4D;
  rand logic [31:0] BrAddress,FedAddress;
  logic [31:0] BTBOut;
  logic BTBHit;
  rand bit scan_mode;
  rand bit [31:0] BrAddr; 
  rand bit FedToken;


  function new(string name = "btb_seq_item");
    super.new(name);
  endfunction
  
  `uvm_object_utils_begin(btb_seq_item)
    `uvm_field_int(PCSrcE,UVM_ALL_ON)
    `uvm_field_int(PCTargetE,UVM_ALL_ON)
    `uvm_field_int(InstrD,UVM_ALL_ON)
    `uvm_field_int(PCD,UVM_ALL_ON)
    `uvm_field_int(PCPlus4D,UVM_ALL_ON)
    `uvm_field_int(BrAddress,UVM_ALL_ON)
    `uvm_field_int(FedAddress,UVM_ALL_ON)
    `uvm_field_int(BTBOut,UVM_ALL_ON)
    `uvm_field_int(BTBHit,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function void display();
        $display("PCSrcE: %0h, PCTargetE: %0h, InstrD: %0h, PCD: %0h, PCPlus4D: %0h, BrAddress: %0h, FedAddress: %0h, BTBOut: %0h, BTBHit: %0h,", 
                 PCSrcE, PCTargetE, InstrD, PCD, PCPlus4D, BrAddress, FedAddress, BTBOut, BTBHit);
    endfunction

endclass
