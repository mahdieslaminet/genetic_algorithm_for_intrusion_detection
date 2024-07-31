function ObjVal = schwefel(Chrom,switch1);   
    Dim=size(Chrom,2);
    [Nind,Nvar] = size(Chrom);
      ObjVal = sum((-Chrom .* sin(sqrt(abs(Chrom))))')';
