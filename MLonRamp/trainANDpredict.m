%training a model
load letterdata.mat
traindata
histogram(traindata.Character)
boxplot(traindata.MADX,traindata.Character)

%Make Predictions with a Classification Model
load letterdata.mat
traindata
knnmodel = fitcknn(traindata,"Character","NumNeighbors",5,"Standardize",true,"DistanceWeight","squaredinverse");
testdata
predLetter=predict(knnmodel,testdata)
misclassrate=sum(testdata.Character~=predLetter)/numel(predLetter)
%The response classes are not always equally distributed in either the training or test data. Loss is a fairer measure of misclassification that incorporates the probability of each class (based on the distribution in the data).
testloss=loss(knnmodel,testdata)
%Investigate Misclassifications
load letterdata.mat
load predmodel.mat
testdata
predLetter
confusionchart(testdata.Character,predLetter);

confusionchart(testdata.Character,predLetter,"RowSummary","row-normalized");
falseneg=predLetter~="U"&testdata.Character=="U"
%Use the logical array falseneg as an index into testfiles to determine the file names of the observations that were incorrectly classified as the letter U. Store the result in a variable called fnfiles.

%Similarly, use falseneg as an index into predLetter to determine the associated predicted letters. Store the result in a variable called fnpred.
fnfiles = testfiles(falseneg)
fnpred = predLetter(falseneg)
%Use the readtable function to import the data in the fourth element of fnfiles into a table called badU. Visualize the letter by plotting Y against X.
badU=readtable(fnfiles(4))
plot(badU.X, badU.Y)
title("Prediction: "+string(fnpred(4)))