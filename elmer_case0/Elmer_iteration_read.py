#!/usr/bin/python
# coding=utf-8
import encodings
#encodings.utf_8
import sys
import time
#import Gnuplot,Gnuplot.funcutils


#Program was made by Daniel Kucharski kucharski22daniel@gmail.com
#please use it with care!!!! and send me your ideas!
#
#version 25.02.2010
#

''' Program read information about computations from file generated during calculations

You have to run ElmerSolver in this way:
	ElmerSolver file.sif > log_file 
or simpler (if you define ELMERSOLVER_START
	ElmerSolver > log_file 	
	
	
	Elmer_iteration_read.py in=log_file out=out_file

options:
	"out=" =   name of output file
         "in="  = name of log file
That's ALL folks!

 '''
         

global byte_first_time, how_many_bytes_take_one_line

global liczba_punktow


def show_options():
         print "in=name of log file"
         
         print "out= where should I write results"
         

         
  
####### START!	

print "\n\n\t\t\t ELMER log reader version 0.1 25.02.2010 \n"

dokladnosc=2
tm=1
wspolrzedna=0
czas=1
result=[]
graph_time=0
dlugosc_jednej_liczby=20
wspolrzedna=[]
szukane=[]
no_time=0
nofile="tak"
nazwa_pliku=0
jak_duzo_wspolrzednych=3

start=time.time()

print sys.argv
if len(sys.argv)==1:
         show_options()
         sys.exit()
for i in sys.argv:                                 
         print i 
         if i.find('out=')>=0:
                  i=i.split("=")
                  print "\t\tResults will be write to file  --> ",i[1],"\n"
                  nazwa_pliku=i[1]
                  out=open(nazwa_pliku,'w')
                  
         elif i.find('in=')>=0:
                  i=i.split("=")
                  print i
                  print "Iterations and Convergance Tolerance are taken from ",i
                  
                  plik=open(i[1],'r')


                  

#gplot=Gnuplot.Gnuplot()
print "\t\t I am analysing file.... \n"



zapisz=0
global ilosc_iteracji
i=0
to=0
ilosc_rownan=0
rownani=[]
while(to==0 or i<40):
         linia=plik.readline()
         if "Loading" in linia :
                  #szukaj [
                  linia=linia.split("[")
                  #print linia
                  ilosc_rownan +=1
                  #print linia[1]
                  nazwa=""
                  for ii in linia[1]:
                           
                           if ii==']':
                                    break
                           else:
                                    nazwa +=ii
                  #print nazwa
                  rownani.append(nazwa)
                  #
         elif "MAIN" in linia:
                  to=1
                           
         i +=1
         
         

print "I have found ",ilosc_rownan," equations:"
for i in rownani:
         print i
         
#raw_input("press THE key")
#sys.exit() 
plik.seek(0)        
linia=plik.readline()

while(linia):
#while(i<3):
         linia=plik.readline()
         #print i,linia
         #ilosc_iteracji=0

         if "Time" in linia:
                  linia=linia.split("  ")
                  print linia
                  print linia[1]
                  #czy_cyfra=0
                  juz_slash=0
                  #ilosc_iteracja=0
                  
                  if zapisz==1:
                           out.write(str(time_point)+"\t"+str(ilosc_iteracji)+"\n")
                           zapisz=0
                           
                  time_point=""         
                  for i in linia[1]:
                           
                           if i.isdigit() and juz_slash==0:
                                    time_point+=i
                                    
                                    #czy_cyfra=1
                           elif i=='/':
                                    juz_slash=1         
                
                           
                  float(time_point)
                  print time_point
                  nowy_time=0
         elif "Coupled system iteration" in linia:
                  linia=linia.split()
                  #print linia
                  for i in linia:
                           if i[0].isdigit():
                                    ilosc_iteracji=int(i)
                                    #print "iteracje ",ilosc_iteracji
                                    zapisz=1                                    
         
if zapisz==1:  
         out.write(str(time_point)+"\t"+str(ilosc_iteracji)+"\n")                  
#raw_input("press THE key")
print "\n\tGreat! Results were saved in ",nazwa_pliku,"\n", "\t and lasts ",time.time()-start," s"
plik.close()
if not nofile:
      wyniki.close()
