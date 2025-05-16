[MP-Gadget](https://github.com/MP-Gadget/MP-Gadget) is a Massively parallel cosmological SPH simulation software.

This version of Gadget is derived from main P-Gadget / Gadget-2, with the gravity solver algorithm from Gadget-4. It is the source code used to run the BlueTides and ASTRID simulations (http://bluetides-project.org). MP-Gadget requires GSL and a C compiler with OpenMP 4.5 support.

MP-Gadget is a hybrid MPI/OpenMP C code.

Category: Cosmology, Physics
Version: master branch
Source: https://github.com/MP-Gadget/MP-Gadget

The structure of this folder is as follows:

- `build`
  + `install.sh`: script that shows the steps to download the source code and build the software to get the binary
- `tests`
  + input scripts and data files used for the test
  + README that shows the specific tests to run and the expected output files
- `output`
  + example of the performance data collected from the runs
