%use for plot
function userID=exchange(userID)
nuserID=length(userID);
for i=1:nuserID
   [value,index]=min([userID(i).Influences.cost]);
   if value<userID(i).cost
       bestInfluences=userID(i).Influences(index);
       userID(i).Influences(index).pos=userID(i).pos;
       userID(i).Influences(index).cost=userID(i).cost;
       userID(i).pos=bestInfluences.pos;
       userID(i).cost=bestInfluences.cost; 
   end   
end
