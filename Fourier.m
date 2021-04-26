function xa = Fourier(Cm, w0, t, tetam, m_max)

mt=0:m_max;
for k=1:length(mt)
    xa=zeros(size(t));
    for m=0:mt(k)
        xa=xa+Cm(m+1)*cos(m*w0*t+tetam(m+1));
    end
end