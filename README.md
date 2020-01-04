# signature-verification
Undergrad mini-project to verify signature of use![GitHub Logo](/images/logo.png)r.

This is a MATLAB project with UI that uses Speeded-Up Robust Features, Support Vector Machines and K-Means Clustering.

## Abstract
Human beings tend to write down notes to aid memory, sign on documents to indicate authenticity, test documents for forgery, and leave behind books of fiction, knowledge and postulation for future generations to learn from. In this project, the concept of handwritten character recognition is approached using SURF feature extraction techniques. SURF algorithms detect interest points and generate descriptors for each of these interest points. The Bag of Features model is used in conjunction with SURF feature extraction in order to classify the handwritten signature. This model involves performing K-Means Clustering of extracted SURF Features to train a Support Vector Machine (SVM). An SVM is a supervised learning model that assigns new examples to one category or the other, making it a non-probabilistic binary linear classifier. After completing the training phase, a test signature submitted to the application undergoes the same phases of extraction, it is submitted for classification, and then to six threshold tests for forgery.

## Architecture diagram
![Architecture diagram](/images/diagram.png)
