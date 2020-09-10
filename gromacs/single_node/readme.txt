Tuning on a single node:
- Scripts: copy them into their respective benchmark folders
    - prep.sh: run on login node, just does grompp prep
    - run_basic.sh: basic run on normal queue with no options whatsoever
    - run_more_steps.sh: sets more timesteps
    - run_omp.sh: manually set omp threads
- Baseline performance (all defaults using run_basic.sh):
    - adh_cubic: 61 ns/day
    - 1.5M_water: 1.018 ns/day
- Conclusions:
    - Running more steps: negligible (but nonzero) improvement
    - Don't use more threads than cores, regresssion in performance
    - Gromacs automatic config is really good
    -
- TO DO's:
    - investigate dynamic load balancing
    - investigate pme ratio 


