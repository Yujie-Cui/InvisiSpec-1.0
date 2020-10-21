#!/bin/bash

############ DIRECTORY VARIABLES: MODIFY ACCORDINGLY #############

ATTACK_CODE_DIR="../attack_code"
BENCHMARK="hello"
SCHEME_INVISI=$1

#Need to export GEM5_PATH
if [ -z ${GEM5_PATH+x} ];
then
    echo "GEM5_PATH is unset";
    exit
else
    echo "GEM5_PATH is set to '$GEM5_PATH'";
fi


#Need to export SPEC_PATH
# [mengjia] on my desktop, it is /home/mengjia/workspace/benchmarks/cpu2006
if [ -z ${SPEC_PATH+x} ];
then
    echo "SPEC_PATH is unset";
    exit
else
    echo "SPEC_PATH is set to '$SPEC_PATH'";
fi

##################################################################
 

 
OUTPUT_DIR=$GEM5_PATH/output/spectre/$SCHEME_INVISI

echo "output directory: " $OUTPUT_DIR

if [ -d "$OUTPUT_DIR" ]
then
    rm -r $OUTPUT_DIR
fi
mkdir -p $OUTPUT_DIR

RUN_DIR=$ATTACK_CODE_DIR

#run_base_ref\_my-alpha.0000
# Run directory for the selected SPEC benchmark
SCRIPT_OUT=$OUTPUT_DIR/runscript.log
# File log for this script's stdout henceforth
 
################## REPORT SCRIPT CONFIGURATION ###################
 
echo "Command line:"                                | tee $SCRIPT_OUT
echo "$0 $*"                                        | tee -a $SCRIPT_OUT
echo "================= Hardcoded directories ==================" | tee -a $SCRIPT_OUT
echo "GEM5_PATH:                                     $GEM5_PATH" | tee -a $SCRIPT_OUT
echo "SPEC_PATH:                                     $SPEC_PATH" | tee -a $SCRIPT_OUT
echo "==================== Script inputs =======================" | tee -a $SCRIPT_OUT
echo "BENCHMARK:                                    $BENCHMARK" | tee -a $SCRIPT_OUT
echo "OUTPUT_DIR:                                   $OUTPUT_DIR" | tee -a $SCRIPT_OUT
echo "==========================================================" | tee -a $SCRIPT_OUT
##################################################################

 
#################### LAUNCH GEM5 SIMULATION ######################
cd $RUN_DIR
 
echo "" | tee -a $SCRIPT_OUT
echo "" | tee -a $SCRIPT_OUT
echo "--------- Here goes nothing! Starting gem5! ------------" | tee -a $SCRIPT_OUT
echo "" | tee -a $SCRIPT_OUT
echo "" | tee -a $SCRIPT_OUT
 
Actually launch gem5!
$GEM5_PATH/build/X86_MESI_Two_Level/gem5.opt \
	--outdir=$OUTPUT_DIR $GEM5_PATH/configs/example/attack_code_config.py \
	--benchmark=$BENCHMARK --benchmark_stdout=$OUTPUT_DIR/$BENCHMARK.out \
	--benchmark_stderr=$OUTPUT_DIR/$BENCHMARK.err \
	--num-cpus=1 --mem-size=4GB \
    --l1d_assoc=8 --l2_assoc=16 --l1i_assoc=4 \
    --cpu-type=DerivO3CPU --needsTSO=0 --scheme=$SCHEME_INVISI \
    --num-dirs=1 --ruby \
    --network=simple --topology=Mesh_XY --mesh-rows=1 | tee -a $SCRIPT_OUT

