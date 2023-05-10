load sampleletters.mat
letter = b1;

aratio = range(letter.Y)/range(letter.X)
idxmin = islocalmin(letter.X,"MinProminence",0.1);
numXmin = nnz(idxmin)
idxmax = islocalmax(letter.Y,"MinProminence",0.1);
numYmax = nnz(idxmax)
dT = diff(letter.Time);
dXdT = diff(letter.X)./dT;
dYdT = diff(letter.Y)./dT;
avgdX = mean(dXdT,"omitnan")
avgdY = mean(dYdT,"omitnan")
corrXY = corr(letter.X,letter.Y,"rows","complete")

featurenames = ["AspectRatio","NumMinX","NumMinY","AvgU","AvgV","CorrXY"];
feat=table(aratio,numXmin,numYmax,avgdX,avgdY,corrXY,'VariableNames',featurenames)
featB2=extract(b2)
%From the raw data, you will typically need to apply both preprocessing and feature extraction functions. You can apply the transform function repeatedly to add any number of transformations to the datastore to the raw data.

%The script currently applies the scale function to the files in the datastore letterds. The transformed datastore is stored in the variable preprocds.

%Use the readall function to read, preprocess, and extract features from all the data files. Store the result in a variable called data.
%The letters that the data represents are given in the data file names, which are of the form usernnn_X_n.txt. Note that the letter name appears between underscore characters (_X_).

%You can use the extractBetween function to extract text that occurs between given strings.
%For classification problems, you typically want to represent the known label as a categorical variable. You can use the categorical function to convert an array to categorical type.

%xcat = categorical(x)




extractedtxt = extractBetween(txt,"abc","xyz")
letterds = datastore("*.txt");
preprocds = transform(letterds,@scale)
featds = transform(preprocds,@extract)
data = readall(featds)
scatter(data.AspectRatio,data.CorrXY)
knownchar = extractBetween(letterds.Files,"_","_")
knownchar = categorical(knownchar)
data.Character=knownchar
gscatter(data.AspectRatio,data.CorrXY,data.Character)


function data = scale(data)
% Normalize time [0 1]
data.Time = (data.Time - data.Time(1))/(data.Time(end) - data.Time(1));
% Fix aspect ratio
data.X = 1.5*data.X;
% Center X & Y at (0,0)
data.X = data.X - mean(data.X,"omitnan");
data.Y = data.Y - mean(data.Y,"omitnan");
% Scale to have bounding box area = 1
scl = 1/sqrt(range(data.X)*range(data.Y));
data.X = scl*data.X;
data.Y = scl*data.Y;
end

function feat=extract(letter)
aratio = range(letter.Y)/range(letter.X)
idxmin = islocalmin(letter.X,"MinProminence",0.1);
numXmin = nnz(idxmin)
idxmax = islocalmax(letter.Y,"MinProminence",0.1);
numYmax = nnz(idxmax)
dT = diff(letter.Time);
dXdT = diff(letter.X)./dT;
dYdT = diff(letter.Y)./dT;
avgdX = mean(dXdT,"omitnan")
avgdY = mean(dYdT,"omitnan")
corrXY = corr(letter.X,letter.Y,"rows","complete")

featurenames = ["AspectRatio","NumMinX","NumMinY","AvgU","AvgV","CorrXY"];
feat=table(aratio,numXmin,numYmax,avgdX,avgdY,corrXY,'VariableNames',featurenames)
end