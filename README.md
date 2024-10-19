# Floating Point Arithmetic Unit in Verilog

## Overview

This project implements a Floating Point Arithmetic Unit (FPU) using Verilog. The FPU is capable of performing addition, subtraction, multiplication, and division of floating point numbers, as well as comparison operations. The design includes multiple sub-modules, each responsible for a specific arithmetic operation, and an ALU module that selects the appropriate operation based on the input opcode.

## Features

- **Add_Sub Module:** Performs addition and subtraction of floating point numbers.
- **Mult Module:** Multiplies two floating point numbers.
- **Div Module:** Divides one floating point number by another.
- **Compare Module:** Compares two floating point numbers to determine if they are equal, less than, or greater than each other.
- **ALU Module:** A top-level module that integrates all the sub-modules and selects the appropriate operation based on the given opcode.