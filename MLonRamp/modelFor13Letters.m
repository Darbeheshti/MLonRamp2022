%Making a Model for 13 Letters

%You now have a simple two-feature model that works well for three 
%particular letters (J, M, and V). Could this model also work for 
%the whole alphabet? In this interaction, you will create and test 
%the same kNN model as before, but for 13 letters (half the English alphabet).

load featuredata13letters.mat
features
testdata


%Use the gscatter function to plot the observations in features, with aspect ratio on the horizontal axis and duration on the vertical axis, colored by class (stored in the Character variable).

gscatter(features.AspectRatio,features.Duration,features.Character)

%Use the fitcknn function to fit a model to the data. Set the "NumNeighbors" property to 5. Store the model in a variable called knnmodel. Use the model to predict the classes for the observations stored in testdata. Store the predictions in a variable called predictions.

knnmodel = fitcknn(features,"Character","NumNeighbors",5);
predictions = predict(knnmodel,testdata);

%Calculate the misclassification rate of the model and create a confusion chart. Store the misclassification rate in a variable called misclass.

iswrong=predictions~=testdata.Character
misclass=sum(iswrong)/numel(iswrong)
confusionchart(testdata.Character,predictions)






