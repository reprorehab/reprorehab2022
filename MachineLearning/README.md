# ReproRehab: Introduction to Machine Learning 

This 5-week introduction to Machine Learning is heavily (completly?) borrowed from the [ABCD-ReproNim Course on Machine Learning](https://www.abcd-repronim.org/ml.html) that was delivered in early 2022.

## Background
The **ABCD-ReproNim AM/ML Course** endeavored to start with material from an introductory standpoint that does not assume any prior background in machine learning. We do, however, strongly recommend that AI/ML Course students enter the course with at least some prior working knowledge of the coding and reproducibility principles. In other words, the AI/ML Course materials assumes a basic familiarity with Python 3.0, using Jupyter notebooks, and GitHub.  

_The ABCD-ReproNim AI/ML Course Learning Outcomes._ The AI/ML Course aimed to address the following competencies and skills:

* Training and publishing ML models (including choosing and validating models).
* Organizing and evaluating data for ML applications.
* Reusing existing models efficiently.
* Ethical, legal, and social implications described including but not limited to: biases in datasets, algorithms, and applications; concerns related to privacy and confidentiality; impacts on disadvantaged or marginalized groups and health disparities; and unintended, adverse social consequences of research and development.

Each week of the 5-Week AI/ML course will focus on two pre-recorded lecture videos. Supplemental readings and/or web resources that are paired with each lecture will also be available. Data exercises were provided each week, but these were tailored to the specifics of the ABCD dataset (and predicated upon access to that data set) so those are de-emphasized for the porpose of the ***ReproRehab*** Program. Weekly pre-recorded lectures and exercises were provided on the following topics: 

1. Core Concepts in ML
1. Supervised/Unsupervised ML
1. Neuroimaging ML
1. Introduction to Deep Learning
1. Explainable ML and FAIRness in ML/AI Applications

## AI/ML Materials
### Week 1 ([Original ABCD-ReproNim Source](https://abcd-repronim.github.io/materials/aiml-week-1/))
####Core Concepts in Machine Learning 1
Instructor: **Nikhil Bhagwat**, McGill University

[Video](https://youtu.be/3a544HgaSfU)

_Learning Objectives:_

* Machine Learning nomenclature (supervised, unsupervised)
* Basics of “learning” 
* Bias-variance tradeoff and model complexity 
* Model selection and cross-validation 
* Model evaluation metrics

_Readings:_

1. [Linear models in scikit learn](https://scikit-learn.org/stable/modules/linear_model.html#ridge-regression-and-classification)
1. [Cross-validation in scikit learn](https://scikit-learn.org/stable/modules/cross_validation.html#cross-validation)
1. [In-depth lecture on supervised learning with linear regression (time-stamped video @ 40mins)](https://www.youtube.com/watch?v=jGwO_UgTS7I&t=2399s)
1. [Detailed explanation of model regularization](https://www.youtube.com/watch?v=u73PU6Qwl1I)

#### Core Concepts in Machine Learning 2
Instructor: **Jérôme Dockès**, McGill University

[Video](https://youtu.be/c9ayKFSt_Ek)

_Learning Objectives:_

* Model evaluation and selection; cross-validation and pitfalls
* Regularization, selecting the ridge hyperparameter
* Dimensionality reduction, cross-validating feature selection, linear decompositions

_Readings:_

1. [Chapter 2.1 of 'An Introduction to Statistical Learning' by G. James, D. Witten, T. Hastie, and R. Tibshirani](https://hastie.su.domains/ISLR2/ISLRv2_website.pdf#page=26)
1. [Chapter 2.2 of 'An Introduction to Statistical Learning' by G. James, D. Witten, T. Hastie, and R. Tibshirani](https://hastie.su.domains/ISLR2/ISLRv2_website.pdf#page=40)


### Week 2 ([Original ABCD-ReproNim Source](https://abcd-repronim.github.io/materials/aiml-week-2/))
#### Supervised Machine Learning
Instructor: **Meenakshi Khosla**, Cornell University

[Video](https://youtu.be/TBFkkZHCAG4)

_Learning Objectives:_

* Supervised ML approaches using tabular data
* Linear models
* Tree-based models
* Ensemble-based models (random forest)
* Preprocessing approaches

_Readings:_

1. [Linear Regression](https://see.stanford.edu/materials/aimlcs229/cs229-notes1.pdf)
1. [Gradient Descent Concepts](https://ruder.io/optimizing-gradient-descent/)
1. [Gradient Descent Coding](https://cs229.stanford.edu/notes-spring2019/Gradient_Descent_Viz.pdf)
1. [Logistic Regression](https://www.youtube.com/watch?v=gNhogKJ_q7U)
1. [Decision Trees](https://alliance.seas.upenn.edu/~cis520/wiki/index.php?n=Lectures.DecisionTrees)

####Unsupervised Machine Learning
Instructor: **Eric Bridgeford**, Johns Hopkins University (JHU)

[Video](https://youtu.be/zewLyPPlqqg)

_**Learning Objectives:**_

* Network-valued data and connectomics
* Community Detection in network-valued data
* Spectral embedding
* KMeans clustering

_**Readings:**_

1. [Jupyter Notebook from lecture](https://github.com/neurodata/talks/blob/main/abcd_unsupmethods_eb.ipynb)
1. [Network Machine Learning Book 2.2.1: Installation Requirements](https://docs.neurodata.io/graph-stats-book/foundations/ch2/get-the-data.html)
1. [Network Machine Learning Book Chapter 4: Network-valued data](https://docs.neurodata.io/graph-stats-book/representations/ch4/ch4.html)
1. [Network Machine Learning Book Chapter 5.3: Stochastic Block Models (SBMs)](https://docs.neurodata.io/graph-stats-book/representations/ch5/single-network-models_SBM.html)
1. [Network Machine Learning Book Chapter 5.4: Random Dot Product Graphs (RDPGs)](https://docs.neurodata.io/graph-stats-book/representations/ch5/single-network-models_RDPG.html)
1. [Network Machine Learning Book Chapter 6.1: Estimation in SBMs](https://docs.neurodata.io/graph-stats-book/representations/ch6/estimating-parameters_mle.html)
1. [Network Machine Learning Book Chapter 6.4: Estimation in RDPGs](https://docs.neurodata.io/graph-stats-book/representations/ch6/estimating-parameters_spectral.html)

### Week 3 ([Original ABCD-ReproNim Source](https://abcd-repronim.github.io/materials/aiml-week-3/))

#### Machine Learning for Neuroimaging: Supervised ML
Instructor: **Ruby Kong**, National University in Singapore (NUS)

[Video](https://youtu.be/oerzYxfBUQE) [Slides](https://drive.google.com/file/d/1wWLRlDWJKegdQiwhM2MbYvLkjNnwKiTv/view)

[Background Video](https://youtu.be/r1dP-_GVUEg)

_**Learning Objectives:**_

* Supervised ML in brain parcellation estimation
* Graphical models
* Hidden Markov Models
* Supervised ML in behavioral prediction 
* Prediction model: Linear Ridge Regression
* Prediction model: Kernel Ridge Regression

_**Readings:**_

1. [Optional (but helpful!) resource: Coursera course on Probabilistic Graphical Models](https://www.coursera.org/specializations/probabilistic-graphical-models)
1. [Optional (but helpful!) resource: Bayes Classifier and Naive Bayes lecture from Cornell](https://www.cs.cornell.edu/courses/cs4780/2018fa/lectures/lecturenote05.html)
1. [Optional (but helpful!) open access textbook: 'Probabilistic Machine Learning: An Introduction' by Kevin Murphy](https://mitpress.mit.edu/9780262046824/)


####Machine Learning for Neuroimaging: Unsupervised ML
Instructor: **Ting Xu**, Child Mind Institute (CMI)

[Video](https://youtu.be/EnVLU0B5B2g) [Slides](https://drive.google.com/file/d/14nne1ExmHj3yGhHb1Kg7MSFZ_Vky3Rk9/view)

_**Learning Objectives:**_

* Unsupervised ML in neuroimaging
* Clustering
* Embedding
* Evaluate the results and potential issues in neuroimaging data

_**Readings:**_

1. ['Human brain mapping: A systematic comparison of parcellation methods for the human cerebral cortex' by Salim Arslan et al.](https://pubmed.ncbi.nlm.nih.gov/28412442/)
1. ['BrainSpace: a toolbox for the analysis of macroscale gradients in neuroimaging and connectomics datasets' by Reinder Vos de Wael et al.](https://www.nature.com/articles/s42003-020-0794-7)
1. [Optional (but helpful!) readings: full list of references and toolboxes included in the lecture](https://drive.google.com/file/d/1VsbcYvLA75olllU0XNW-SW29W9cox9LQ/view)

### Week 4 ([Original ABCD-ReproNim Source](https://abcd-repronim.github.io/materials/aiml-week-4/))
#### Basic Introduction to Deep Learning
Instructor: **Patrick McClure**, National Institute of Mental Health (NIMH) 

[Video_Part1](https://youtu.be/d36ta4WN5ME) [Video_Part2](https://youtu.be/WiX5PL-VVKE) [Video_Part3](https://youtu.be/z0H88ClsDNg) [Slides](https://docs.google.com/presentation/d/1wYvt9t6OCmOShaiYRyvb_7f-OFdicVSA/edit#slide=id.p1)

_**Learning Objectives:**_

* Linear Models and Loss Functions
* Gradient Descent 
* Single Layer Artificial Neural Networks
* Deep Neural Networks
* Convolutional Neural Networks

**_Readings:_**

1. [Feel free to check out this helpful online textbook, 'Dive into Deep Learning: An Interactive Deep Learning Book With Code, Math, and Discussions'](https://d2l.ai/)


####Foundations of Bayesian Learning
Instructor: **Archana Venkataraman**, Johns Hopkins University (JHU)

[Video](https://youtu.be/9ADd0UITapU) [Slides](https://drive.google.com/file/d/1F0Nt_ozZJtvep3CnxnSf2KIiv7Zp7-QS/view)

_**Learning Objectives:**_

* Probability Fundamentals
* Binary Hypothesis Testing
* Parameter Estimation
* Example: Identifying Atypical Brain Subnetworks

### Week 5 ([Original ABCD-ReproNim Source](https://abcd-repronim.github.io/materials/aiml-week-5/))
In lieu of instructor videos for this week, we will link to several relevant lectures and resources on the following topics:

#### Introduction to Explainable Machine Learning

**_Videos:_**

* [Explainable AI explained! | #1 Introduction](https://www.youtube.com/watch?v=OZJ1IgSgP9E&t=1s)
* [Explainable AI explained! | #3 LIME](https://youtu.be/d6j6bofhj2M)
* [Explainable AI explained! | #4 SHAP](https://www.youtube.com/watch?v=9haIOplEIGM)
* [Machine Learning Interpretability Toolkit](https://www.youtube.com/watch?v=EIvMxWfsOHo&t=1s)

_**Learning Objectives:**_

* Fair and interpretable models
* Feature explainers and their (mis-)utility: SHAP, LIME
* Trust in ML
* Other relevant concepts

_**Readings:**_

* [Local Surrogate (LIME)](https://christophm.github.io/interpretable-ml-book/lime.html)
* [SHAP (SHapley Additive exPlanations)](https://christophm.github.io/interpretable-ml-book/shap.html)
* [Model interpretability (preview)](https://learn.microsoft.com/en-us/azure/machine-learning/how-to-machine-learning-interpretability?ocid=AID2463683&wt.mc_id=ai-c9-sejuare)
* [Papers with Code - LIME Explained](https://paperswithcode.com/method/lime)
* [Papers with Code - SHAP Explained](https://paperswithcode.com/method/shap)


#### FAIR and FAIRness in Machine Learning
_**Videos:**_

* [How To Stop Artificial Intelligence From Marginalizing Communities? | Timnit Gebru | TEDxCollegePark](https://www.youtube.com/watch?v=PWCtoVt1CJM)
* [How I'm fighting bias in algorithms | Joy Buolamwini | TEDxBeaconStreet](https://www.ted.com/talks/joy_buolamwini_how_i_m_fighting_bias_in_algorithms?language=en)

_**Learning Objectives:**_

* Introduction to bias in ML/AI applications
* Data bias
* Model bias
* Making Biomedical Data FAIR and AI/ML-Ready

_**Readings:**_

1. ['Responsible Use of Open-Access Developmental Data: The Adolescent Brain Cognitive Development (ABCD) Study' by Cortney Simmons et al.](https://drive.google.com/file/d/1kL1HyoKzpheh9TBnnEMAyfNVQjfT3diz/view)
1. ['Working Towards Understanding the Role of FAIR for Machine Learning' by Daniel S. Katz et al.](https://repository.publisso.de/resource/frl:6430060/data)



