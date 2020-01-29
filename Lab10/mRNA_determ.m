function [m, c] = mRNA_determ(kr, gr)
    m=0;
    j=1;
    t=0;
    while t < 300
        a1=kr;
        a2=gr*m(j);
        asum=a1+a2;
        
        j=j+1;

        t(j)=t(j-1)-log(rand(1))/asum;
    
        mu=rand(1);
        if mu < a1/asum
            m(j)=m(j-1)+1;
        else
            m(j)=max(m(j-1)-1,0);
        end
    end
    t_transient = round(0.2 * length(m));
    m = m(t_transient:end);
    means = mean(m);
    sd = std(m);
    c = sd / means;
end