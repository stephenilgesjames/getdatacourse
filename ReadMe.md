My script does the following.
It gets the data into variables.
1.	Reads the Train data  into variables
2.	Reads the Test data into variables
3.	Reads the features data into variable
4.	Reads the Subject Train data into Variable
5.	Reads the Subject  Test data into variable

Inserts column names into the following (Test and for Train)
1.	Features as the column name x  data
2.	Hard codes the subjects column name into subject variable
3.	Hard codes the activity as the column name into y  data
Combine the data into 1 
1.	For Train and for Test create one variable  by binding the columns (cbind) of subject, activity, 
then data of test and train.
2.	Then with Test and Train  combine the rows using Rbound.

I now have complete data set.

Now break the data set into two with mean data into one and STD or standard Deviation into 
another.  But I have lost the y and subjects. So rebuild the activities and the subjects.

With the activities I add a column through hard coding the names of the description , WALKING, 
WALKING_UPSTAIRS ….. 

Now I have data for mean, std and the subjects and the activities

Then take the averages based on activity_name and averages based by subject 

Then combine the averages by activity then subject.







