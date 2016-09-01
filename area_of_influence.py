
import random
import numpy
# Generate random numbers and stores it in arr .
length = input('Enter length of plane :')
#point_arr = input('Enter Array of ponts in list form:')
point_arr = [[1,2],[2,3],[3.5,2]]
def generate_array(length):
    arr = []
    l = length*length
    for p in range(l):
        x =random.randint(0,length)
        y =random.randint(0,length)
        arr.append([x,y])
    return arr

# find midpoint of array elements
def mid_arr_elem(arr):
    mid_arr = []
    for i in range(len(arr)-1):
        m1=float(((arr[i])[0]+(arr[i+1])[0])/2)
        m2=float(((arr[i])[1]+(arr[i+1])[1])/2)
        mid_arr.append([m1,m2])
    return mid_arr

def mid_point(val1,val2):
   mid = (val1+val2)/2
   return mid


def slope_line(p1,p2):
    if ((p1[0]-p2[0])==0):
        return 0 # p1[0]= p1[0]+1
    else:
        slp = (p1[1]-p2[1])/(p1[0]-p2[0])
        slp = float(-1/slp)
        return slp

def slp_arr(arr):
    slp_pnt = []
    for i in range(0,len(arr)-1):
        pt = slope_line(arr[i],arr[i+1])
        slp_pnt.append(pt)
    return slp_pnt

def find_c(pt,sl):
    c = pt[1]-(sl*pt[0])
    return c

def all_c_arr(mid_pt_arr,arr_slp):
     c_arr=[]
     for i in range(0,len(arr_slp)):
         c = find_c(mid_pt_arr[i],arr_slp[i])
         c_arr.append(c)
     return c_arr
    
arr = generate_array(length)
slp_pnt=slp_arr(point_arr)
mid_arr=mid_arr_elem(point_arr)
c_arr = all_c_arr(mid_arr,slp_pnt)
print('plane points:',arr)
print('Mid ponts list:',mid_arr)
print('Slope of all points:',slp_pnt)
print('Value of c',all_c_arr(mid_arr,slp_pnt))
#find_c((1,2),2)

#abc = [(x[0]+x[1])/2 for x in arr]
#print(abc)

def find_area_wrt(points_arr,genrated_arr,mid_arr,c_pnts,slp_arr):
    final_pts = []
    if(len(points_arr)==1):
        final_pts=genrated_arr
        return final_pts
    else:
        for i in range (len(points_arr)-1):
            arr1=[]
            a = slp_arr[i]
            b = points_arr[i][0] 
            val= a*b + c_pnts[i]-points_arr[i][1]
            len_list=len(genrated_arr)
            for j in range(len_list):
                del_elem=[]
                val1 = slp_arr[i]*genrated_arr[j][0]+c_pnts[i]-genrated_arr[j][1]
                print(val1)
                if(val1==0):
                    pt=genrated_arr[j]
                    arr1.append(pt)
                    del_elem.append(j)
            final_pts.append(arr)
            print(del_elem)
            remove_elem(genrated_arr,del_elem)
        return final_pts

def remove_elem(arr,ind_arr):
    for i in range (len(ind_arr)-1):
        arr.pop(ind_arr[i])
    return arr

#print(remove_elem(arr,[1,3,5]))
final_op = find_area_wrt(point_arr,arr,mid_arr,c_arr,slp_pnt)
def print_op(op_arr,pt_arr):
    for i in range (len(pt_arr)-1):
        print(pt_arr[i],op_arr[i])

print_op(final_op,point_arr)


