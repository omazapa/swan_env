#!/bin/bash

#source $SWAN_ENV_ETC_DIR/config.sh


swan_env_activate_base()
{
   SWAN_ENV_CURRENT="base"
   PS1=$PS1'(swan-'$SWAN_ENV_CURRENT'):'

   PATH="/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$SWAN_ENV_BIN_DIR"
   env -i USER=$USER SHELL=$SHELL PS1=$PS1 SWAN_ENV_CURRENT=$SWAN_ENV_CURRENT PATH=$PATH bash --noprofile --norc
}

