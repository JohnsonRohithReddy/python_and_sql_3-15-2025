'''
2. Read a JSON file in python and parse it and find the number of males and females 
are present.
{
    "people" : [
        {
            "firstName": "Joe",
            "lastName": "Jackson",
            "gender": "male",
            "age": 28,
            "number": "7349282382"
        },
        {
            "firstName": "James",
            "lastName": "Smith",
            "gender": "male",
            "age": 32,
            "number": "5678568567"
        },
        {
            "firstName": "Emily",
            "lastName": "Jones",
            "gender": "female",
            "age": 24,
            "number": "456754675"
        }
    ]
}

Have this data placed in a json file and add some more data to it.
'''
import json
import pandas as pd

#using file system
def using_file_system(file_name):

  with open(file_name,'r') as file:
    data = json.load(file)
  #print(data['people'][0]['gender'])
  male_count=0
  female_count=0
  data=data['people']
  for i in range(len(data)):
    if data[i]['gender']=='female':
      female_count+=1
    else:
      male_count+=1
  print(f"Male Count : {male_count}")
  print(f"Female Count : {female_count}")

  #using pandas
def using_pandas(file_name):

  df = pd.read_json(file_name) 
  #print(df)
  df = pd.json_normalize(df['people'])
  print(df)
  gender_counts = df['gender'].value_counts()
  print(gender_counts)

file_name=input()
using_file_system(file_name)
using_pandas(file_name)
  

