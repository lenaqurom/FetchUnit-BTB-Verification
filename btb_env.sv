class btb_env extends uvm_env;
 
    //---------------------------------------
    // btb_agent and btb_scoreboard instance
    //---------------------------------------
    btb_agent      Agent;
    btb_scoreboard Scoreboard;
    //subscriber sbc;
     
    `uvm_component_utils(btb_env)
     
    //---------------------------------------
    // constructor
    //---------------------------------------
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new
     
    //---------------------------------------
    // build_phase - create the components
    //---------------------------------------
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        Agent = btb_agent::type_id::create("Agent", this);
        Scoreboard  = btb_scoreboard::type_id::create("Scoreboard", this);
        // sbc  = subscriber::type_id::create("sbc", this);
      endfunction : build_phase
     
    //---------------------------------------
    // connect_phase - connecting btb_monitor and btb_scoreboard port
    //---------------------------------------
    function void connect_phase(uvm_phase phase);
        Agent.monitor_m.item_collected_port.connect(Scoreboard.scoreboard_port);
        // Agent.btb_monitor.item_collected_port.connect(sbc.analysis_export);
    endfunction : connect_phase
     
    endclass:btb_env
    
