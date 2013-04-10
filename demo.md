% R语言春令营（1）：导论
% \href{mailto:chen@yanping.me}{陈堰平}
% April 14, 2013

# R的安装
 
## Reproducibility
 
* Same script
* Same results
* Anywhere
    + Single thread
    + Multi-core
    + Cloud Scale
 
## Everything starts with a seed.
Simulation is based off Pseudo-random number generation (PRNG).
 
* PRNG is sequential, next number depends on the last state.
* Seeds are used to store the state of a random number generator
* by 'Setting a seed' one can place a PRNG into any exact state.
 
## Parallel Random Number Generation
Simulation is complicated in new parallel environments.

* PRNG is sequential,
* parallel execution is not,
* and order of execution is not guaranteed.

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |

  : Demonstration of simple table syntax.
 
This is where parallel pseudo-random number generators help out.
 
## Parallel PRNG
Parallel pseudo-random number generators start with a singe state that
can spawn additional streams as well as streams of random numbers.
 
1. SPRNG
2. L'Ecuyer combined multiple-recursive generator

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: Here's the caption. 
 
# R包的使用
 
## R package `harvestr`
<https://github.com/halpo/harvestr>
 
What `harvestr` does:
 
* Reproducibility
* Caching
* Under parallelized environments.
 
 
 
## How `harvestr` works
 
* Analytical elements are separated into work-flows of dependent elements.
    + Set up environment/seed
    + Generate Data
    + Perform analysis
        - Stochastic
        - Non-Stochastic
    + Summarize
* Results from one step carry to another by carrying the seed with the results.
 
 
## **Primary work-flow** for `harvestr`
 
* `gather(n)` - generate `n` random number streams.
* `farm(seeds, expr)` - evaluate `expr` with each seed in `seeds`.
* `harvest(x, fun)` - for each data in `x` call the function `fun` 

# 数据管理
 
## Building blocks
Some building blocks that might *might* be helpful.
 
* `plant`- for setting up copies of an object with given seeds.
* `sprout` - for obtaining the sub-streams used with graft.
* `reap` - single object version of `harvest`
 
 
## In case you are wondering
 
* Yes it works with `Rcpp` code,
+ provided the compiled code uses the RNGScope for RNG in C++.
* **But** take care to not carry C++ reference objects across parallel calls.

```r
seeds <- gather(10, seed=20120614)
data <- farm(seeds, {
x1 <- rnorm(400)
x2 <- rnorm(400)
g <- rep(rnorm(4), each=100)
trt <- rep(1:4, each=100)
y <- rnorm(n=400, mean=3*x1 + x2 + g)
data.frame(y, x1, x2, trt)
})
```