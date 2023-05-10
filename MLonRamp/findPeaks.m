%Find Peaks in Signals
load sampleletters.mat
plot(m1.Time,m1.X)
%Use the islocalmin and islocalmax functions to create two logical arrays, idxmin and idxmax, respectively, that determine the local minima and maxima of m1.X.

idxmin=islocalmin(m1.X)
idxmax=islocalmax(m1.X)


plot(m1.Time,m1.X)
hold on
plot(m1.Time(idxmin),m1.X(idxmin),"o")
plot(m1.Time(idxmax),m1.X(idxmax),"s")
hold off

%Local minima and maxima are defined by computing the prominence of each value in the signal. The prominence is a measure of how a value compares to the other values around it. You can obtain the prominence value of each point in a signal by obtaining a second output from islocalmin or islocalmax.
[~,prom]=islocalmin(m1.X)
plot(m1.Time,prom)
%By default, islocalmin and islocalmax find points with any prominence value above 0. This means that a maximum is defined as any point that is larger than the two values on either side of it. For noisy signals you might want to consider only minima and maxima that have a prominence value above a given threshold.

idxmin= islocalmin(m1.X,"MinProminence",.1)
idxmax= islocalmax(m1.X,"MinProminence",.1)
plot(m1.Time,m1.X)
hold on
plot(m1.Time(idxmin),m1.X(idxmin),"o")
plot(m1.Time(idxmax),m1.X(idxmax),"s")
hold off

%You can pass idxmin to the nnz or sum functions to count the number of minima. Try calculating the number of local minima and maxima in different signals.





