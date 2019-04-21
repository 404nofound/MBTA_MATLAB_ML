# Boston Train Station's Passenger Flow Prediction

Using `Genetic Algorithm` to optimize `BP Neural Network`'s initial weight and threshold value.

Two kind prediction: `Whole Day prediction` and `Time Period Prediction`.

## Description

* Data Pre-Processing.ipynb: Generating input and output csv files

* MBTA_MATLAB Folder: Running in MATLAB to do prediction

## Tools

* **Neural Network Training Toolbox**

* **Sheffield Genetic Algorithms Toolbox**

* **MatLab**

* **Python Jupyter**

* **Numpy / Pandas**

* **Matplot**

* **Sklearn**

## Data

* MBTA historical passenger flow data, available in 
<a href="http://mbtabackontrack.com/performance/index.html#/download" target="_blank">MBTA</a>.

* Weather (Rain, Snow, Temperature) historical data, has been uploaded in current folder.

* US Holiday Data, Week, Month...

## Input

<img src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/1.png"/>

## Output

<img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/2.png"/><img width="38%" height="38%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/3.png"/>

## Design Structure

* Setting up BP Neural Network structure

* Using GA optimize initial weight and threshold

* Training and Testing BP Neural Network

<img src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/4.png"/>

## BP Neural Network Structure

<img width="80%" height="80%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/6.png"/>

## Genetic Algorithm Parameters

<img width="60%" height="60%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/5.png"/>

## Outcomes Display

#### BP NN Prediction without GA && BP NN Prediction with GA
<img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/7.png"/><img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/8.png"/>

#### BP NN & BP NN + GA Comparison
<img width="70%" height="70%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/9.png"/>

#### Prediction Error - BP NN without GA
<img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/10.png"/><img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/12.png"/>

#### Prediction Error - BP NN with GA
<img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/11.png"/><img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/13.png"/>

#### Evaluation / Performance / Training State / Error Histogram
<img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/14.png"/><img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/15.png"/>

<img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/16.png"/><img width="50%" height="50%" src="https://github.com/404nofound/Resource/blob/master/Images/MBTA_MatLab/17.png"/>
