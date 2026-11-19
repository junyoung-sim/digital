task test_case_1_random();
  t.test_case_begin( "test_case_1_random" );

  d = 32'($urandom(t.seed));

  check(1,  d, 0);
  check(0, 'x, d);

endtask
