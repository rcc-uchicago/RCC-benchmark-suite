# Midway3 Baseline Benchmark Results

This directory contains benchmark results collected on the **Midway3** cluster
at the University of Chicago Research Computing Center (RCC). All benchmarks
were run on Midway3 — not Midway4 — as a reference baseline requested by RCC
management ahead of the Midway4 procurement process. The purpose is to
establish current Midway3 performance numbers so that vendor Midway4
submissions can be evaluated in context.

All runs use the benchmark software versions, input files, and configurations
defined in the main branch of this repository.

---

## System Configuration

### CPU nodes (caslake partition)
| Component | Specification |
|-----------|--------------|
| Processor | Intel Xeon Gold 6248R (Cascade Lake) |
| Cores per node | 48 (2 sockets × 24 cores) |
| Memory per node | 180 GB |
| Interconnect | HDR100 InfiniBand |

### GPU nodes (gpu partition)
| GPU | Memory | Nodes available |
|-----|--------|----------------|
| NVIDIA A100-PCIE-40GB | 40 GB HBM2e | 4 GPUs/node |
| NVIDIA Tesla V100 | 32 GB HBM2 | available |
| NVIDIA Quadro RTX 6000 | 24 GB GDDR6 | available |

**Run date:** September 2026

---

## Results Summary

### HPCG (CPU) — `hpcg/output/midway3/`
| Configuration | GFLOP/s |
|--------------|---------|
| 1 node, 48 cores (caslake) | 0.61 |

### HPCG-GPU — `hpcg-gpu/output/midway3/`
| Configuration | GFLOP/s |
|--------------|---------|
| 1 node, 1× A100 | 235.95 |
| 1 node, 4× A100 | 900.87 |
| 1 node, 1× V100 | 144.23 |
| 1 node, 4× V100 | 529.50 |
| 1 node, 1× RTX6000 | 103.02 |
| 1 node, 4× RTX6000 | 393.55 |

### HPCC — `hpcc/output/midway3/`
| Benchmark | Result |
|-----------|--------|
| HPL | ~1.06 TFLOP/s (1 node, 48 cores) |
| Full output | see `hpccoutf.txt` |

### LAMMPS — `lammps/output/midway3/`
| Configuration | Benchmark | Performance |
|--------------|-----------|-------------|
| CPU, 1 node (48 cores) | LJ | 32.0 timesteps/s |
| CPU, 1 node (48 cores) | Chain | see log |
| GPU, 1 node, 1× A100 | LJ | 1258 timesteps/s |
| GPU, 1 node, 1× A100 | Chain | see log |

### IOR — `ior/output/midway3/`
| Operation | Bandwidth |
|-----------|-----------|
| Max Write | 9,640 MiB/s |
| Max Read  | 9,421 MiB/s |

*(1 node, 48 MPI tasks, Lustre scratch filesystem)*

### MLPerf DeepCAM — `mlperf/output/midway3/`
| Configuration | Result |
|--------------|--------|
| 1 node, 4× A100 | Target accuracy (0.82) reached at epoch 14 |
| Time to target | ~88.8 hours |

---

## Additional runs (outside standard suite)

**HPL Mixed Precision (HPL-MxP)** was run on Midway3 at the explicit request
of RCC management. HPL-MxP is not part of the standard benchmark suite in this
repository, but results are included here as a supplementary reference.

#### HPL-MxP — `hpl-mxp/output/midway3/`
| Configuration | GFLOPS (total) | GFLOPS per GPU |
|--------------|---------------|---------------|
| 1 node, 4× A100 | 281,610 | 70,402 |


---

## Notes

- All results were collected on Midway3; this branch does not contain any
  Midway4 results.
- All output files have been sanitized to remove system-specific paths and
  login session data not relevant to benchmark performance.
- Hostname fields show `<compute-node>` as a placeholder for the specific
  node allocated during the run.
- These are single-node results (n=1) unless otherwise noted. Multi-node
  scaling results are not included in this baseline.
