`include "Reg.v"
`include "TestUtils.v"

module Top();

  // verilator lint_off UNUSED
  logic clk;
  logic rst;
  // verilator lint_on UNUSED

  TestUtils t
  (
    .*
  );

  //==========================================================
  // DUT
  //==========================================================

  logic        en;
  logic [31:0] d;
  logic [31:0] q;

   Reg #(32) reg_dut
  (
    .clk (clk),
    .rst (rst),
    .en  (en),
    .d   (d),
    .q   (q)
  );

  //==========================================================
  // Verification
  //==========================================================

  task check
  (
    logic        _en,
    logic [31:0] _d,
    logic [31:0] _q
  );

    if(!t.failed) begin
      #8;
    
      en = _en;
      d  = _d;
  
      if(t.n != 0) begin
        $display("%3d: en=%b d=%h q=%h (%h)\n",
          t.cycles, en, d, q, _q);
      end

      `CHECK_EQ_HEX(_q, q);
      
      #2;
    end

  endtask

  //==========================================================
  // Test Cases
  //==========================================================

  `include "Reg_test_cases.v"

  //==========================================================
  // Main
  //==========================================================

  initial begin
    t.test_bench_begin(`__FILE__);

    if((t.n <= 0) || (t.n == 1)) test_case_1_random();

    t.test_bench_end();
  end

endmodule
