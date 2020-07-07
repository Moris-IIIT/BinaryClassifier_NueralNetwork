clc;
clear variables;
close all;
%/*--------------- Data Preprocessing----------------*/
test = dir('test/*.png');
nFiles = length(test);
testData = zeros(10,268203);
for i = 1:nFiles
   filename = test(i).name;
   filename = strcat('test/',filename);
   image = imread(filename);
   image = reshape(image,[1,299*299*3]);
   testData(i,:)= image;
end
testDataX = testData.';
testDataY = [ 1,1,0,1,0,0,1,0,0,1];