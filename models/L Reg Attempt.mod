set Car;
set Variables;

param y {i in Car};
param x {i in Car, j in Variables};
param t;



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
