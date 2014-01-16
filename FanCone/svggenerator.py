#!/usr/bin/env python
from lxml import etree

maxy=500
maxx=500
openingstring="<?xml version=\"1.0\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" height=\""+str(maxy)+"mm\" width=\""+str(maxx)+"mm\" >\n<g style=\"fill-opacity:1.0; stroke:black; stroke-width:1;\">\n"
closingstring="</g>\n</svg>\n"

class svggenerator():
    def __init__(self,filename="out.svg"):
        self.f=open(filename,"w")
        self.f.write(openingstring)
        self.linenum=6
        self.material=4
        self.finger_width=6
        self.first_point=[0,0]
        self.last_point=[0,0]

    def set_material(self,dx):
        self.material=dx
    def set_finger_width(self,dx):
        self.finger_width=dx

    def set_first_point(self,dx):
       self.first_point=dx

    def close_line():
        self.line(self.last_point,self.first_point):
        
    def line(self,x2):
        string="    <line\n       x1=\""+str(self.last_point[0])+"mm\"\n       y1=\""+str(self.last_point[1])+"mm\"\n       x2=\""+str(x2[0])+"mm\"\n       y2=\""+str(x2[1])+"mm\"\n       id=\"line"+str(self.linenum)+"\" />\n"
        self.linenum+=2
        self.last_point=x2
        self.f.write(string)
        
    def line(self,x1,x2):
        string="    <line\n       x1=\""+str(x1[0])+"mm\"\n       y1=\""+str(x1[1])+"mm\"\n       x2=\""+str(x2[0])+"mm\"\n       y2=\""+str(x2[1])+"mm\"\n       id=\"line"+str(self.linenum)+"\" />\n"
        self.linenum+=2
        self.first_point=x1
        self.last_point=x2
        self.f.write(string)

    def finger(self,x1,angle):
        

    def close(self):
        self.f.write(closingstring)
        self.f.close()

"""
# create XML 
root = etree.Element('root')
root.append(etree.Element('child'))
# another child with text
child = etree.Element('child')
child.text = 'some text'
root.append(child)
# pretty string
s = etree.tostring(root, pretty_print=True)
print s
"""


def main():
    #generate a square
    s=svggenerator()
    points=[[0,0],[10,0],[10,10],[0,10]]
    for i in range(len(points)):
        s.line(points[i%len(points)],points[(i+1)%len(points)])
    s.close()

if __name__=="__main__":
    main()
