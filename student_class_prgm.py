"""Write a program in python using classes

Class: Student

Method: getStudentInfo() : gets student's roll number and name from user.

Method: printStudentInfo() : prints student's roll number and name.

Class: Btech

Method: getBTech() : gets student's marks from user.

Method: printBTech() : prints student's marks.

Method: calcTotalMarks() : returns the sum of marks.

Class : Result

Method: getResult() : gets student's information and calculate total marks.

Method: printResult() : prints prints student information.
"""


class Student:
    def getStudentInfo(self):
        self.roll_num=int(input("Enter Roll Number: "))
        self.name = input("Enter Name: ")

    def printStudentInfo(self):
        print("Roll Number : "+str(self.roll_num)+" Name : "+self.name)

class Btech:

    def getBTech(self):
        self.marks= list(map(int,input("enter marks").split()))
    
    def printBTech(self):
        print(f"Marks in different subjects : {self.marks}")

    def calcTotalMarks(self):
        self.total_marks = sum(self.marks)
        return self.total_marks
    
class Result(Student, Btech):
    def getResult(self):
        self.getStudentInfo()
        self.getBTech()
        self.total_marks = self.calcTotalMarks()
    def printResult(self):
        #self.printStudentInfo()
        self.printBTech()
        print(f"Total Marks out of 300 : {self.total_marks}")

result_obj = Result()
result_obj.getStudentInfo()
result_obj.getBTech()
result_obj.calcTotalMarks()
result_obj.printResult()

