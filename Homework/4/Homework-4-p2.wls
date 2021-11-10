#!/usr/bin/env wolframscript
(* ::Package:: *)

a = {{-18,-19,-15},{20,21,16},{-5,-5,-4}};
b = {{-3},{5},{-2}};

Eigenvalues[a];
Eigenvectors[a,3];

eigenvector1 = a-(-3 IdentityMatrix[3]);
Solve[eigenvector1.Transpose[{{v1,v2,v3}}] == 0, {v1,v2,v3}]
eigenvector1 = Transpose[{{v1,v2,v3}}] /.% /. v1->14 // First;

eigenvector2 = a -(IdentityMatrix[3]);
Solve[eigenvector2.Transpose[{{v1,v2,v3}}] == 0, {v1,v2,v3}]
eigenvector2 = Transpose[{{v1,v2,v3}}] /.% /. v1->1 // First;

eigenvector3 = a -(IdentityMatrix[3]);
eigenvector3.Transpose[{{v1,v2,v3}}] // MatrixForm;
eigenvector2 // MatrixForm;
Solve[eigenvector3.Transpose[{{v1,v2,v3}}] == eigenvector2, {v1,v2,v3}];
eigenvector3 = Transpose[{{v1,v2,v3}}] /.% /. v1->1 // First;



evecs = Join[eigenvector1, Join[eigenvector2,eigenvector2,2],2] ;
% // MatrixForm;
{s,j} = JordanDecomposition[a];
s // MatrixForm
j // MatrixForm
(* (a - lambda I).v = eigenvector(lambda=1) *)
s.j.Inverse[s];
% // MatrixForm


ahat = Inverse@s.a.s
bhat = Inverse@s.b

Inverse[s] // MatrixForm
Inverse[s].a // MatrixForm
Inverse[s].b // MatrixForm
(* First eigenvector is non controllable *)


ahat // MatrixForm
bhat // MatrixForm
contrba = ahat[[2;;3,2;;3]]
contrbb = bhat[[2;;3]]
closedA = contrba - contrbb.{{f1,f2}}
CharacteristicPolynomial[closedA, x]
Reduce[% == (x+5)(x+7), {x}]
feedback = {{f1,f2}} /. {f1 -> 6, f2->-2}
closedA = contrba - contrbb.feedback
Eigenvalues[closedA]


feedback3 = Join[{{0}}, feedback,2]
closedAFullTransformed = ahat - bhat.feedback3;
closedAFullTransformed // MatrixForm
Eigenvalues[closedAFullTransformed]
closedAFull = a-b.feedback3;
closedAFull // MatrixForm
Eigenvalues[closedAFull]


x0 = Transpose[{{1,3,2}}];
Clear[t]
eqns = MatrixExp[closedAFull t].x0;
closedLoopPlot = Plot[eqns,{t,0,10}, PlotRange->All, PlotLegends->{"x1","x2","x3"}]
Export["images/p2_closed_loop_response.png", closedLoopPlot];



