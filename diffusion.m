 function Influences=diffusion(Influences)
    if rand > .11 
        return
    end
    if numel(Influences)<=1
        return;
    end

    TotalCosts = [Influences.TotalCost];
    [MaxTotalCost WeakestInfluencesInd] = max(TotalCosts);
    TotalPowers = MaxTotalCost - TotalCosts;
    PossessionProbability = TotalPowers / sum(TotalPowers);
    
    SelectedInfluencesInd = SelectAnInfluences(PossessionProbability);
    
    nn = numel(Influences(WeakestInfluencesInd).FolloweresCost);
    jj = myrandint(nn,1,1);
    
    Influences(SelectedInfluencesInd).FolloweresPosition = [Influences(SelectedInfluencesInd).FolloweresPosition
                                                   Influences(WeakestInfluencesInd).FolloweresPosition(jj,:)];
                                               
    Influences(SelectedInfluencesInd).FolloweresCost = [Influences(SelectedInfluencesInd).FolloweresCost
                                               Influences(WeakestInfluencesInd).FolloweresCost(jj)];

    Influences(WeakestInfluencesInd).FolloweresPosition = Influences(WeakestInfluencesInd).FolloweresPosition([1:jj-1 jj+1:end],:);
    Influences(WeakestInfluencesInd).FolloweresCost = Influences(WeakestInfluencesInd).FolloweresCost([1:jj-1 jj+1:end],:);
            
  
    nn = numel(Influences(WeakestInfluencesInd).FolloweresCost);
    if nn<=1
        Influences(SelectedInfluencesInd).FolloweresPosition = [Influences(SelectedInfluencesInd).FolloweresPosition
                                                       Influences(WeakestInfluencesInd).ImperialistPosition];

        Influences(SelectedInfluencesInd).FolloweresCost = [Influences(SelectedInfluencesInd).FolloweresCost
                                                   Influences(WeakestInfluencesInd).ImperialistCost];
                                               
        Influences=Influences([1:WeakestInfluencesInd-1 WeakestInfluencesInd+1:end]);
    end

end

function Index = SelectAnInfluences(Probability)
    R = rand(size(Probability));
    D = Probability - R;
    [MaxD Index] = max(D);
end
