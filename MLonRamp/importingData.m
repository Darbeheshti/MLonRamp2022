%Importing and Preprocessing Data
%Use the datastore function to make a datastore to all files containing the letter M. These files have _M_ in their name and a .txt extension. Store the datastore in a variable called letterds.
letterds=datastore("*_M_*.txt")
data=read(letterds)
plot(data.X,data.Y)
%Calling the read function again imports the data from the next file in the datastore.
%Use the readall function to import the data from all the files into a table called data. Visualize the data by plotting Y against X.
data=readall(letterds)
plot(data.X,data.Y)
%Add a Preprocessing Function
letterds = datastore("*_M_*.txt");
data = read(letterds);
data = scale(data);
plot(data.X,data.Y)
axis equal
plot(data.Time,data.Y)
ylabel("Vertical position")
xlabel("Time")

%To use a function as an input to another function, create a function handle by adding the @ symbol to the beginning of the function name.

preprocds=transform(letterds,@scale)
data=readall(preprocds)
plot(data.Time,data.Y)

function data=scale(data)
data.X = data.X - mean(data.X,"omitnan");
data.Y = data.Y - mean(data.Y,"omitnan");
end