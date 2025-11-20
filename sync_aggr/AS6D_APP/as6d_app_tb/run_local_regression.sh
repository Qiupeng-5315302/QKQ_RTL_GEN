
#!/bin/bash  

operation=$1
dir_name=$2
case_def=$3

sub_case=("CLK_FORCE_1" "CLK_FORCE_2" "CLK_FORCE_SAME" "CLK_FORCE_1_FPGA" "CLK_FORCE_2_FPGA" "CLK_FORCE_SAME_FPGA" "SRAM_LCRC_EN")

sub_case_lower=()

scripts_as6s=(
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_prbs_raw8/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_ate_test/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw8/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_rgb565/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_yuv422_8bit_yuyv/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_yuv422_8bit_uyvy/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw10_byteloc1/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw10_byteloc2/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw10_byteloc3/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw10_byteloc4/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw10_byteloc5/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw10_byteloc6/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw10_byteloc7/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw10_byteloc8/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw12_byteloc1/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw12_byteloc2/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw12_byteloc3/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw12_byteloc4/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw12_byteloc5/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw12_byteloc6/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw12_byteloc7/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_raw12_byteloc8/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_rgb888_byteloc1/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_rgb888_byteloc2/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_rgb888_byteloc3/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_rgb888_byteloc4/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_rgb888_byteloc5/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_rgb888_byteloc6/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_rgb888_byteloc7/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_dvp_rgb888_byteloc8/"
)         


scripts_as6d=(

         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_aggr_concat_itlv_4pipe_case1/task_aggr_concat_itlv_4pipe_case1_clk_force_1/"          
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_aggr_concat_itlv_4pipe_case1/task_aggr_concat_itlv_4pipe_case1_clk_force_2/"          
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_aggr_concat_itlv_4pipe_case1/task_aggr_concat_itlv_4pipe_case1_clk_force_same/"       
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_aggr_concat_itlv_4pipe_case1/task_aggr_concat_itlv_4pipe_case1_clk_force_1_fpga/"     
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_aggr_concat_itlv_4pipe_case1/task_aggr_concat_itlv_4pipe_case1_clk_force_2_fpga/"     
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_aggr_concat_itlv_4pipe_case1/task_aggr_concat_itlv_4pipe_case1_clk_force_same_fpga/"
         "/data/proj/as6t28d/wa/qiupeng/current/AS6T28D/AS6D_APP/as6d_app_tb/task_aggr_concat_itlv_4pipe_case1/task_aggr_concat_itlv_4pipe_case1_sram_lcrc_en/"

)


count_as6s=${#scripts_as6s[@]}  
count_as6d=${#scripts_as6d[@]}  
  
sub_case_count=${#sub_case[@]}  

for ((i = 0; i < sub_case_count; ++i)); do
    # 判断当前元素是否为字母类型
    #if [[ ${sub_case[i]} =~ [a-zA-Z] ]]; then
        # 如果是字母类型则进行大小写转换
    sub_case_lower+=($(echo "${sub_case[i]}" | tr '[:upper:]' '[:lower:]'))
    #else
        # 非字母类型直接添加到结果数组中
        #sub_case_lower+=("${sub_case[i]}")
    #fi
done

echo ${sub_case_lower[@]}

run_vcs() {
    for (( i=0; i<$count_as6s; i++ )); do  
        terminator -e "scenv && swvs && bash -c 'cd ${scripts_as6s[$i]%.*} && make vcs && make check'"  
    done
    for (( i=0; i<$count_as6d; i++ )); do  
        terminator -e "scenv && swvs && bash -c 'cd ${scripts_as6d[$i]%.*} && make vcs && make check'"  
    done
}

run_vcs_as6d() {
    for (( i=0; i<$count_as6d; i++ )); do  
        terminator -e "scenv && swvs && bash -c 'cd ${scripts_as6d[$i]%.*} && make vcs && make check'"  
    done
}

run_vcs_as6s() {
    for (( i=0; i<$count_as6s; i++ )); do  
        terminator -e "scenv && swvs && bash -c 'cd ${scripts_as6s[$i]%.*} && make vcs && make check'"  
    done
}

run_check_as6d() {
    echo "------------------success case---------------------"
    for (( i=0; i<$count_as6d; i++ )); do  
        #echo "------------------${scripts_as6d[$i]}---------------------"
        grep --color "success" -l ${scripts_as6d[$i]}/idi_check/check_result.txt
    done
    echo "------------------fatal case---------------------"
    for (( i=0; i<$count_as6d; i++ )); do  
        #echo "------------------${scripts_as6d[$i]}---------------------"
        grep --color "fatal" -l ${scripts_as6d[$i]}/idi_check/check_result.txt
    done
}

run_check_as6s() {
    echo "------------------success case---------------------"
    for (( i=0; i<$count_as6s; i++ )); do  
        #echo "------------------${scripts_as6s[$i]}---------------------"
        grep --color "success" -l ${scripts_as6s[$i]}/vcs.log
    done
    echo "------------------fatal case---------------------"
    for (( i=0; i<$count_as6s; i++ )); do  
        #echo "------------------${scripts_as6s[$i]}---------------------"
        grep --color "Fatal" -l ${scripts_as6s[$i]}/vcs.log
    done
}

clear_log(){
    for (( i=0; i<$count_as6d; i++ )); do  
        echo "---------clear---------${scripts_as6d[$i]}---------------------"
        rm -rf ${scripts_as6d[$i]}/idi_check/*
    done
}

mkdir_sub_case(){
    mkdir   ${dir_name}
    for (( i=0; i<$sub_case_count; i++ )); do  
        mkdir   ${dir_name}/${dir_name}_${sub_case_lower[$i]}
        echo "show:" >  ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "	verdi -sv -2001 -autoalias -elab ./simv.daidir/kdb.elab++  -ssf app.fsdb &" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "vcs:" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "	rm -rf sim.log simv* csrc ucli* dump*" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "	vcs -R -full64 -sverilog -l vcs.log -f ../../as6d_app_tb.f -timescale=1ns/1fs -call_tasks_functions_from_cli +vcs+lic+wait +v2k +lint=TFIPC-L \\" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "       +define+INCLUDE_POWER  +define+_SERDES   +define+RTL_SIM  +define+_clk_12p5g  +ntb_random_seed_automatic  +define+EXT_LOOPBACK +define+_DUMP_ON  +define+_DFE_FAST_TIMER   +define+ADD_WAM +define+${case_def} +define+${sub_case[$i]}\\" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "	     +plusarg_save +CHIP_ID=11 -P /tools/synopsys/verdi/S-2021.09-SP1/share/PLI/VCS/LINUX64/novas.tab   /tools/synopsys/verdi/S-2021.09-SP1/share/PLI/VCS/LINUX64/pli.a  -lca -kdb -debug_access+all" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "check:" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        echo "	python ../../app_check.py" >> ./${dir_name}/${dir_name}_${sub_case_lower[$i]}/Makefile
        mkdir   ${dir_name}/${dir_name}_${sub_case_lower[$i]}/idi_check
    done
}
# 获取传递的参数

# 根据参数执行不同的代码块
if [ "$operation" == "vcs" ]; then
    run_vcs
elif [ "$operation" == "vcs_as6s" ]; then
    run_vcs_as6s
elif [ "$operation" == "vcs_as6d" ]; then
    run_vcs_as6d
elif [ "$operation" == "check_as6s" ]; then
    run_check_as6s
elif [ "$operation" == "check_as6d" ]; then
    run_check_as6d
elif [ "$operation" == "clear" ]; then
    clear_log
elif [ "$operation" == "mkdir" ]; then
    mkdir_sub_case
fi


