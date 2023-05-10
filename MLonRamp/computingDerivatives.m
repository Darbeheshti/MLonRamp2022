%Calculating Derivatives
load sampleletters.mat
plot(m2.Time,m2.X)
grid

dX=diff(m2.X)
dT=diff(m2.Time)

dXdT=dX./dT
plot(m2.Time(1:end-1),dXdT)


dY=diff(m2.Y)
dYdT=dY./dT
maxdx=max(dXdT)
maxdy=max(dYdT)
%Use the standardizeMissing function to modify dYdT so that all values of Inf are now NaN.
dYdT = standardizeMissing(dYdT,Inf);
maxdy = max(dYdT)

%Try calculating the derivatives of different sample letters. Note that a negative value divided by zero will result in -Inf. You can pass a vector of values to standardizeMissing to deal with multiple missing values at once.
%xclean = standardizeMissing(x,[-Inf 0 Inf]);


