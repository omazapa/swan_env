swan_env_activate_cmssw()
{
   SCRAM_ARCH=$1
   CMSSW=$2
   SWAN_ENV_CURRENT="$SCRAM_ARCH-$CMSSW"
   PS1=$PS1'(swan-'$SWAN_ENV_CURRENT'):'

   PATH="/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$SWAN_ENV_BIN_DIR"
   env -i USER=$USER SHELL=$SHELL PS1=$PS1 SWAN_ENV_DIR=$SWAN_ENV_DIR SWAN_ENV_LIB_DIR=$SWAN_ENV_LIB_DIR  SWAN_ENV_CURRENT=$SWAN_ENV_CURRENT PATH=$PATH bash --noprofile --norc swan_load cmssw $SCRAM_ARCH $CMSSW 
}

swan_env_load_cmssw()
{
    CURRENT_PDW=$PWD
    SCRAM_ARCH=$1
    CMSSW=$2
    source /cvmfs/cms.cern.ch/cmsset_default.sh
    cms_basedir=/cvmfs/cms.cern.ch
    export PATH=${cms_basedir}/common:$PATH

    #by default I will load the environment in the cvmfs path in read only
    echo $PWD
    cd /cvmfs/cms.cern.ch/$SCRAM_ARCH/cms/cmssw/$CMSSW
    echo $PWD
    eval `scramv1 runtime -sh`
    cd $CURRENT_PDW
    #requires to prepend the lib and bin paths
    export LD_LIBRARY_PATH=/cvmfs/cms.cern.ch/$SCRAM_ARCH/cms/cmssw/$CMSSW/external/$SCRAM_ARCH/lib/:$LD_LIBRARY_PATH
    export PATH=/cvmfs/cms.cern.ch/$SCRAM_ARCH/cms/cmssw/$CMSSW/external/$SCRAM_ARCH/bin/:$PATH

    (bash)  #subshell
    exit
}