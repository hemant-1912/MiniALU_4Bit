# MiniALU_4Bit

This project implements a simple 4-bit Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU performs one of the following operations based on a 2-bit opcode:
- Addition
- Subtraction
- Bitwise AND
- Bitwise OR

## 🧠 Functionality

The ALU takes two 4-bit inputs `A` and `B`, and a 2-bit `opcode` that selects which operation to perform. It uses a demultiplexer to enable the corresponding module for each operation.

### Opcode Table

| Opcode | Operation   |
|--------|-------------|
| 00     | Addition    |
| 01     | Subtraction |
| 10     | AND         |
| 11     | OR          |

## 🔧 Modules

- `alu_4bit.v`: Top-level module that connects all components.
- `demux`: Selects which operation to perform.
- `adder`: Performs 4-bit addition.
- `subtractor`: Performs 4-bit subtraction.
- `andgate`: Performs bitwise AND operation.
- `orgate`: Performs bitwise OR operation.

## 📂 Files Included

- `alu_4bit.v` - Main Verilog file containing all modules.
- `README.md` - Project documentation.

## 🛠️ Tools Used

- **Xilinx Vivado** (for design, simulation, and synthesis)
- **Verilog HDL** (for hardware description)

## 🚀 How to Run

1. Open Vivado and create a new project.
2. Add `alu_4bit.v` to the project.
4. Simulate using your own testbench.
5. Optionally, synthesize and implement the design for FPGA deployment.

## 🙌 Author

👨‍💻 **Hemant**  
2nd Year B.Tech ECE Student | Enthusiast in Digital Design & VLSI 

---

Feel free to ⭐ the repo if you find it useful!
