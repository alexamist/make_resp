# make-resp
Scripts for calculating RESP charges with Gaussian, starting only with `.xyz` file of your compound. 
Generate `.mol2`, `.frcmod` and `.pdb` with calculated RESP charges, for Molecular Dynamic simulations in Amber.

 First, use `make_esp.sh` for run an optimization of your compound (in your desired level of theory) and a single point for ESP calculation, with HF/6-31G* (protocol for RESP charges, read more in https://pubs.acs.org/doi/abs/10.1021/j100142a004).

*files needed: .xyz

*packages needed: Gaussian; marathon (https://github.com/dudektria/marathon) - for using Gaussian (or change the line where marathon is called, for the method you submit jobs in Gaussian)

*usage: ./make-esp.sh   xyz(without .xyz)   opt_level(scape special characters, for gaussian input)    nprocs-opt   nprocs-esp

ex: `./make-esp.sh` `compound` `MP2/6-311G\*` `8` `2`

   or  

   `nohup` `./make-esp.sh` `compound` `MP2/6-311G\*` `8` `2` `&`  (still running, even if you exit terminal, in background)

Before, use `make_resp.sh` for generating compound.mol2, compound.frcmod and compound.pdb with calculated RESP charges.

*files needed: compound_esp.out (output from ESP calculation)

*packages needed: antechamber; parmchk

*usage: ./make-resp.sh  esp_output(without _esp.out)  residue_name

   ex: `./make-resp.sh` `compound` `RES`
