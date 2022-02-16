from pandas import *
data = read_csv("listmovie.csv")
 
title = data['Title'].tolist()
ratt = data['RatingTomatometer'].tolist()
genres = data['Genres'].tolist()



    
