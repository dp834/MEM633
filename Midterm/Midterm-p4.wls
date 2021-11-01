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


feedbackGains = {{f1,f2,f3}};
feedbackSys = a-b . feedbackGains
feedbackEat = MatrixExp[feedbackSys t] // MatrixForm


Limit[feedbackEat . Transpose[{{x1,x2,x3}}], t->Infinity]
