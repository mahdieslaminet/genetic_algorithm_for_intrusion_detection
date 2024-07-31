function ObjVal = rosenbrock(Chrom,switc);
    Dim=size(Chrom,2);
    [Nind,Nvar] = size(Chrom);
      Mat1 = Chrom(:,1:Nvar-1);
      Mat2 = Chrom(:,2:Nvar);
      if Dim == 2
         ObjVal = 100*(Mat2-Mat1.^2).^2+(1-Mat1).^2;
      else
         ObjVal = sum((100*(Mat2-Mat1.^2).^2+(1-Mat1).^2)')';
      end   
