#!/bin/bash

export workDir=/home/cuiyujie/workspace/InvisiSpec
export GEM5_PATH=/home/cuiyujie/workspace/InvisiSpec
export SPEC_PATH=/home/cuiyujie/workspace/benchmarks/spec2006
export CKPT_PATH=/home/cuiyujie/workspace/gem5_ckpt
echo $GEM5_PATH




export scripts=$workDir/runScripts
export result_spectre=$workDir/output/spectre
export run=$workDir/runScripts/spectre_cleanup.sh
export debug=$workDir/runScripts/debug_spectre_cleanup.sh
export info=$workDir/info.log
export cpu=$workDir/src/cpu/o3/cpu.cc
export fetch=$workDir/src/cpu/o3/fetch_impl.hh
export decode=$workDir/src/cpu/o3/decode_impl.hh
export rename=$workDir/src/cpu/o3/rename_impl.hh
export iew=$workDir/src/cpu/o3/iew_impl.hh
export lsq_unit=$workDir/src/cpu/o3/lsq_unit_impl.hh
export commit=$workDir/src/cpu/o3/commit_impl.hh
export rob=$workDir/src/cpu/o3/rob_impl.hh
export inst_queue=$workDir/src/cpu/o3/inst_queue_impl.hh
export base_inst=$workDir/src/cpu/base_dyn_inst.hh
export source_code=$workDir/attack_code/spectre_full.c
export source_code=$workDir/attack_code/spectre_full.c

