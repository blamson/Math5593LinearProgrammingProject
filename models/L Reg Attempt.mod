set Car;
set Variables;

param y {i in Car};
param x {i in Car, j in Variables};
param t;

var bplus{j in Variables}  >= 0;
var bminus{j in Variables} >= 0;

minimize SSE:
    sum {i in Car}
        ( y[i] - sum {j in Variables} (bplus[j] - bminus[j]) * x[i,j] )^2;

subject to L1_budget:
    sum {j in Variables: j != 'intercept'} (bplus[j] + bminus[j]) <= t;
