import calculator.{eval}
import gleam/io
import gleam/list
import gleeunit
import gleeunit/should
import registers.{create_registers}
import types as t

pub fn main() {
  gleeunit.main()
}

pub fn eval_test() {
  let tokens = []
  let registers = create_registers(10)
  eval(tokens, registers)
  |> should.equal(#(t.NilOperand, list.repeat(t.None, 10)))
}

pub fn register_assignment_test() {
  let tokens = [t.Register(1), t.Number(t.Integer(1)), t.Assign]
  let registers = create_registers(10)
  let #(_, registers) = eval(tokens, registers)
  io.debug(registers)

  registers
  |> list.at(0)
  |> should.equal(Ok(t.Some(t.Integer(1))))
}
// "1 1 + 2 +" should not work
