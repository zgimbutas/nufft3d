function [fk,ier]=nufft3d3(nj,xj,yj,zj,cj,iflag,eps,nk,sk,tk,uk)
%NUFFT3D3: Nonuniform FFT in R^3 - Type 3.
%
%  [FK,IER] = NUFFT3D3(NJ,XJ,YJ,ZJ,CJ,IFLAG,NK,SK,TK,UK);
%
%                  nj
%     fk(k)    =  SUM cj(j) exp(+/-i (s(k),t(k),u(k))*(xj(j),yj(j),zj(j)))
%                 j=1
%
%     If (iflag .ge.0) the + sign is used in the exponential.
%     If (iflag .lt.0) the - sign is used in the exponential.
%
%  Input parameters:
%
%     nj     number of sources   (integer)
%     xj,yj,zj  location of sources (real *8)
%
%            on interval [-pi,pi].
%
%     cj     strengths of sources (complex *16)
%     iflag  determines sign of FFT (see above)
%     eps    precision request  (between 1.0e-15 and 1.0e-1)
%     nk     number of (noninteger) Fourier modes computed
%     sk,tk,uk  k-values (locations) of desired Fourier modes
%                 
%  Output parameters:
%
%     fk     Fourier transform values (complex *16)
%     ier    error return code   
%            ier = 0  => normal execution.
%            ier = 1  => precision eps requested is out of range.
%
%

fk=zeros(nk,1)+1i*zeros(nk,1);
ier=0;

mex_id_ = 'nufft3d3f90(i int[x], i double[], i double[], i double[], i dcomplex[], i int[x], i double[x], i int[x], i double[], i double[], i double[], io dcomplex[], io int[x])';
[fk, ier] = nufft3d(mex_id_, nj, xj, yj, zj, cj, iflag, eps, nk, sk, tk, uk, fk, ier, 1, 1, 1, 1, 1);


