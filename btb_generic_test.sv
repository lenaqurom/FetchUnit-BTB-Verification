class generic_test extends btb_base_test;
  `uvm_component_utils(generic_test)
  // btb_env env1;
  btb_capacity_seq seq0;
  btb_hit_miss_signal_seq seq1;
  btb_hit_seq seq2;
  btb_miss_seq seq3;
  btb_replacement_policy_seq seq4;

  string seq_name = "btb_miss_seq";  // put the name of the test that you want to run..
  function new(string name, uvm_component parent);
    super.new(name, parent);  
     `uvm_info("constructor", "constructor inside generic test", UVM_HIGH);

  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq0  = btb_capacity_seq::type_id::create("seq0");
    seq1  = btb_hit_miss_signal_seq::type_id::create("seq1");
    seq2  = btb_hit_seq::type_id::create("seq2");
    seq3  = btb_miss_seq::type_id::create("seq3");
    seq4  = btb_replacement_policy_seq::type_id::create("Seq4");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("btb_hit_seq", "inside btb_hit_seq", UVM_HIGH);
    case (seq_name)
      //btb_capacity_seq
      "btb_capacity_seq": begin
        seq0  = btb_capacity_seq::type_id::create("seq0");
        phase.raise_objection(this);
        seq0.start(environment.Agent.seqr);
        phase.drop_objection(this);
      end

      //btb_hit_miss_signal_seq
      "btb_hit_miss_signal_seq": begin
        phase.raise_objection(this);
        seq1.start(environment.Agent.seqr);
        phase.drop_objection(this);
      end

      //btb_hit_seq
      "btb_hit_seq": begin
        
        phase.raise_objection(this);
        seq2.start(environment.Agent.seqr);
        phase.drop_objection(this);
      end

      //btb_miss_seq
      "btb_miss_seq": begin
        phase.raise_objection(this);
        seq3.start(environment.Agent.seqr);
        phase.drop_objection(this);
      end

      //btb_replacement_policy_seq
      "btb_replacement_policy_seq": begin
        phase.raise_objection(this);
        seq4.start(environment.Agent.seqr);
        phase.drop_objection(this);
      end

      default:
      `uvm_fatal("INVALID_SEQ_NAME", {
                 "Invalid sequence name provided via command line arguments: ", seq_name})
    endcase
  endtask

endclass
