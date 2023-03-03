#!/usr/bin/env python
# coding: utf-8

import os
import subprocess

print("This script compares two plastome annotations from two .tsv files")

os.chdir("/home/epidendrum/Downloads")

nameoffile1 = ""
nameoffile2 = ""

if nameoffile1 == "":
    nameoffile1 = input()
    print("Input name of first file:")
    
if nameoffile2 == "":
    print("Input name of second file:")
    nameoffile2 = input() 

command1 = "awk '{print $1}' " + nameoffile1 + " > file1.txt"
command2 = "awk '{print $1}' " + nameoffile2 + " > file2.txt"

subprocess.call(command1, shell=True)
subprocess.call(command2, shell=True)

file1 = open("file1.txt", "r")
file2 = open("file2.txt", "r")

data1 = file1.read()
data2 = file2.read()

list1 = data1.split("\n")
list2 = data2.split("\n")

print("Hace falta en el segundo archivo en referencia al primero")
print(list(set(list1)-set(list2)))
print("Hace falta en el primer archivo en referencia al segundo")
print(list(set(list2)-set(list1)))
