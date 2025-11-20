
set project=`echo $PWD | awk -F'/' '{print $4}'`
set user_dir=`echo $PWD | awk -F'/' '{print $6}'`
set current=`echo $PWD | awk -F'/' '{print $7}'`
set sub_proj=`echo $PWD | awk -F'/' '{print $8}'`

set tmpdata="/tmpdata/simulation"
if (! -d $tmpdata/$user_dir) then
    mkdir -p $tmpdata/$user_dir
endif
if (! -d $tmpdata/$user_dir,$project,$sub_proj) then
    mkdir -p "$tmpdata/$user_dir/$project,$current,$sub_proj"
endif
if (! -l ../scratchdir) then
    ln -sf "$tmpdata/$user_dir/$project,$current,$sub_proj" ../scratchdir
endif


setenv  AS6T28_PROJ_DIR   /data/proj/as6t28d/wa/${user_dir}/${current}
setenv  AS6T28DT_PROJ_DIR /data/proj/as6t28dt/wa/${user_dir}/${current}
cd .. 
setenv SIM_ROOT $PWD
cd -
setenv WORKAREA $PWD
setenv SIM_DIR $SIM_ROOT/sim_dir
setenv COMMON_DIR $SIM_ROOT/common
setenv VERDI_HOME /tools/synopsys/verdi/O-2018.09-SP2-9
setenv VCS_HOME /tools/synopsys/vcs-mx/O-2018.09-SP2
setenv DVE_HOME /tools/synopsys/vcs/O-2018.09-SP2/gui/dve
setenv UVM_HOME /tools/arsenal/.packages/uvm/1.1d/
setenv SYNOPSYS_SIM_SETUP  $SIM_ROOT/common/synopsys_sim.setup
setenv NOVAS_RC $SIM_ROOT/common/novas.rc



setenv PATH .:/tools/synopsys/vcs-mx/O-2018.09-SP2/bin:$PATH
setenv PATH .:/tools/synopsys/vcs-mx/O-2018.09-SP2/linux64/bin:$PATH
setenv PATH .:/tools/synopsys/vcs-mx/O-2018.09-SP2/gui/dve/bin:$PATH

#cd $AS6T28DT_PROJ_DIR/AS6T28D/AS6T28D_TOP/RTL/TOP
#./pre_run_all.csh
#cd $AS6T28DT_PROJ_DIR/AS6T28S/AS6T28S_TOP/RTL/TOP
#./pre.csh
#cd $SIM_ROOT/work
