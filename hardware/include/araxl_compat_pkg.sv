// SPDX-License-Identifier: SHL-0.51
package araxl_compat_pkg;
  // Vector division does not use transaction IDs; serdiv still requires a
  // nonzero width. Its arithmetic width is passed separately as ELEN.
  function automatic config_pkg::cva6_cfg_t divider_config();
    config_pkg::cva6_cfg_t cfg = config_pkg::cva6_cfg_empty;
    cfg.TRANS_ID_BITS = 1;
    return cfg;
  endfunction
  localparam config_pkg::cva6_cfg_t DividerCfg = divider_config();
endpackage
