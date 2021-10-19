a = {{0,1},{6, -5}};

{eigenvals, eigenvecs} = Eigensystem[a];
lambda = DiagonalMatrix[eigenvals];
p = Transpose[eigenvecs];
pInv = Inverse[p];

Print["t: ", p]
Print[TeXForm[p]]
Print["Lambdas: ", lambda]
Print[TeXForm[lambda]]
Print["t^{-1}: ", pInv]
Print[TeXForm[pInv]]

solution = p.(t MatrixExp[lambda]).pInv.{{x1},{x2}}
Print["Solution: ", solution]
Print[TeXForm[solution]]

Print["Solution Numeric: ", N[solution]]
Print[TeXForm[N[solution]]]

Print["Determinant: ", Det[p.MatrixExp[lambda].pInv]]
Print[TeXForm[Det[p.MatrixExp[lambda].pInv]]]
