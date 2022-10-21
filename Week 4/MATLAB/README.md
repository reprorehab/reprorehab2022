# Objective
The objective of the ReproRehab MATLAB curriculum is to help learners gain proficiency in creating rigorous, reproducible data analysis pipelines. To this end, learners will use a combination of video lectures, online tutorials, and hands-on activities to develop a set of analyses for an open-source data set comprised of kinematic, kinetic, and EMG data. As you work through the content, feel free to post comments and questions on ReproRehab Slack or reach out to the Teaching Assistants if you encounter any major challenges along the way.

# Week 4 - Introductory Material 
### Maximum Time Committment - 4 Hrs
Learners who have not been following the full ReproRehab curriculum should begin by watching the Introduction to Data Analysis video from Week 2 [here (40 min)](https://www.youtube.com/watch?v=13IuiwPAPUY). This video reviews key concepts about data and measurement and also provides a detailed description of the steps involved in a standard data analysis pipeline. 

Next, those who are new to programming or who have little programming experience should watch the Introduction to Principles of Programming video **here (34 min)**. This video provides a brief overview of the most common use cases for MATLAB and then reviews key programming principles to keep in mind as you are developing your code. Most of these principles are derived from the book [MATLAB for Behavioral Scientists by Rosenbaum, Vaughan, and Wyble](https://www.mathworks.com/academia/books/matlab-for-behavioral-scientists-rosenbaum.html).

The third video in the series **here (30 min)** provides a walkthrough of the MATLAB interface for those who may be new to MATLAB. If you are using MATLAB for the first time, we highly recommend completing the [MATLAB OnRamp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted) and the [Using the MATLAB Desktop](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=2) module of MATLAB Fundamentals through Mathworks. This is an interactive, online course that introduces many of the most fundamental elements of MATLAB through a series of easy-to-follow modules. 

The remaining content will involve the analysis of [data](https://doi.org/10.6084/m9.figshare.c.4494755) from a study of walking and stair descending ([Lencioni et al., 2019](https://doi.org/10.1038/s41597-019-0323-z)). This dataset was selected because it includes several different types of raw and processed data, and it is published as a Data Descriptor with detailed information about the study protocol, data structure, data reliability and validation, and links to the authors’ analysis code. You should read this paper and familiarize yourself with the structure and content of the data repository.

# Step-by-Step Data Analysis Pipeline in MATLAB

# Week 5 (Maximum Time Committment - 4 hrs)
1. [Know Your Data](#know-your-data)
2. [Know What You are Trying to Do](#kwyattd)
3. [Import Data into MATLAB](#idim)
4. [Perform Manual or Automated Quality Control](#pmoaqc) 
5. [Perform Necessary Pre-Processing Steps](#pnps) 
6. [Compute Summary Measures](#csm) 

<h3 id="know-your-data">1. Know Your Data</h3>
Here, we will perform some exploratory data analysis that will require you to import data into MATLAB and perform some basic data visualization. In Part 1 (16 min), we review content from the manuscript and data repository related to the study protocol, measurement characteristics, and data organzation. In Part 2 (46 min), we load the data in Matlab and use several techniques to explore the data in more detail. If the steps described in the video are new to you, you may want to review the following MATLAB tutorials. 

- [Using the MATLAB Desktop (0.5 hrs)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=2)
- [Visualizing Data in 2D and 3D (1 hr)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=6)

<h3 id="kwyattd">2. Know What You are Trying to Do</h3>
<h3 id="idim">3. Import Data into MATLAB </h3>

- [Using _load_ to Import Matlab Data (15 min)](https://www.mathworks.com/help/matlab/ref/load.html?searchHighlight=load&s_tid=srchtitle_load_1#d124e871871)
- [Using _readtable_ to Import Data from csv, txt, or Excel Files (15 min)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=9)

<h3 id="pmoaqc">4. Perform Manual or Automated Quality Control </h3>
<h3 id="pnps">5. Perform Necessary Pre-Processing Steps </h3>
<h3 id="csm">6. Compute Summary Measures </h3>

# Week 6
7. [Create Figures](#cf)
8. [Perform statistical analysis](#psa)
9. [Save the results](#str)

<h3 id="cf">7. Create Figures </h3>
Before creating figures to visualize your data, you should carefully consider the message you are trying to convey and be thoughtful about the type of figure you use to convey that message. The following video 1) provides an overview of the use cases for some of the most common forms of data visualization, 2) introduces key principles for graphical illustration of data, and 3) describes MATLAB-specific strategies for creating high-quality figures

## Video
- [Principles of Graphical Illustration of Data in MATLAB (36 min)]

## Reading (Optional)
- [Rougier NP, Droettboom M, Bourne PE (2014) Ten Simple Rules for Better Figures](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003833) 
- [Weissgerber TL, Milic NM, Winham SJ, Garovic VD (2015) Beyond Bar and Line Graphs: Time for a New Data Presentation Paradigm](https://doi.org/10.1371/journal.pbio.1002128) 
- [Junk Charts](http://junkcharts.typepad.com/)
- [Tufte, ER (2001) The Visual Display of Quantitative Information.](https://www.amazon.com/Visual-Display-Quantitative-Information/dp/1930824130)
- [Rosenbaum, DA (2014) Matlab for Behavioral Scientists. Routledge.](https://www.mathworks.com/academia/books/matlab-for-behavioral-scientists-rosenbaum.html)

## Complementary Course (Optional)
- [Data Visualization for Data Analysts (2 hrs)](https://www.linkedin.com/learning/data-visualization-for-data-analysis-and-analytics)

<h3 id="psa">8. Perform Statistical Analysis </h3>
<h3 id="str">9. Save The Results </h3>






