## Applying Contextual Polarity to Tweet Classification

**Project description:** My group's semester project for CMSC 473, Natural Language Processing, involved adapting a process for two-step sentiment classification of phrases in a text to twitter sentiment analysis. Starting from a labeled tweet dataset downloaded from [Data For Everyone](https://www.figure-eight.com/data-for-everyone/), pre-processing and feature engineering was done in R ,and the model training and evaluation was performed in Python.  
  
**Tools Used:** R (tidyverse), Python (sklearn, numpy, scipy)  
  
**Abstract:** This paper aims to take the work described in “Recognizing Contextual Polarity in Phrase-Level Sentiment Analysis” ([Wilson et al, 2005](https://www.aclweb.org/anthology/H05-1044.pdf)) and implement the features they discuss for use in the sentiment classification of tweets. Input tweets will be classified as positive, negative, or neutral. Our approach uses the scikit-learn toolkit’s SGDClassifier as a MaxEnt model. In the experimentation phase, the model is evaluated on development split with different features on each phase in order to discover which produce the highest Macro F 1 score. Results are compared to a baseline model that only takes unigram features into account. Our final results show significant improvement within our domain, but performs similarly to the baseline when applied to a new dataset.  
  
[Full Paper](../pdf/Drew_Miller_Smith_Umair_Final_Report.pdf)  
