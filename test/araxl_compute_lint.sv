// SPDX-License-Identifier: SHL-0.51
package araxl_library_test_axi_pkg;
  `include "axi/typedef.svh"
  typedef logic [47:0] addr_t;
  typedef logic [3:0] id_t;
  typedef logic [1:0] user_t;
  typedef logic [255:0] wide_data_t;
  typedef logic [31:0] wide_strb_t;
  typedef logic [127:0] cluster_data_t;
  typedef logic [15:0] cluster_strb_t;
  `AXI_TYPEDEF_ALL(wide, addr_t, id_t, wide_data_t, wide_strb_t, user_t)
  `AXI_TYPEDEF_ALL(cluster, addr_t, id_t, cluster_data_t, cluster_strb_t, user_t)
endpackage

module araxl_compute_lint import araxl_library_test_axi_pkg::*; (
  input logic clk_i, rst_ni,
  input acc_pkg::accelerator_req_t acc_req_i,
  output acc_pkg::accelerator_resp_t acc_rsp_o,
  output wide_req_t axi_req_o,
  input wide_resp_t axi_rsp_i
);
  ara_cluster #(
    .NrLanes(4), .NrClusters(2), .FPUSupport(ara_pkg::FPUSupportSingleDouble),
    .AxiDataWidth(256), .AxiAddrWidth(48), .ClusterAxiDataWidth(128),
    .axi_ar_t(wide_ar_chan_t), .axi_aw_t(wide_aw_chan_t), .axi_w_t(wide_w_chan_t),
    .axi_b_t(wide_b_chan_t), .axi_r_t(wide_r_chan_t),
    .axi_req_t(wide_req_t), .axi_resp_t(wide_resp_t),
    .cluster_axi_ar_t(cluster_ar_chan_t), .cluster_axi_aw_t(cluster_aw_chan_t),
    .cluster_axi_w_t(cluster_w_chan_t), .cluster_axi_b_t(cluster_b_chan_t),
    .cluster_axi_r_t(cluster_r_chan_t),
    .cluster_axi_req_t(cluster_req_t), .cluster_axi_resp_t(cluster_resp_t)
  ) i_compute (
    .clk_i, .rst_ni, .scan_enable_i(1'b0), .scan_data_i(1'b0), .scan_data_o(),
    .acc_req_i, .acc_resp_o(acc_rsp_o), .axi_req_o, .axi_resp_i(axi_rsp_i)
  );
endmodule
