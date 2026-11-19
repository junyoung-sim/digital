from TestUtil import *

#==========================================================

async def reset(dut):
  dut.rst.value = 1
  await RisingEdge(dut.clk)
  dut.rst.value = 0

async def check(dut, rst, en, d, q):
  dut.rst.value = rst
  dut.en.value  = en
  dut.d.value   = d

  await RisingEdge(dut.clk)
  #await Timer(1, unit="ns")

  assert (dut.q.value == q)

#==========================================================

@cocotb.test()
async def test_case_1_random(dut):
  clock = init_clock(dut)

  await reset(dut)
  await check(dut, 0, 1, 0b1111_1111, 0b0000_0000)
  await check(dut, 0, 0, 0b0000_0000, 0b1111_1111)