#!/bin/bash

sudo-g5k docker run -td --privileged --user root --name smartwatts-sensor-corentin --network network_corentin \
        -v /sys:/sys -v /var/lib/docker/containers:/var/lib/docker/containers:ro \
        powerapi/hwpc-sensor \
        -n "$(hostname -f)" \
        -r "mongodb" -U "mongodb://mongodb" -D "powerapicorentin" -C "sensor" \
        -s "rapl" -o -e "RAPL_ENERGY_PKG" \
        -s "msr" -e "TSC" -e "APERF" -e "MPERF" \
        -c "core" -e "CPU_CLK_UNHALTED:REF_P" -e "CPU_CLK_UNHALTED:THREAD_P" -e "LLC_MISSES" -e "INSTRUCTIONS_RETIRED" \
        -f 500 \
	-p "/sys/fs/cgroup/perf_event"
