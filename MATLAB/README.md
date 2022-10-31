# Objective
The objective of the ReproRehab MATLAB curriculum is to help learners gain proficiency creating rigorous, reproducible data analysis pipelines. To this end, you will use a combination of video lectures, online tutorials, and hands-on activities to decipher a pre-existing data analysis pipeline and develop their own analysis scripts for an open-source data set comprised of kinematic, kinetic, and EMG data. As you work through the content, feel free to post comments and questions on ReproRehab Slack or reach out to the Teaching Assistants if you encounter any major challenges along the way.

# Week 4 - Introductory Material 
### Expected Time Committment - 3-4 Hrs
If you have not been following the full ReproRehab curriculum, you should begin by watching the Introduction to Data Analysis video from Week 2 [here (40 min)](https://www.youtube.com/watch?v=13IuiwPAPUY). This video reviews key concepts about data and measurement and also provides a detailed description of the steps involved in a standard data analysis pipeline. 

Next, those who are new to programming or who have little programming experience should watch the Introduction to Principles of Programming video [here (34 min)](https://www.youtube.com/watch?v=5g-9rYCMgKg&list=PLV4PTzGI0GjXsLB__HYAsNhbcfk-lL70Z&index=2). This video provides a brief overview of the most common use cases for MATLAB and reviews key programming principles to keep in mind as you are developing your code. Most of these principles are derived from the book [MATLAB for Behavioral Scientists by Rosenbaum, Vaughan, and Wyble](https://www.mathworks.com/academia/books/matlab-for-behavioral-scientists-rosenbaum.html).

Once you have a general sense of why one might use MATLAB, you should watch the third video in the series [here (30 min)](https://www.youtube.com/watch?v=LEMKyLuiuKw&list=PLV4PTzGI0GjXsLB__HYAsNhbcfk-lL70Z&index=3) which provides a walkthrough of the MATLAB interface for those who may be new to MATLAB. If you are using MATLAB for the first time, we highly recommend completing the [MATLAB OnRamp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted) and the [Using the MATLAB Desktop](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=2) module of MATLAB Fundamentals through Mathworks. This is an interactive, online course that introduces many of the most fundamental elements of MATLAB through a series of easy-to-follow modules. 

# Week 5 - Reviewing a Detailed MATLAB Analysis Pipeline
### Expected Time Committment - 3-4 Hrs
This week, you will work through the code introduced previously to model a standard data analysis pipeline in MATLAB. To do so, please download the Simulated Adaptation Folder in the repository and run each of the four scripts sequentially. After verifying that the scripts work, watch the videos below where the code is reviewed in detail and discuss any pieces of the code that you are unsure about with your TA. In addition, links are provided to resources from Mathworks that learners may find helpful to understand some of the functions and approaches used throughout the analysis pipeline. Most learners will not need to work through the Generating Simulated Data video unless they would like to simulate data for their own purposes.

1. [Generating Simulated Data (18 min)](https://youtu.be/IKy4ubpPpI8)

   *Optional content*
 - [Creating and Manipulating Arrays (1 hr)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=3)
 - [Accessing Data in Arrays (30 min)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=4)
 - [If Statements and For Loops (1.5 hrs)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=14)
2. [Compiling Data (11 min)](https://youtu.be/clRuD7s6hVw)

   *Optional content*
- [Creating Structures in MATLAB (30 min)](https://www.mathworks.com/help/matlab/matlab_prog/create-a-structure-array.html)
3. [Statistical Modeling of Data (15 min)](https://youtu.be/vZRElvxmChU)

   *Optional content*
- [Interacting with Tables in MATLAB (1 hr)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=9)
4. [Visualizing Data (15 min)](https://youtu.be/IO7tpVn-f9I)

   *Optional content*
- [Visualizing Data in 2D and 3D in MATLAB (1 hr)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=6)

# Week 6 - Developing a Step-by-Step Data Analysis Pipeline for Open Data
### Expected Time Committment - 4 Hrs
The remaining content for Weeks 6 and 7 will involve the analysis of [data](https://doi.org/10.6084/m9.figshare.c.4494755) from a study of walking and stair descending ([Lencioni et al., 2019](https://doi.org/10.1038/s41597-019-0323-z)). This dataset was selected because it includes several different types of raw and processed data, and it is published as a Data Descriptor with detailed information about the study protocol, data structure, data reliability and validation, and links to the authors’ analysis code. You should read this paper and familiarize yourself with the structure and content of the data repository.

1. [Know Your Data](#know-your-data)
2. [Know What You are Trying to Do](#kwyattd)
3. [Import Data into MATLAB](#idim)
4. [Perform Manual or Automated Quality Control](#pmoaqc) 
5. [Perform Necessary Pre-Processing Steps](#pnps) 
6. [Compute Summary Measures](#csm) 

<h3 id="know-your-data">1. Know Your Data</h3>
Here, we will perform some exploratory data analysis that will require you to import data into MATLAB and perform some basic data visualization. In [Part 1 (16 min)](https://youtu.be/2vmQEn0TTXo), we review content from the manuscript and data repository related to the study protocol, measurement characteristics, and data organzation. In [Part 2 (46 min)](https://youtu.be/_654sbErhBw), we load the data in Matlab and use several techniques to explore the data in more detail. If the steps described in the video are new to you, you may want to review the following MATLAB tutorials. 

- [Using the MATLAB Desktop (0.5 hrs)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=2)
- [Visualizing Data in 2D and 3D (1 hr)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=6)

<h3 id="kwyattd">2. Know What You are Trying to Do</h3>

Our goal is to use the data included in the repository linked above to test the hypothesis that the peak ankle doriflexion angle differs between normal walking, heel walking, and toe walking. To test this hypothesis, we first need to compile the joint angle data from all of the participants, compute the peak ankle dorsiflexion angles for each trial, organize the results by trial type, visualize the data, and perform a statistical analysis to test our hypothesis. 

<h3 id="idim">3. Import Data into MATLAB </h3>
<h3 id="pmoaqc">4. Perform Manual or Automated Quality Control </h3>
<h3 id="pnps">5. Perform Necessary Pre-Processing Steps </h3>

We will use a single script to compile the data from the 50 participants collected as part of the study described in Lencioni et al., 2019 and we will also recreate Figure 3 from the same manuscript. The videos linked below walk through the completed code for performing most of these steps. After watching the videos, you should try to complete the following tasks outlined in the scripts CompileJointAngleData_Step1, CompileJointAngleData_Step2, and  CompileJointAngleData_Step3.

## Tasks to complete within CompileJointAngleData_Step1

1. Modify a 'for' loop to make sure that the data from each participant are properly loaded. 
2. Use the load command in the proper location to load each participant's data
3. Write a 'for' loop to cycle through each trial and store the name of task that the participant performed during that trial. This name can be extracted directly from the participant's data structure.

## Tasks to complete within CompileJointAngleData_Step2
1. Use 'switch-case' to modify the definition of variables 'Panels', 'Trial_Name', and 'Joint_Angles_Walking' based on the task performed in the current trial.
2. Specify the proper input to the plot function to visualize the ankle angle as a function of the gait cycle
3. Create plots for the knee and hip angles

## Tasks to complete within CompileJointAngleData_Step3
1. Store the average joint angles for heel walking, toe walking, step ascent, and step descent.
2. Save the variables containing the average joint angles for the respective tasks to a file called 'Avg_Joint_Ankles.'

*Optional content*
- [Using _load_ to Import Matlab Data (15 min)](https://www.mathworks.com/help/matlab/ref/load.html?searchHighlight=load&s_tid=srchtitle_load_1#d124e871871)
- [Using _readtable_ to Import Data from csv, txt, or Excel Files (15 min)](https://matlabacademy.mathworks.com/details/matlab-fundamentals/mlbe#module=9)

# Week 7
7. [Create Figures](#cf)
8. [Perform statistical analysis](#psa)
9. [Save the results](#str)

<h3 id="csm">6. Compute Summary Measures </h3>
<h3 id="cf">7. Create Figures </h3>
Before creating figures to visualize your data, you should carefully consider the message you are trying to convey and be thoughtful about the type of figure you use to convey that message. The following video 1) provides an overview of the use cases for some of the most common forms of data visualization, 2) introduces key principles for graphical illustration of data, and 3) describes MATLAB-specific strategies for creating high-quality figures

## Video
- [Principles of Graphical Illustration of Data in MATLAB (36 min)](https://youtu.be/zBnza3SODw4?list=PLV4PTzGI0GjXsLB__HYAsNhbcfk-lL70Z)

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






