# Optimisation

# Research

### Resources

- [http://manual.gromacs.org/documentation/2020/release-notes/2019/major/performance.html](http://manual.gromacs.org/documentation/2020/release-notes/2019/major/performance.html)
- [http://manual.gromacs.org/documentation/2020/release-notes/2018/major/performance.html](http://manual.gromacs.org/documentation/2020/release-notes/2018/major/performance.html)
- [http://manual.gromacs.org/documentation/2020/release-notes/2020/major/performance.html](http://manual.gromacs.org/documentation/2020/release-notes/2020/major/performance.html)
- [https://blog.exxactcorp.com/gromacs-2020-highlights/](https://blog.exxactcorp.com/gromacs-2020-highlights/)
- [https://www.mpibpc.mpg.de/280252/kutzner07talk-optimizing.pdf](https://www.mpibpc.mpg.de/280252/kutzner07talk-optimizing.pdf)
- [https://www.mpibpc.mpg.de/15381237/kutzner16talk-gromacs.pdf](https://www.mpibpc.mpg.de/15381237/kutzner16talk-gromacs.pdf)
- [**https://www.mpibpc.mpg.de/15230023/Kutzner_2015_JCC_Suppl.pdf**](https://www.mpibpc.mpg.de/15230023/Kutzner_2015_JCC_Suppl.pdf) Optimising and stuff
- [http://manual.gromacs.org/documentation/current/user-guide/mdrun-performance.html](http://manual.gromacs.org/documentation/current/user-guide/mdrun-performance.html)
- [http://manual.gromacs.org/documentation/5.1/user-guide/cmdline.html](http://manual.gromacs.org/documentation/5.1/user-guide/cmdline.html) → command line reference
- [http://manual.gromacs.org/documentation/5.1/onlinehelp/gmx-mdrun.html](http://manual.gromacs.org/documentation/5.1/onlinehelp/gmx-mdrun.html)

### Details

- use `g_tune_pme` to do a kind of grid search for you, with regards to the best pme balance
- Use like `gmx_mpi tune_pme -np 28 -s lol.tpr -launch`
- [http://manual.gromacs.org/documentation/2018/onlinehelp/gmx-tune_pme.html](http://manual.gromacs.org/documentation/2018/onlinehelp/gmx-tune_pme.html)

Gromacs is a molecular dynamics code, that uses PME(Particle mesh Ewald). This algorithm does something with electrostatics, and requires all to all processor communication. This is one big hinderance to parallel performance. 

-dd is a way to decompose your domain into different size. (Domain decomposition grid, 0 is optimize)

I think it is how the 3d cube is partitioned into cells 0 0 0 is optimized