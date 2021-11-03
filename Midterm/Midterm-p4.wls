#!/usr/bin/env wolframscript
(* ::Package:: *)

a = {{-21,-22, -20}, {26, 27, 23}, {-9,-9,-7}};
b = {{-3},{5},{-2}};
pbh = Join[s IdentityMatrix[3] - a,b,2]
CharacteristicPolynomial[a,x]
Eigenvalues[a]
pbh/. s -> -4;
RowReduce[%] // MatrixForm
MatrixRank[pbh/.s->-4]
MatrixRank[pbh/.s->2]
MatrixRank[pbh/.s->1]


Eigensystem[a]
evecs = %[[2]];
evecs // MatrixForm
q1 = evecs[[1;;3,1]]
q2 = evecs[[1;;3,2]]
q3 = evecs[[1;;3,3]]
nonControlSpace = Cross[q2,q3]
Dot[nonControlSpace,evecs] (* In the left null space of  our controllable eigenvalues *)


eat = MatrixExp[a t].Transpose[{{1,1,1}}] // FullSimplify
Plot[eat, {t,0,10}]


feedbackGains = {{f1,f2,f3}};
feedbackSys = a+b . feedbackGains
evals = Eigenvalues[feedbackSys]
evals // TeXForm
Reduce[evals[[2]]==-10 && evals[[3]] == -3, {f1,f2,f3}]


feedbackGains = {{10,-44+10, -102+10}}
feedbackSys = a + b.feedbackGains;
Eigenvalues[feedbackSys]
eat = MatrixExp[feedbackSys t].Transpose[{{x1,x2,x3}}] // FullSimplify
eat // TeXForm
Limit[eat,{t -> Infinity}]
eat = MatrixExp[feedbackSys t].Transpose[{{1,1,1}}] // FullSimplify
p = Plot[eat, {t,0,10}, PlotRange->All, PlotLegends->{"x1","x2","x3"}]
Export["images/p4_zero_input_response.png", Show[p]]
