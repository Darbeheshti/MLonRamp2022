
%Use logical indexing to extract the training data for just the letters N and U. Store the result in a table called UorN.

%Similarly, extract the test data where the letter U was misclassified (i.e., the false negatives for U). Store the result in a table called fnU

load letterdata.mat
load predmodel.mat
traindata
testdata
predLetter

idx = (traindata.Character == "N") | (traindata.Character == "U");
UorN = traindata(idx,:)

idx = (testdata.Character == "U") & (predLetter ~= "U");
fnU = testdata(idx,:)
%Categorical variables maintain the full list of possible classes, even when only a subset are present in the data. When examining a subset, it can be useful to redefine the set of possible classes to only those that are in the data. The removecats function removes unused categories.

UorN.Character=removecats(UorN.Character)
%Extract the numeric feature data from UorN and fnU into matrices called UorNfeat and fnUfeat, respectively.

%Note that the last variable in both tables is the response. All other variables are the features.

UorNfeat=UorN{:,1:end-1}

fnUfeat=fnU{:,1:end-1}

%Use the parallelcoords function to plot the features in the training data (UorNfeat), grouped by letter (UorN.Character).
parallelcoords(UorNfeat,"Group",UorN.Character)


%Use the plot function to add the values of the features for the fourth misclassified U to the plot as a black line. (The features for the misclassified letters are stored in the matrix fnUfeat).

hold on
plot(fnUfeat(4,:),'Color','k')
hold off


%Use the googlenet function to load a pretrained network. Save the result as a variable called deepnet.
deepnet=googlenet
%View image files
img1=imread("file01.jpg")
imshow(img1)
%Use the classify function with the pretrained GoogLeNet network deepnet to predict the subject of the image stored in the variable img1. Store the network's prediction in a variable called pred1.
pred1=classify(deepnet,img1)

img2 = imread("file02.jpg");
imshow(img2)
img3 = imread("file03.jpg");
imshow(img3)
pred2=classify(deepnet,img2)
pred3=classify(deepnet,img3)





