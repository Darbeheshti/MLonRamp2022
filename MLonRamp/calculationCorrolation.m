%Calculating Correlations
load sampleletters.mat
plot(v2.X,v2.Y,"o-")


%Because both variables contain missing data, C is NaN. You can use the "Rows" option to specify how to avoid missing values.
C=corr(v2.X,v2.Y,"rows","complete")
M=[v2.X(1:11) v2.Y(1:11) v2.X(12:end) v2.Y(12:end) ]
Cmat=corr(M,"rows","complete")
