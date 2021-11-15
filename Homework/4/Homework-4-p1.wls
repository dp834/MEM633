#!/usr/bin/env wolframscript
(* ::Package:: *)

a = {{-18,-19,-15},{20,21,16},{-5,-5,-4}};
b = {{-3},{5},{-2}};

CharacteristicPolynomial[a, x]
Eigenvalues[a]


pbh = Join[s IdentityMatrix[3] - a, b, 2];
pbh /. s->-3 // MatrixRank
pbh /. s->1 // MatrixRank


t1 = Join[b,a.b,2]
t1 // MatrixForm
t2 = Transpose[{{0,0,1}}]
t = Join[t1,t2,2]
t // MatrixForm
t // MatrixRank
Inverse[t] // MatrixForm


ahat = Inverse[t].a.t;
ahat // MatrixForm
bhat = Inverse[t].b;
bhat // MatrixForm


acontrb = ahat[[1;;2, 1;;2]]
acontrb // Eigenvalues
bcontrb = bhat[[1;;2]]
poleplacment = acontrb-bcontrb.{{f1,f2}}
poleplacment // MatrixForm
Collect[CharacteristicPolynomial[poleplacment,x],x]
(x+5)(x+7)//Expand
Solve[{-2+f1==12, 1-2f1+f2==35},{f1,f2}]
f = {{14,62,0}};


controlledSystem = ahat-bhat.f;
controlledSystem // MatrixForm
controlledSystem // Eigenvalues


closedLoop = a - b.f
closedLoop // MatrixForm
x0 = Transpose[{{1,3,2}}];
Clear[t]
eqns = MatrixExp[closedLoop t].x0;
closedLoopPlot = Plot[eqns,{t,0,15}, PlotRange->All, PlotLegends->{"x1","x2","x3"}]
Export["images/p1_closed_loop_response.png", closedLoopPlot];



