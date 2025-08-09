#!/bin/bash

cecho(){  # source: https://stackoverflow.com/a/53463162/2886168
    RED="\033[0;31m"
    GREEN="\033[0;32m"
    YELLOW="\033[0;33m"
    # ... ADD MORE COLORS
    NC="\033[0m" # No Color

    printf "${!1}${2} ${NC}\n"
}

cecho "GREEN" "Running RDMA Network Load Balancing Simulations (leaf-spine topology)"

TOPOLOGY="leaf_spine_64_100G_OS1" # or, fat_k8_100G_OS2
NETLOAD="100" # network load 50%
RUNTIME="0.002" # 0.1 second (traffic generation)
CDF="all2allv"

cecho "YELLOW" "\n----------------------------------"
cecho "YELLOW" "TOPOLOGY: ${TOPOLOGY}" 
cecho "YELLOW" "NETWORK LOAD: ${NETLOAD}" 
cecho "YELLOW" "TIME: ${RUNTIME}" 
cecho "YELLOW" "----------------------------------\n"

# IRN RDMA
cecho "GREEN" "Run IRN RDMA experiments..."
# python3 run.py --lb fecmp --pfc 1 --irn 0 --simul_time ${RUNTIME} --netload ${NETLOAD} --topo ${TOPOLOGY} 2>&1 > /dev/null &
# sleep 0.1
# python3 run.py --lb letflow --pfc 1 --irn 1 --simul_time ${RUNTIME} --netload ${NETLOAD} --topo ${TOPOLOGY}
# sleep 0.1
python3 run.py --lb rps --pfc 1 --irn 1 --simul_time ${RUNTIME} --netload ${NETLOAD} --topo ${TOPOLOGY} --cdf ${CDF}
sleep 0.1
# python3 run.py --lb fecmp --pfc 0 --irn 1 --simul_time ${RUNTIME} --netload ${NETLOAD} --topo ${TOPOLOGY} 2>&1 > /dev/null &
# sleep 5
# python3 run.py --lb letflow --pfc 0 --irn 1 --simul_time ${RUNTIME} --netload ${NETLOAD} --topo ${TOPOLOGY} 2>&1 > /dev/null &
# sleep 0.1

cecho "GREEN" "Runing all in parallel. Check the processors running on background!"
