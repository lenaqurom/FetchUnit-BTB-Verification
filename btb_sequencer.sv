
class btb_seqcr extends uvm_sequencer#(btb_seq_item);
  `uvm_component_utils(btb_seqcr)
  
  function new(string name = "btb_seqcr", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
endclass
