```
$ export TOP=...          // add project path to bash script
$ source ~/.bashrc        // source bash script to update project path
$
$ make clean              // delete all existing test executables
$ make all                // compile all tests
$ make DUT_test           // compile select DUT
$ ./DUT_test              // run all test cases for DUT
$ ./DUT_test +test-case=# // run specific test case # for DUT
```