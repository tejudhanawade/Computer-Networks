#include <stdlib.h>
#include <stdio.h>
typedef struct co_ordinates
{
  int *data;
}*co_or;
co_or init_co_ordinate()
{
  co_or xy = (co_or)malloc(sizeof(struct co_ordinates));
  if (xy == NULL)
    return NULL;
  xy->data= malloc(sizeof(int)*2);
  return xy;
}
int generate_number( )
{
  int i=0,j=0;
  char tmp[12]={0x0};
  for(i=0;i<10;i++)
  {
    int v=drand48() * 10;
    int n=drand48() * 10;
    //sprintf(tmp,"%.0f",v);
    //j=atoi(v);
    printf("%d\t",v);
    printf("%d\n",n);
  }

}
int main()
{
  int l;
 // scanf("%d",&l);
  generate_number();
  return 0;
}
