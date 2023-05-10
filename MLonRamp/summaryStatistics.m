%calculating summary statistics

load sampleletters.mat
plot(b1.Time,b1.X)
hold on
plot(b2.Time,b2.X)
hold off
plot(b1.Time,b1.Y)
hold on
plot(b2.Time,b2.Y)
hold off
aratiov=range(v1.Y)/range(v1.X)
medxd=median(d1.X,"omitnan")
medyd=median(d1.Y,"omitnan")
devxm=mad(m1.X)
devym=mad(m1.Y)
plot(b1.X,b1.Y,b2.X,b2.Y)
axis([-1 1 -1 1])
axis equal
plot(d1.X,d1.Y,d2.X,d2.Y)
axis([-1 1 -1 1])
axis equal