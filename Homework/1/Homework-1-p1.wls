#!/usr/bin/env wolframscript
(* ::Package:: *)

dx1 = x2;
dx2 = (x1+sigma)(x4/sigma + omega)^2 - sigma^3 omega^2 / (x1 + sigma)^2;
dx3 = x4;
dx4 = -2 sigma (x4/sigma + omega)x2/(x1+sigma);

linModel = Grad[{dx1,dx2,dx3,dx4}, {x1,x2,x3,x4}] // FullSimplify;
Print["Linear Model: ", linModel]
linModelEval = linModel /. {x1->0, x2->0, x3->0, x4->0} //FullSimplify;
Print["Linear Model at equil: ", linModelEval]
