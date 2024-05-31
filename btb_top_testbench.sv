import uvm_pkg::*;
`include "uvm_macros.svh"
`include "btb_interface.sv"
`include "btb_imports.sv"
import test_pkg::*;

module tb;

  logic clk;

  /* Interface */
  btb_interface vif(.clk(clk));

  /* Design */
  // alu_top dut(  //-----------------------change the name-----------------------
  //   .clk(clk),

  //   .PCSrcE(vif.PCSrcE), 
  //   .PCTargetE(vif.PCTargetE), 
  //   .InstrD(vif.InstrD), 
  //   .PCD(vif.PCD),
  //   .PCPlus4D(vif.PCPlus4D),
  //   .BrAddress(vif.BrAddress),
  //   .FedAddress(vif.FedAddress),
  //   .BTBOut(vif.BTBOut),
  //   .BTBHit(vif.BTBHit)
  // );

  initial begin
    run_test("generic_test");
  end

  initial begin
    uvm_config_db#(virtual btb_interface)::set(null, "", "vif", vif);
  end
  
  initial begin
    clk = 1'b0;
    repeat(5) begin
      @(posedge clk);
    end
  end
  always begin 
    #10ns clk = ~clk;
  end

  /* Dump waveform */
  initial begin                                                                                                                   
    if ($test$plusargs("debussy")) begin
      if($test$plusargs("fsdb")) begin
        $fsdbDumpvars;
        $fsdbDumpfile("debussy.fsdb");
      end
      else begin
        $dumpvars;
        $dumpfile("debussy.fsdb");
      end
    end
  end
endmodule : tb
