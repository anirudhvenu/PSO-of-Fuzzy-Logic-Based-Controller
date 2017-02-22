# Particle Swarm Optimization of Fuzzy Logic Based Controller
Particle swarm optimization of an active suspension system which controls the smoothness of the ride in an automobile. The active suspension system is essentially a spring-mass system coupled with a fuzzy logic based controller (see [[1]](http://ieeexplore.ieee.org/abstract/document/6388697/)) 

![nnfl_susp](https://cloud.githubusercontent.com/assets/20701981/23104737/985faa02-f6f9-11e6-86f8-91392b8e3186.png "Active Suspension System")

There are two input parameters to the controller the error (er) and error rate (err) where the error is defined as the sprung mass displacement from the set value. The aim of the controller is to minimize the displacement of the chassis.

#Program Listing:
   1. Psom.m: Optimizes the three parameters (A,B,C) of the active suspension system according to particle swarm optimization                and displays the final result along with a plot of the fitness function over iterations. 
   2. Suspension.fis: Defines the rules for the fuzzy controller.
   3. parameters.m: Final optimal values of the controller.
   4. test.m: Runs simulink model. 

