#!/usr/bin/env wolframscript
(* ::Package:: *)

a = {{-18,-19,-15},{20,21,16},{-5,-5,-4}};
b = {{-3},{5},{-2}};

CharacteristicPolynomial[a, x]
Eigenvalues[a]


pbh = Join[s IdentityMatrix[3] - a, b, 2];
pbh /. s->-3 // MatrixRank
pbh /. s->1 // MatrixRank



