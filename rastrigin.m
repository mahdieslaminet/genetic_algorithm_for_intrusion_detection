function ObjVal = rastrigin(Chrom,switch1);
     Dim=size(Chrom,2);
    [Nind,Nvar] = size(Chrom);   
      A = 10;
      Omega = 2 * pi;
      ObjVal = Dim * A + sum(((Chrom .* Chrom) - A * cos(Omega * Chrom))')';
      
