#!/usr/bin/env wolframscript
(* ::Package:: *)

a = {{-5, 0}, {2, -1}};
b = {{2},{0}};
c = {{0,50}};
d = {{0}};

eat = MatrixExp[a (t-t0)] //FullSimplify;

Print["e^(At): ", eat];
Print[TeXForm[eat]];

impulseResponse = MatrixExp[a t].{{x10},{x20}} + MatrixExp[a t].b //FullSimplify;
Print["Impulse Reponse", impulseResponse];
Print[TeXForm[impulseResponse]];

impulseResponsezz = impulseResponse /. {x10->0, x20->0} //FullSimplify;
Print["Impulse Reponse (0,0)", impulseResponsezz];
Print[TeXForm[impulseResponsezz]];

stepResponse = MatrixExp[a t].{{x10},{x20}} + Integrate[MatrixExp[a (t -tau)].b, {tau,0,t}] //FullSimplify;
Print["Step Reponse", stepResponse];
Print[TeXForm[stepResponse]];

stepResponsezz = stepResponse /. {x10->0, x20->0} //FullSimplify;
Print["Step Reponse (0,0)", stepResponsezz];
Print[TeXForm[stepResponsezz]];


(* Part b *)
sia = Inverse[s IdentityMatrix[2] - a] //FullSimplify;
Print["(sI - a)^-1: ", sia];
Print[TeXForm[sia]];

transferFunc = c.sia.b;
Print["Transfer Function: ", transferFunc];
Print[TeXForm[transferFunc]];

bodePlot = Abs[transferFunc] /. {s -> omega I} //ComplexExpand // FullSimplify;
Print["Bode Function: ", bodePlot];
Print[TeXForm[bodePlot]];

plot = BodePlot[transferFunc, GridLines->Automatic, PlotLabel->{"Maginitude", "Phase"}];
Export["images/p2_bode_plot.png",
    GraphicsColumn[{plot[[1]][[1]][[1]],plot[[1]][[2]][[1]]}]
]

sys = StateSpaceModel[{a,b,c,d}];
margins = PhaseMargins[sys];
Print["Margins: ", margins];
Print[TeXForm[margins]];
Print[N[margins]];
