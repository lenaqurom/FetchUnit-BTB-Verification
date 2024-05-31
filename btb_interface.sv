interface btb_interface(input clk);

  logic rst;              // Reset signal
  logic [31:0] BrAddress;       // From Fetch to BTB
  logic [31:0] FedAddress;      // From Decode to BTB
  logic [31:0] BTBOut;          // From BTB to MUX
  logic [0:0]  BTBHit;          // Output from BTB indicating hit or miss
  logic [5:0]  BrAddr;          // Branch address from Fetch to BHT
  logic [0:0]  BHTOut;          // Output from BHT to MUX
  logic [0:0]  FedToken;        // Feedback token from Decode to BHT
  logic [31:0] Adr_Out;         // Output from 32-bit adder to MUX
  logic [31:0] Pc_Out;          // Output from MUX to Fetch

  //---------------------------------------
  // Driver clocking block
  //---------------------------------------
  clocking cb_driver @(posedge clk);
    input rst;
    
    output BrAddress, FedAddress, BrAddr, FedToken;
    input BTBOut, BHTOut, Pc_Out, BTBHit;
  endclocking

  //---------------------------------------
  // Monitor clocking block
  //---------------------------------------
  clocking cb_monitor @(posedge clk);
    input rst;
    input BrAddress, FedAddress, BrAddr, FedToken;
    input BTBOut, BHTOut, Pc_Out, BTBHit;
  endclocking

  //---------------------------------------
  // Driver modport
  //---------------------------------------
  modport btb_driver (
    clocking cb_driver,
    input clk
  );
  //---------------------------------------
  // Monitor modport
  //---------------------------------------
  modport btb_monitor (
    clocking cb_monitor,
    input clk
  );

endinterface
