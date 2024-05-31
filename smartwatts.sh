#!/bin/bash

docker run -td --name smartwatts-formula-corentin --network network_corentin powerapi/smartwatts-formula -s \
	--input mongodb -n "sensor" -u "mongodb://mongodb" -d "powerapicorentin" -c "sensor" -m "HWPCReport" \
	--output mongodb -n "power" -u "mongodb://mongodb" -d "powerapicorentin" -c "powerrep" -m "PowerReport" \
	--output mongodb -n "formula" -u "mongodb://mongodb" -d "powerapicorentin" -c "formularep" -m "FormulaReport" \
	--disable-dram-formula --sensor-reports-frequency 500 -p "/sys/fs/cgroup/perf_event"


