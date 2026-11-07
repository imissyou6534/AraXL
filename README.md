# AraXL Compute Library For CVA6 v2

The `dsa-ara` branch exposes the hardware compute subset of upstream AraXL as a
CVA6 v2-compatible Bender package. Source URL, base revision and original-file hashes are in UPSTREAM.yml.
The original hardware license is preserved in LICENSE.hw and file headers.

Consume https://github.com/imissyou6534/AraXL.git at a fixed commit and commit
the consuming project's Bender.lock. This branch retains upstream history;
UPSTREAM.yml is provenance, not the effective version of the adapted source.
The package's own Bender.lock records the independently checked dependency set.

## Boundary

Select `araxl_compute` with `exclude_first_pass_decoder`. The package provides
the real cluster/lane/VLSU RTL, a CVA6 v2 first-pass decoder and public native
accelerator ABI. Legacy SoC, application and toolchain files remain for upstream
history but are not selected by this manifest. The old standalone SoC build is
not this branch's supported integration target. All selected processor RTL comes
from the single dependency named cva6; no legacy ariane dependency is resolved.

The consuming design also selects its CVA6 configuration and vector length. The
standalone elaboration regression uses cva6, cv64a6_imafdchsclic_sv39_wb,
araxl_compute, exclude_first_pass_decoder, VLEN=1024 and USE_CLUSTER. Run it
from the Cheshire integration with `python3 -m unittest discover -s util/tests -p test_araxl_library.py -v`.

The public acc_pkg ABI is RV64 with three transaction ID bits. The current
validated floating-point profile is single/double precision without half
precision. Integrations must validate their CPU/ABI widths against these types.
There are no dependencies on Cheshire VCU packages or a particular memory map.

## Compatibility History

- `ara_dispatcher`: use the library's public XLEN type.
- `ara`: use explicit scalar floating-point capability constants.
- `simd_div`: pass a local nonzero-ID divider configuration to CVA6 v2 serdiv.
- `vmfpu`: explicitly map FPnew's six formats and five operation groups and
  provide the new hart-id input.
- Decoder: use CVA6 v2 configuration and parameterized scoreboard types.

These changes are normal source files. Builds do not rewrite them or generate
adapted copies. Host CPU settings, native-interface adaptation, private memory,
FIFO, Debug Module and shared-memory policy belong to the parent integration.
