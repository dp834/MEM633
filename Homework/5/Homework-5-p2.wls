#!/usr/bin/env wolframscript
(* ::Package:: *)

ac = {{-a1,-a2,-a3},{1,0,0},{0,1,0}};
ac // MatrixForm
siac = DiagonalMatrix[{s,s,s}] - ac;
siac // MatrixForm
us = {{0,0,1},{0,1,s},{1,s+a1, s^2+a1 s+a2}};
us // MatrixForm
vs = {{0, -1, s^2},{-1, 0 , s}, {0, 0, 1}};
vs // MatrixForm
us.siac.vs //Expand // MatrixForm



