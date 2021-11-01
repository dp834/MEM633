#!/usr/bin/env wolframscript
(* ::Package:: *)

a = {{0, 1, 0, 0}, {25, 0, 0, 0}, {0, 0, 0, 1}, {-.4, 0, 0, 0}};
CharacteristicPolynomial[a, x]
Eigenvalues[a]


b = {{0}, {-1.4}, {0}, {0.6}};
contrb = Join[Join[b, a . b, 2], Join[a . a . b, a . a . a . b, 2], 2];
Det[contrb]


{s, j} = JordanDecomposition[a];
s // MatrixForm
j // MatrixForm
MatrixExp[j t] // MatrixForm
eat = s . MatrixExp[j t] . Inverse[s] //Chop //Simplify;
x0 = {{-.3},{0},{.2},{0}};
eqns = eat . x0 // Simplify;
p1 = Plot[First[Part[eqns,1]],{t,0,.2}, PlotLabel->"x1(t)"];
p2 = Plot[First[Part[eqns,2]],{t,0,.2}, PlotLabel->"x2(t)"];
p3 = Plot[First[Part[eqns,3]],{t,0,.2}, PlotLabel->"x3(t)"];
p4 = Plot[First[Part[eqns,4]],{t,0,.2}, PlotLabel->"x4(t)"];
graphicsGrid = GraphicsGrid[{{p1,p2},{p3,p4}}];
Export[ "images/p1_zero_input_response.png",  graphicsGrid]


f = {{139,24,30,31}};
contrSys = a + b . f;
cpoly = CharacteristicPolynomial[contrSys, x];
Solve[cpoly == 0];
contrSysEat = MatrixExp[contrSys t];
contrSysEqns = contrSysEat . x0;
inputEqn = f . contrSysEqns //First // FullSimplify;

tf = 2;
p1a3 = Plot[{First[Part[contrSysEqns,1]],First[Part[contrSysEqns,3]]},{t,0,tf}, PlotLegends->{"x1(t)", "x3(t)"},PlotRange->All];
p2a4 = Plot[{First[Part[contrSysEqns,2]],First[Part[contrSysEqns,4]]},{t,0,tf}, PlotLegends->{"x2(t)","x4(t)"},PlotRange->All];
pInput = Plot[inputEqn, {t,0,tf}, PlotLegends -> {"u(t)"},PlotRange->All];
graphicsGrid = Grid[{{p1a3, p2a4},{pInput, SpanFromLeft}},ItemStyle->ImageSizeMultipliers->{1, 1}]
Export[ "images/p1_controlled_response.png",  graphicsGrid]
