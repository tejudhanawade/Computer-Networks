#include<stdio.h>
#include<stdlib.h>
//#include"generate_rand_no.h"

typedef struct point
{
  int x;
  int y;
}*point;

point generate_rand_no(int len)
{
 point arr;
 int i,l;
 l=len*len;
 arr = malloc(sizeof(struct point)*l);
 for(i=0;i<l;i++)
 {
   arr[i].x = drand48()*5;
   arr[i].y = drand48()*5;
   printf("(x= %d,y=%d)", arr[i].x,arr[i].y);
 }
  return arr; 
  printf("\n");
}

point find_midPoint(point p1,point p2)
{
  point mid=malloc(sizeof(point));

  mid->x = ( p1->x +p2->x)/2;
  mid->y = ( p1->y +p2->y)/2;
  //printf("%d\t%d\n",mid->x,mid->y);
  return mid;
}
float slope_point(point p1, point p2)
{
  float slope;
  slope = ((p2->y- p1->y)/(p2->x-p1->x));
  slope = -1/(slope);
  return slope;
}
int value_of_c(point p1,float slope)
{
  int c;
   c = p1->y - (p1->x* slope);
   return c;
}
int  equn_of_per_bisector(point p1,point p2)
{
  float slope,c;
  int slo_p1,slo_p2,len,i,gen,p1_cnt,p2_cnt;
  point mid,arr,p1_lst,p2_lst,temp;
  len = 5;
  arr = generate_rand_no(len);
  p1_lst= malloc(sizeof(point)*20);
  p2_lst= malloc(sizeof(point)*20);
  //printf(" slope %.2f\n",slope);
  mid= find_midPoint(p1,p2);
  //printf(" slope %f \n",c);
  slo_p1 =  c- p1->y + (p1->x* slope);
 // printf(" slope %d \n",slo_p1);
  slo_p2 =  c- p2->y + (p2->x* slope);
  if(slo_p1>0)
  {
    temp = p1;
    p1=p2;
    p2=temp;
  }
 // printf(" slope %d \n",slo_p2);
  p1_cnt=p2_cnt=0;
  for(i=0;i<len*len;i++)
  {
    gen =  c- arr[i].y + (arr[i].x* slope);
    if(gen< 0)
    {
      p1_lst[p1_cnt].x = arr[i].x;
      p1_lst[p1_cnt].y = arr[i].y;
      p1_cnt=p1_cnt+1;
    }
    if(gen>0)
    {
      p2_lst[p2_cnt].x = arr[i].x;
      p2_lst[p2_cnt].y = arr[i].y;
      p2_cnt=p2_cnt+1;
    }
  }
  printf("\nP1 list is : \n");
  for(i=0;i <= p1_cnt;i++)
  {
   printf("(x= %d,y=%d)",p1_lst [i].x,p1_lst[i].y);
  }
  printf("\nP2 list is : \n");
  for(i=0;i <= p2_cnt;i++)
  {
   printf("(x= %d,y=%d)",p2_lst [i].x,p2_lst[i].y);
  }
  printf("\n");
}
int main()
{
  point arr;
  point p1,p2;
  p1  = malloc(sizeof(struct point));
  p2  = malloc(sizeof(struct point));
 // arr = malloc(sizeof(struct point));
  p1->x  = 1;
  p2->x = 1;
  p1->y = 2;
  p2->y = 1;
 // generate_rand_no(5);
  find_midPoint(p1,p2);
  equn_of_per_bisector(p1,p2);
}
