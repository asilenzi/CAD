#!/usr/bin/python
# coding=utf-8
import encodings
#encodings.utf_8
import numpy
import sys
import time
#import Gnuplot,Gnuplot.funcutils


#Program was made by Daniel Kucharski kucharski22daniel@gmail.com
#please use it with care!!!! and send me your ideas!
#
#version 0.16 08.11.2011
#

''' program służy do odczytu z pliku wynikow z elmera wynikow dla punktow podanych w linii
 np plik_wynik.py   dane.ep   x=1  k=  plik.wynik   
 tzn odczyt od dane.ep wszystkie punkty na osi x=1 y = 0,5 z =0 rnd=2 wynik=[1,2] czas=
opcje dla polecenia
x= chosen cords x
y= chosen cords y
z= chosen cords z
rnd=dokladnosc wyboru wspolrzenej
czas=[0,1,2] - czasy dla ktorych sa rysowane wykresy
how_many_times - opcja kaze sprawdzic ile jest czasow w pliku wynikow

ta wersja nie sprawdza najpierw ile jest czasów tylko do razu przeszukuje plik i szuka słowa time
ponadto nie szuka słówka time tylko po znalezieniu pierwszej wartości dodaje do położenia tyle linii ile 
potrzeba aby znaleźć poszukiwaną wartość
 '''
         
                
''' Do poprawy
 poprawe wyszukiwanie cyfr połączonych gdy - !!!
  Poprawiono to w ten sposób że zawsze każda liczba zajmuje 20 znaków
  dodac wyniki dla 3d
  '''

#mnoznik_czasu=1
#120.0/3600


global byte_first_time, how_many_bytes_take_one_line

global liczba_punktow




def rozdziel_cyfry_w_linii(linia,jak_duzo_cyfr_odczytujemy):
         tab=[]

         #print linia
         #print jak_duzo_cyfr_odczytujemy

         #jezeli pierwszy znak jest spacja to go usuwam
         #if linia[0]==" ":
         #         linia=linia[1:]
         linia=linia.strip()
                  
         linia=linia.split(" ")
         
         #print linia     
         
         ii=0
         for k in linia:
                  if len(k)<=1:
                           del linia[ii]
                           
                  ii +=1
                  
         #print linia 
         
         ile_liczb=len(linia)
         
         #if len(linia)==jak_duzo_cyfr_odczytujemy
         
         
         if ile_liczb==jak_duzo_cyfr_odczytujemy:
                  #wszystko dobrze mamy tyle liczb ile potrzeba
                  for	k in	range(0,ile_liczb):
                  
                           tab.append( float( linia[k] ) )
                           #print tab
         
         elif ile_liczb<jak_duzo_cyfr_odczytujemy:
                  #cos jeszcze musi byc rozdzielone, mamy mniej liczb niz trzeba
                  
                  for k in linia:
                           a=1
                           while(len(k)>0 ):
                                    a=k.find("E")
                                    a +=5
                                    #print "przed ",k
                                    tab.append( float( k[0:a] ) )
                                    
                                    #print tab
                                    
                                    k=k[a:]
                                    
                                    #print "pozostale k po ",k," dlugosc ",len(k),a
                                        
                  if len(tab)<jak_duzo_cyfr_odczytujemy:
                          print "!!!", linia
                          print tab
                          sys.exit()
         
         #print ile_liczb
         #for	k in	range(0,ile_liczb):
         #         tab.append( float( linia[k*20:(k+1)*20]) )
         #         print tab
         
         #print tab
         #raw_input("press THE key")
         return	tab
         
def show_options():
         print "\n\t version 0.16 from 08.11.2011\t\n"
         print "\n help  - show  help page \n"
         print "For wich cordinate you want results"
         print "'x=' <cordinate_x>"
         print "'y=' <cordinate_y>"
         print "'z=' <cordinate_z>"
         print "'rnd=' Very important - how many digits will round function take \n\n"
         
         print "\nTypes of created tables from ep file :"
         print "\t 'time_graph' - to show results vs time, need only one point \n"
         print "\t 'notime' - chose this option if you want 1d or 2d chart for chosen time\n "
         print "\t 'times=' -  to  choose times in file, from which you want results, place your times between braces e.g.: [n,m,z]\n \n\t\t not sure what number ? try 'how_many_times first'  "
         print "\t 'result='<which> -  Have to be set to choose which result are to be taken from ep file, \n not sure what number ? try 'results' first" 
         print "\n\n Options for checking what is in the ep file"
         
         print "\t 'how_many_times' - just check and leave"
         
         print "\t 'results' -  to show what results are in the file and what are their number"
         
         #print "geometry - show using gnuplot how geomtrics look like only for z=0, "
         print "'file=' - where should I write results"
         #print "tm - which is the value of one time interval"
         
         print "\n Options for methods of write result that have been found:\n "
         print "\t 'wcord=' <which coordinates have to be written, possibilities are 1 - for x, 2 - for y, 3 for - z"
         print "\t 'sort=' set this option if you want to sort results for x=1 or y=2 or z=3 axis "
         
         

def	what_times():
         #check how many times
         i=0
         linia=plik.readline()
         while(linia):
                           
                  #print linia
                  if linia.find('time')>0:
                           #print linia
                           i=i+1
                  linia=plik.readline()
         print "I check and there is ",i," time"
         raw_input("press THE key")
         return	i

def	where_is_first_time():
         #check how many times
         i=0
         linia=plik.readline()
         while(i==0):
                           
                  #print linia

                  if linia.find('time')>0:
                           #print linia
                           i=1
                           #print "11",linia
                  else:
                           byte_first_time=plik.tell()   
                           linia=plik.readline()
                           
         print "I check and first time is for ",byte_first_time
         #byte_first_time=plik.tell()
         #raw_input("press THE key")
         return	         byte_first_time

#def how_many_bytes_take_one_line(byte_first_time):
#
#         linia=plik.readline()
                  
                  

         
         
                  



def	what_results():
         plik.seek(0)
         linia=plik.readline()
         tab=linia.split()
         print tab
         print "In file there are :",tab[2]," DOF for ",tab[0]," coordinates "
         print tab[3]," time points"
         #wynajduje wszystkie slowa scalar i ich numery, numer o jeden wiecej to nazwa wyniku tu zapisanego
         spis_numerow=[]
         szukane_slowa=["scalar:","vector:"]
         for	i in	szukane_slowa:
                  od=0
                  while (i in tab[od:]):
                           j=tab.index(i,od)
                           spis_numerow.append(j)
                           od=j+1
                           

         spis_numerow.sort()
         print spis_numerow
         j=0
         for i in spis_numerow:
                  if	 tab[i]=="scalar:":
                           print	"Result ",j," -> ",tab[i+1]
                           baza_wynikow[j]=tab[i+1]
                           j=j+1
                  elif 	tab[i]=="vector:":
                           for	k in ["x","y","z"]:
                                    print	"Result ",j," ",k," -> ",tab[i+1]
                                    
                                    baza_wynikow[j]=str(tab[i+1]+" "+k)
                                    
                                    j=j+1
                                    
         plik.seek(0)
         
         
         
def	search_results(czas):
         global current
         i=0; #jezeli wykryje linie zawierającą napis time to dalej odczytuj pozycje zapisane w tabeli

         #print "przeszukuje ",czas," w pliku ", plik
         #linia=plik.readline()
         #print linia
         #raw_input("press THE key")
         moment_czasu=0
         while(i==0):
                  linia=plik.readline()
                  if not linia:
                           return 0
                  #print linia
                  if linia.find('time')>0:
                           #print linia
                           if	int(linia.split()[1])==czas:
                                    i=1
				    moment_czasu=float(linia.split()[3])
				    print "Time moment =  ",moment_czasu
	                            #raw_input("press THE key")

         i=0
         #teraz przystępuje do odczytywania wynikow dla wybranych punktow, rozpoznaje je dzieki zapisowi w tabeli pozycje danych
         #pocz=plik.tell()         
         
         while(i<liczba_punktow):
                  
                  linia=plik.readline()
                  
                  #print linia
                  if i in tabela_pozycji_danych:
                           linia=rozdziel_cyfry_w_linii(linia,ilosc_rezultatow)
                           print linia                           
                           
                           tabela_wyniki.append([])
                           
                           for i_w in result:
                                    tabela_wyniki[len(tabela_wyniki)-1].append(linia[i_w])
                           
                           
                           #print tabela_wyniki
                           #tabela_wyniki.append(linia[result])
                           
                           
                           #print i+1,"\t",linia,"\t and result : ",linia[result]
                           
                           #ostatnie=len(tabela_wyniki)-1
                           
                           #print i, "->\t",tabela_wspolrzednych[ostatnie],"\t",tabela_wyniki[ostatnie]

                  #print linia
                  
                  
                  i=i+1
         #current=0
         #raw_input("press THE key")
         return moment_czasu

def	search_results2(czas):
         global current
         #procedura dziala w inny sposob - znajac polozenie pierwszego czasu i 
         
         #print czas
         #print liczba_punktow
         #print how_many_bytes_take_one_line
         #print          byte_first_time+(czas-1)*how_many_bytes_take_one_line*liczba_punktow
         plik.seek(byte_first_time+(czas-1)*how_many_bytes_take_one_line*liczba_punktow)
         
         
         i=0
         moment_czasu=0
         while(i==0):
                  linia=plik.readline()
                  #print linia
                  if not linia:
                           print "brak danych"
                           return 0
                  #print linia
                  #raw_input("press THE key")
                  if linia.find('time')>0:
                           print linia
                           if	int(linia.split()[1])==czas:
                                    i=1
				    moment_czasu=float(linia.split()[3])
				    print "Time moment =  ",moment_czasu
	                            

         i=0
         #teraz przystępuje do odczytywania wynikow dla wybranych punktow, rozpoznaje je dzieki zapisowi w tabeli pozycje danych
         #print "tabela"
         #print tabela_pozycji_danych
         
         #raw_input("press THE key")
         poczatek_czasu=plik.tell()
                  
         for i in tabela_pozycji_danych:
                  #linia=plik.readline().split()
                  
                  plik.seek(poczatek_czasu+i*how_many_bytes_take_one_line)
                  linia=plik.readline()
                  linia=rozdziel_cyfry_w_linii(linia,ilosc_rezultatow)
                  #print i,"\n",linia
                  #raw_input("press THE key")
                  if i in tabela_pozycji_danych:
                        
                           tabela_wyniki.append(linia[result])
                           print i+1,"\t",linia,"\t and result : ",linia[result]
                           #ostatnie=len(tabela_wyniki)-1
                           
                           #print i, "->\t",tabela_wspolrzednych[ostatnie],"\t",tabela_wyniki[ostatnie]

                  #print linia
                  
                  i=i+1
         #print tabela_wyniki
         #I calculate I for all chose line:
         #I have tables with cords, and current denisty. I have just to sum them
         #1. petla ktora po kolei sumuje dx=x(i-1) - x(i)
         #print tabela_wyniki
         current=0


         return moment_czasu



def      geometric():
         pass
####### START!	

print "\n\n\t\t\t ELMER results reader version 0.16 09.02.2011 \n"
print "\n\n\t\tadded new options <wcord>"
print "\n\n\t\tadded new options <sort>"

ktora_wspolrzedna=1
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

procedura_poszukiwawcza=search_results2

baza_wynikow={}

sorting=0

print sys.argv
if len(sys.argv)==1:
         show_options()
         sys.exit()
for i in sys.argv:
                  
         if i.find('x=')>=0:
                  exec(i)
                  print "\tI am searching coordinates with x = ",x,"\n"
                  wspolrzedna.append(0)
                  szukane.append(x)
         elif i.find('z=')>=0:
                  exec(i)
                  print "\tI am searching coordinates with z = ",z,"\n"
                  wspolrzedna.append(2)
                  szukane.append(z)
         elif i.find('y=')>=0:
                  exec(i)
                  print "\tI am searching coordinates with y = ",y,"\n"
                  wspolrzedna.append(1)	
                  szukane.append(y)
         elif i.find('rnd=')>=0:
                  exec(i)
                  print "Setup tolerance for search coordinates",rnd
                  
                  dokladnosc=rnd	
                  
         elif i.find('times=')>=0:
                  if i=="times=all":
                           times="all"
                  else:
                           exec(i)
                  print "\tChosen time = ",times,"\n"
                  czas=times		
         elif i.find('how_many_times')>=0:
                  #Heat
                  print "I now check how many times are in file"
                  
                  plik=open(sys.argv[1],'r')
                           
                  what_times()
                  plik.close()
                  sys.exit()
                  
         elif i.find('time_graph')>=0:
                  print "I will show you all time "
                  graph_time=1 #oznacza to ze wykres w funkcji czasu
                
         elif i.find('file')>=0:
                  i=i.split("=")
                  print "\t\tResults will be write to file  --> ",i[1],"\n"
                  nazwa_pliku=i[1]
                
         elif i.find('results')>=0:
                  #pokazuje spis rezultatow z pierszej linii pliku
                  #mozna pozniej podac jakie wyniki maja byc pokazane
                  print "I will show you what results are in file "
                  plik=open(sys.argv[1],'r')
                  what_results()
                  sys.exit()

         elif i.find('result=')>=0:
                  exec(i)
                  #print i
                  
                  result_tmp=i.split('=')
                  result=[]
                  for ij in  result_tmp:
                           if ij<>'result':
                                    if '[' in ij:
                                             print "no longer put number in bracec"
                                             sys.exit()
                                    else:
                                             result.append(int(ij))
                  
                  print "results=",result
                  #sys.exit()
         #elif i.find('tm=')>=0:
         #         exec(i)
         #         print "tm=",tm
         elif i.find('geometry')>=0:
                  print "I try to show how geometry of your problem look like"
                  szukane.append(0)
                  graph_time=2
                  tabela_wspolrzednych_x=[]
                  tabela_wspolrzednych_y=[]
         elif i.find('notime')>=0:
                  print "Whithout time"

                  graph_time=3
                  no_time=1
                  tabela_wspolrzednych_x=[]
                  tabela_wspolrzednych_y=[]
                  tabela_wspolrzednych_z=[]
         elif i.find('wcord=')>=0:
                  #exec(i)
                  #print i
                  i=i.split("=")
                  #print i
                  if i[1]=="x":
                           ff="x"
                           ktora_wspolrzedna=0
                  elif i[1]=="y":
                           ff="y"
                           ktora_wspolrzedna=1
                  else:
                           ff="z"
                           ktora_wspolrzedna=2
                  print "I am going to write results with",ff," axis"
                  #ktora_wspolrzedna=wcord-1      
         elif i.find('sort=')>=0:
                  #exec(i)
                  #print i
                  i=i.split("=")
                  #print i
                  sorting=int(i[1])
                  print "I am going to sort results with",sorting," axis points"
                  
         elif i.find('help')>=0:
                  show_options()
                  sys.exit()

#print "Bez pliku, wyniki na ekran "
                  
         #print i
                  
plik=open(sys.argv[1],'r')
#szukane_x=float(sys.argv[2])



what_results()

print baza_wynikow

#gplot=Gnuplot.Gnuplot()
print "\t\t Result file header \n"
linia=plik.readline()
tab=linia.split()
print linia
#print tab 
liczba_punktow=int(tab[0])
liczba_czasow=int(tab[3])
ilosc_rezultatow=int(tab[2])

print "\t\t There are ",liczba_punktow," coordinates "



#print "\n \t\tAll position in file is count from 0 (not 1) ! \n"
a=plik.tell()
linia=plik.readline()
linia=linia.split(" ")
if linia[0].isdigit():
         #tzn ze juz sa dane
         #i wynik wymaga procedury poszukiwawczej 1
         plik.seek(a)
         #print linia
         procedura_poszukiwawcza=search_results
         
else:
         #tzn ze kolejna linie trzeba cala odczytac
         
         #i wynik wymaga procedury poszukiwawczej 2 - szybciej
         pass         
         #print linia                  
         procedura_poszukiwawcza=search_results2

if "win" in sys.platform:
         print "platforma win "," graph time = ",graph_time
         procedura_poszukiwawcza=search_results
	
#print linia
i=0
tabela_pozycji_danych=[]
tabela_wspolrzednych=[]
#print wspolrzedna," ",szukane
raw_input("press THE key")
#
polozenie_w_szukane=[]
print "coordinates table which was find"
for a in wspolrzedna:
        polozenie_w_szukane.append(wspolrzedna.index(a))
#print polozenie_w_szukane        



#przeszukiwanie ktore punkty odpowiadaja szukanym wartościom
while(i<liczba_punktow):
#while(i<3):
         linia=plik.readline()
         #print i," linia : ",linia
         linia=rozdziel_cyfry_w_linii(linia,jak_duzo_wspolrzednych)

         if graph_time==1 or graph_time==0:
                  #for one point in time all times intervals
                
                  #print linia
                  czy_poszukiwana_wspolrzedna=0
                  #print wspolrzedna
                  #print szukane
                  for a in polozenie_w_szukane:
                           #print a
                           if round(linia[wspolrzedna[a]],dokladnosc)==round(szukane[a],dokladnosc):
                                
                                    czy_poszukiwana_wspolrzedna=czy_poszukiwana_wspolrzedna+1
                  #print linia
                  if czy_poszukiwana_wspolrzedna==len(wspolrzedna):
                           print linia,"\t", " is in position : ",i
                           #print linia[wspolrzedna],"\t",round(float(linia[wspolrzedna]),dokladnosc)
                           tabela_pozycji_danych.append(i)
                           
                                                     
                           tabela_wspolrzednych.append(float(linia[ktora_wspolrzedna]))
                           
                  '''if	round(linia[wspolrzedna[0]],dokladnosc)==round(szukane[0],dokladnosc):
                                #print linia
                                    if round(float(linia[wspolrzedna[1]]),dokladnosc)==round(szukane[1],dokladnosc):
                                             print linia,"\t", i
                                             #print linia[wspolrzedna],"\t",round(float(linia[wspolrzedna]),dokladnosc)
                                             tabela_pozycji_danych.append(i)
                                             tabela_wspolrzednych.append(float(linia[0]))'''
                  i=i+1
                
                
         elif     graph_time==2:
                  if       round(linia[2],dokladnosc)==round(szukane[0],dokladnosc):
                        
                           tabela_wspolrzednych_x.append(float(linia[0]))
                           tabela_wspolrzednych_y.append(float(linia[1]))
                           tabela_wspolrzednych_z.append(float(linia[2]))
                           
                  i=i+1
                  
                  
                  
         elif graph_time==3:
                  #zapisuje wszystkie wybrane wspolrzedne i zapisuje je bez time
                  # if       round(linia[2],dokladnosc)==round(szukane[0],dokladnosc):
                        
                           # tabela_wspolrzednych_x.append(float(linia[0]))
                           # tabela_wspolrzednych_y.append(float(linia[1]))
                           # tabela_pozycji_danych.append(i)
                           
                  czy_poszukiwana_wspolrzedna=0
                  #print wspolrzedna
                  #print szukane
                  for a in polozenie_w_szukane:
                           #print a
                           if round(linia[wspolrzedna[a]],dokladnosc)==round(szukane[a],dokladnosc):
                                
                                    czy_poszukiwana_wspolrzedna=czy_poszukiwana_wspolrzedna+1
                  #print linia
                  if czy_poszukiwana_wspolrzedna==len(wspolrzedna):
                           #print linia,"\t", i
                           
                           tabela_wspolrzednych_x.append(float(linia[0]))
                           tabela_wspolrzednych_y.append(float(linia[1]))
                           tabela_wspolrzednych_z.append(float(linia[2]))
                           tabela_pozycji_danych.append(i)
                           
                                                     
                           
                  i=i+1
                  
if   graph_time==2:
         #data=Gnuplot.Data(tabela_wspolrzednych_x,tabela_wspolrzednych_y,with="p")
         #gplot.plot(data)
         
         for j in range(0,i):
                  wiersz=str( (tabela_wspolrzednych_x[j])    ) +"\t"+str(tabela_wspolrzednych_x[j])+"\n"
                  wyniki.write(wiersz)                
         #print tabela_wspolrzednych_x,"\n",tabela_wspolrzednych_y
         #raw_input("press THE key")
         sys.exit()
         
print "I am searching for point = ",szukane
#," numer rysowany ",wspolrzedna
print "\t I am going to save ",len(tabela_pozycji_danych)," point"


if tabela_pozycji_danych==[]:
         print "Nothing was find"
         sys.exit()
         
if result==[]:
         print "I dont know which result I have to find"
         sys.exit()
   
         
raw_input("press any key")


if nazwa_pliku<>0:
         #print "\t\t\topen "
         wyniki=open(nazwa_pliku,"w",20)
         nofile=0




wyniki.write("; Results from file "+sys.argv[1]+"\n")
wyniki.write(";coord x \t coord y \t coord z \t") 
for j in result:
         wyniki.write(str( baza_wynikow[j]+"\t"))

         
wyniki.write("\n")




#jezeli wybrano wykres czasowy to z tabeli wybieram tylko pierwszy punkt
if graph_time==1:
         #print "pelna tabela pozycji danych"
         #print tabela_pozycji_danych
         #i=tabela_pozycji_danych[0]
         #tabela_pozycji_danych=[i]
         #i=tabela_wspolrzednych[0]
         #tabela_wspolrzednych=[i]
         #ilosc_czasow=times()
         #time=range(1,ilosc_czasow+1)
         print tabela_wspolrzednych 
        


	
plik.seek(0)

print "which byte for first time "
byte_first_time=where_is_first_time()



plik.seek(0)
plik.seek(byte_first_time)

linia=plik.readline()
print linia
linia=plik.readline()
#print linia
#linia=plik.readline()
#print linia
how_many_bytes_take_one_line=len(linia)
#print how_many_bytes_take_one_line
# print tabela_pozycji_danych
#raw_input("press THE key")


#ustawiam pierszy time
plik.seek(byte_first_time)


#print "Type of graph :",graph_time

start=time.time()



# tu odczytuje wyniki dla wybranych punktów
	
if graph_time==0:
         #print "Tabela \n \n"
         print tabela_wspolrzednych
         print "Result for one point for some times"
         print "There is  " ,liczba_czasow," time point"
         #raw_input("press THE key")
         for	czas in times:
                  tabela_wyniki=[]
                  moment_czasu=procedura_poszukiwawcza(czas)

                  if moment_czasu==0:
                           print "no more time point"
                           break
                  #tabela_wyniki
                  print "Time czas ",czas," :",tabela_wyniki
                  #print tabela_wspolrzednych[ktora_wspolrzedna]
                  #zzz=(str(moment_czasu)+"\t"+str(tabela_wspolrzednych[ktora_wspolrzedna])+"\t")
                  
                  #print zzz
                  
                  wyniki.write(str(moment_czasu)+"\t"+str(tabela_wspolrzednych[ktora_wspolrzedna])+"\t")
                  
                  for a in range(0,len(tabela_wyniki)):
                           wyniki.write(str(tabela_wyniki[a][0])+"\n")
                           print tabela_wyniki[a]
                  #data=Gnuplot.Data(tabela_wspolrzednych,tabela_wyniki,with="l")
                  #gplot.plot(data)
                  #
elif graph_time==1:

         #wyniki_czas=[]
         print "Result for one point for all times"
         print "There is  " ,liczba_czasow," time point"
         tabela_wyniki=[]
         #for	czas in time:
         moment_czasu=1
         
         #while(moment_czasu<>0):
         for czas in range(1,liczba_czasow+1):
         
                  tabela_wyniki=[]	

                  #moment_czasu=search_results2(czas)
                  moment_czasu=procedura_poszukiwawcza(czas)
                  if moment_czasu==0:
                           print "no more time point"
                           break

                  #print   "Sum current: ",current
                  print czas," :",tabela_wyniki[len(tabela_wyniki)-1]
                  wyniki.write(str(moment_czasu)+"\t"+str(tabela_wyniki[len(tabela_wyniki)-1][0])+"\n")
                #wyniki.write(str(czas*tm)+"\t"+str(current)+"\n")
                  print tabela_wyniki
                  print "which byte in file ",plik.tell()
                           
                  #wyniki_czas.append(tabela_wyniki

                  #data=Gnuplot.Data(time,tabela_wyniki,with="l")
                  #gplot.plot(data)
         print "The End of searching"


elif graph_time==3:
         #jeżeli odczytuje tylko macierz wyników dla jednego czasu
         print "Saving results   for ",times,"   \n \n"
         
         #print tabela_wspolrzednych
         #raw_input("press THE key")
         for	czas in times:
                  tabela_wyniki=[]
                  moment_czasu=procedura_poszukiwawcza(czas)
                  print "Time interval ",czas," is ",moment_czasu," s \n"
                  
                  #mat_wynik=numpy.matrix([tabela_wspolrzednych_x,tabela_wspolrzednych_y,tabela_wspolrzednych_z,tabela_wyniki])
                  #mat_wynik=mat_wynik.transpose()
                  
                  #vv=mat_wynik.argsort(axis=0)
                  #print vv
                  
                  
                  #print moment_czasu," :",mat_wynik
                  # raw_input("press THE key")
                  # print mat_wynik[vv[10,0]]
                  # print mat_wynik[vv[11,0]]
                  # print mat_wynik[vv[12,0]]
                  # print mat_wynik[vv[13,0]]
                  
                  #mat_wynik2=mat_wynik.copy()
                                  
                  # for a in range(0,len(mat_wynik)):
                           # mat_wynik[a,0]=mat_wynik2[ vv[a,1],0]
                           # mat_wynik[a,1]=mat_wynik2[ vv[a,1],1]
                           # mat_wynik[a,2]=mat_wynik2[ vv[a,1],2]
                           # mat_wynik[a,3]=mat_wynik2[ vv[a,1],3]
                  
                  # print czas," :",mat_wynik
                  
                  
                  for a in range(0,len(tabela_wyniki)):
                           # wyniki.write(str(tabela_wspolrzednych_x[a])+"\t"+str(tabela_wspolrzednych_y[a])+"\t")
                           wiersz = str(tabela_wspolrzednych_x[a])+"\t"+str(tabela_wspolrzednych_y[a])+"\t" +str(tabela_wspolrzednych_z[a])+"\t" 
                           
                           for a2 in tabela_wyniki[a]:
                                    # wyniki.write( str(a2)+"\t")
                                    wiersz += str(a2)+"\t"
                           
                           # wyniki.write("\n")
                           
                           wiersz +="\n"
                           #wiersz=(str(mat_wynik[a,0])+"\t"+str(mat_wynik[a,1])+"\t"+str(mat_wynik[a,2])+"\t"+str(mat_wynik[a,3])+"\n")
                           #print wiersz
                           if nofile=="tak":
                              print wiersz
                           else:   
                              wyniki.write(wiersz)
                  #data=Gnuplot.Data(tabela_wspolrzednych,tabela_wyniki,with="l")
                  #gplot.plot(data)
                  #raw_input("press THE key")

                  
#raw_input("press THE key")
print "\n\tGreat! Results were saved in ",nazwa_pliku,"\n", "\t and lasts ",time.time()-start," s"

wyniki.seek(0)

plik.close()
if not nofile:
      wyniki.close()
      

#it only useful for notime option
wyniki=open(nazwa_pliku,"r")
wyniki_sorted=open(nazwa_pliku+"_sorted","w")
if sorting<> 0 and graph_time==3:
         #tabela_wyniki = numpy.fromfile(nazwa_pliku,count=-1,sep="\n ")
         print "Now I am sorting \n"
         tabela=[]
         tabela_do_sortowania=[]
         linia=wyniki.readline()
         while(linia):
                  if (not ';' in linia) :
                           linia=linia.strip()
                           linia=linia.split("\t")
                           # print linia
                           for i in range(0,len(linia) ):
                                    linia[i] = float(linia[i])
                           
                           tabela.append(linia)
                           tabela_do_sortowania.append(linia[sorting-1])
                           #print linia
                  else:
                           wyniki_sorted.write(linia)        
                  linia=wyniki.readline()
         

         
        
         #for i in tabela:
                  #print i
                  #raw_input("press THE key")
         print "Now I am sorting "
         
         
         index_after_sorting=numpy.argsort( tabela_do_sortowania)
         #sorted( tabela_do_sortowania )
         #numpy.searchsorted( tabela_do_sortowania)

         #print index_after_sorting
         
         for i in index_after_sorting:
                  #print tabela[i]
                  wiersz=""
                  for ni in tabela[i]:
                           wiersz += str(ni)+"\t"
                  
                  wiersz +="\n"
                  wyniki_sorted.write(wiersz)
         #for i in tabela:
         #         print i
         wyniki_sorted.close()
      
