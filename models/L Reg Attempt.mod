#With these being so general I don't know how we could truly tranlsate the data without creating lots of sets

set Car;                     # observations i = 1..n

set Variables;                     # coefficients j


#these I am still unsure how they would work with real data but its a start


param y{i in Car};           # response
param x{i in Car, j in Variables};   # regressors x_ij
param t;                   # L1 budget

#since orignally not in standard format for ampl we have to translate into the poistive and negative side
var bplus{j in Variables}  >= 0;   # b_j^+ 

var bminus{j in Variables} >= 0;   # b_j^-

# same as: max -sum_i ( ... )^2
# minimizing the sum squared error 
minimize SSE:
    sum {i in Car}
        ( y[i] - sum {j in Variables} (bplus[j] - bminus[j]) * x[i,j] )^2;

subject to L1_budget:
    sum {j in Variables} (bplus[j] + bminus[j]) <= t;
