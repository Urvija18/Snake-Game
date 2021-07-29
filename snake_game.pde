ArrayList<Integer> x= new ArrayList<Integer>();    //My Snake game
ArrayList<Integer> y= new ArrayList<Integer>();    //My Snake game
int hgt=24,wdt=24,block=20;    //height and width of gaming window; block as size of snake
int dir=2;            //2-right direction 
int xdir[]={0,0,1,-1};    //direction arrays declared for directing snake
int ydir[]={1,-1,0,0};
int xfood=15,yfood=15;     //position for snake's food
int speed=10;
boolean gs=false;     //game statement
void setup()        //sets the size for background and decides the initial position of snake
{
  size(500,500);
  x.add(4);
  y.add(10);
}
void draw()          //movement  and elongation of snake 
{
  background(201,192,187);   //gives bg color to gaming window
  fill(2,48,32);             //gives color to snake
  for(int i=0;i<x.size();i++)        //defining size of snake
  rect(x.get(i)*block,y.get(i)*block,block,block);
  textAlign(LEFT);
  textSize(25);
  fill(0);
  text("Score:"+ x.size(),0,20);       //printing score on the top left corner of window
  if(x.size()%2==0 && speed>=2)
  speed=speed-1;
  if(x.get(0)<0 || y.get(0)<0 || x.get(0)>wdt || y.get(0)>hgt)    //condition for snake to die when goes out of window
  gs=true;
  for(int j=1;j<x.size();j++)
  { if(x.get(0)==x.get(j) && y.get(0)==y.get(j))     //condition for snake to die when it meets with itself
  gs=true;}
if(!gs)         //while game status is active
{
fill(0);       //create food and fill color into it
 rect(xfood*block,yfood*block,block,block);        //defining size of food
if(frameCount%8==0)
{
  x.add(0, x.get(0)+xdir[dir]);            //making snake to move by enlarging
  y.add(0, y.get(0)+ydir[dir]);

if(x.get(0)==xfood && y.get(0)==yfood)     //condition to check if snake reached it's food
{
  xfood=(int)random(0,wdt);        //creating new food for snake
  yfood=(int)random(0,hgt);
}
else
{
 x.remove(x.size()-1);             //removing the extra part while snake is moving
  y.remove( y.size()-1);
}}}
else                //for the condition to be failed or dying of snake
{
fill(129,19,49);      //message displayed game over alongwith the score
textAlign(CENTER);
textSize(30);
text("GAME OVER \n Your Total Score:"+x.size() + "\n Press ENTER to start again",500/2,500/2);
if(keyCode==ENTER)
{                          //starting of new game with intials
x.clear();
y.clear();
x.add(4);
y.add(15);
dir=2;
speed=10;
gs=false;}}}
void keyPressed()      //performs the actions according to the keys pressed
{
  int newdir=keyCode;
  if(keyCode==DOWN)
  newdir=0;
  else if(keyCode==UP)
  newdir=1;
  else if(keyCode==LEFT)
  newdir=3;
  else if(keyCode==RIGHT)
  newdir=2;
  else
  newdir=-1;
  if(newdir!=-1)
  dir=newdir;
}
