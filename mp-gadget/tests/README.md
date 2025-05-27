The 2 folders in this folder `dm-only` and `neutrinos` are for separate simulations.
In each folder, there are 2 files
* `parameter.genic` : used to generate an initial condition file stored in an folder named `output/`
* `parameter.gadget`: used to run the simulation from the initialization. 

For each simulation, the metrics of interest is the time to solution
as a function of the number of MPI tasks, or compute nodes. This is the strong scaling
performance of the MP-GADGET software on the given hardware configuration.

The script [job-template.sh](job-template.sh) illustrates how the runs are performed and how the output logs are generated for each folder.

The performance of a run is measured by the time it takes to reach the `TimeMax` value in `paramfile.gadget`. The log file `output/cpu.txt` contains the elapsed time at the final step, which can be converted
to the performance in term of timesteps/s = number_of_timesteps / elapsed_time.

The script [get_perf.sh](get_perf.sh) shows how to get the performance with the file `output/cpu.txt`.

The script [get_strong_scaling.sh](get_strong_scaling.sh) shows how to get the strong scaling data with the log file from the runs.
