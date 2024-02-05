# Pewlett-Hackard-Analysis
Report on "Silver Tsunami."

## Overview of the analysis
The purpose of this project is to conduct a Database analysis for Pewlett Hackard with detailed information on the number of future retirees from all departments currently working at the company to be able to prepare a plan to hire new staff and also to prepare a mentorship initiative.

I determined the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program.
 
## Results: 
1) I Gathered information about the Number of Retiring Employees by Title. The results are shown below. 
Fig: <img width="694" alt="Screen Shot 2022-07-25 at 11 43 51 PM" src="https://user-images.githubusercontent.com/106944351/180925015-cf801ad3-3124-495a-a2d8-381cb382b260.png">

2) The above table gives duplicate values as employees have changed their teams or titles over the years. I used DISTINCT ON () to get unique values as in only most recent title of each employee.
Fig: <img width="516" alt="Screen Shot 2022-07-25 at 11 42 59 PM" src="https://user-images.githubusercontent.com/106944351/180924884-ce263e83-4f8b-4b6f-9b38-ce3cf456d06d.png">

3) Determined The Employees Eligible for the Mentorship Program. 
Fig: <img width="827" alt="Screen Shot 2022-07-25 at 11 39 28 PM" src="https://user-images.githubusercontent.com/106944351/180924782-c40913cc-3abb-4fbe-ad0d-ce038e7e18ac.png">

4) A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.

## Summary: 
1) Figure shows that these many people are retiring and management should start the hiring people soon.
<img width="694" alt="Screen Shot 2022-07-25 at 11 43 51 PM" src="https://user-images.githubusercontent.com/106944351/180925015-cf801ad3-3124-495a-a2d8-381cb382b260.png"> 

2) Retirind title table explains how many employees are retiring and yes, there are enough qualified employees will be there to mentor the next generation.
<img width="694" alt="Screen Shot 2022-07-25 at 11 43 51 PM" src="https://user-images.githubusercontent.com/106944351/180925015-cf801ad3-3124-495a-a2d8-381cb382b260.png"> 


### Additional queries - 
We can find out how many people are retiring from each and every department so that manager will have an idea about future resource management.

We can also find out how many poeple are getting retired in next few years. So that,we can help to those soon to be retired people in mentorship or training program if we are lacking number of people in mentorship programs.
