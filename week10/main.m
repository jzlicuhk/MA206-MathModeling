%% 加载图像数据（只需要运行一次）
unzip("DigitsData.zip");
dataFolder = "DigitsData";
imds = imageDatastore(dataFolder, ...
    IncludeSubfolders=true, ...
    LabelSource="foldernames");
    %% 显示部分图像
figure
tiledlayout("flow");
perm = randperm(10000,20);
for i = 1:20
    nexttile
    imshow(imds.Files{perm(i)});
end
    %% 计算每个类别中的图像数量
close all;clc
classNames = categories(imds.Labels);
labelCount = countEachLabel(imds)
    %% 计算图像大小
img = readimage(imds,1);
size(img)
    %% 划分数据集
numTrainFiles = 750;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,"randomize");
    %% 定义神经网络
layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(3,8,Padding="same")
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,Stride=2)
    
    convolution2dLayer(3,16,Padding="same")
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,Stride=2)
    
    convolution2dLayer(3,32,Padding="same")
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(10)
    softmaxLayer];
    %% 指定训练选项
options = trainingOptions("sgdm", ...
    InitialLearnRate=0.01, ...
    MaxEpochs=4, ...
    Shuffle="every-epoch", ...
    ValidationData=imdsValidation, ...
    ValidationFrequency=30, ...
    Plots="training-progress", ...
    Metrics="accuracy", ...
    Verbose=false);
    %% 训练神经网络
net = trainnet(imdsTrain,layers,"crossentropy",options);
    %% 对图像分类
scores = minibatchpredict(net,imdsValidation);
YValidation = scores2label(scores,classNames);
    %% 计算准确率
TValidation = imdsValidation.Labels;
accuracy = mean(YValidation == TValidation)



%% 使用深度网络设计器创建神经网络
clc;close all

imds = imageDatastore("DigitsData", ...
    IncludeSubfolders=true, ...
    LabelSource="foldernames");

classNames = categories(imds.Labels);

[imdsTrain,imdsValidation,imdsTest] = splitEachLabel(imds,0.7,0.15,0.15,"randomized");
    

options = trainingOptions("sgdm", ...
    MaxEpochs=4, ...
    ValidationData=imdsValidation, ...
    ValidationFrequency=30, ...
    Plots="training-progress", ...
    Metrics="accuracy", ...
    Verbose=false);

net = trainnet(imdsTrain,net_1,"crossentropy",options);

accuracy = testnet(net,imdsValidation,"accuracy")

scores = minibatchpredict(net,imdsValidation);
YValidation = scores2label(scores,classNames);

numValidationObservations = numel(imdsValidation.Files);
idx = randi(numValidationObservations,9,1);

figure
tiledlayout("flow")
for i = 1:9
    nexttile
    img = readimage(imdsValidation,idx(i));
    imshow(img)
    title("Predicted Class: " + string(YValidation(idx(i))))
end
%% 

accuracy = testnet(net,imdsValidation,"accuracy")

%% 导入Pytorch的预训练网络

clc;clear;close all
net = importNetworkFromPyTorch('digit_cnn.pt')