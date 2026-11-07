// SPDX-License-Identifier: SHL-0.51
// AraXL's legacy public interface, independent of its old CVA6 source tree.
package acc_pkg;
  localparam int unsigned TransIdWidth = 3;
  typedef logic [63:0] xlen_t;
  localparam bit RVF = 1;
  localparam bit RVD = 1;
  localparam bit XF16 = 0;
  typedef struct packed {
    logic req_valid;
    logic resp_ready;
    riscv::instruction_t insn;
    xlen_t rs1;
    xlen_t rs2;
    fpnew_pkg::roundmode_e frm;
    logic [TransIdWidth-1:0] trans_id;
    logic store_pending;
    logic acc_cons_en;
    logic inval_ready;
  } accelerator_req_t;
  typedef struct packed {
    logic req_ready;
    logic resp_valid;
    xlen_t result;
    logic [TransIdWidth-1:0] trans_id;
    logic error;
    logic store_pending;
    logic store_complete;
    logic load_complete;
    logic [4:0] fflags;
    logic fflags_valid;
    logic inval_valid;
    logic [63:0] inval_addr;
  } accelerator_resp_t;
endpackage
