classdef FractalIdeas  
	%% FRACTALIDEAS   

	%  $Revision$ 
 	%  was created $Date$ 
 	%  by $Author$,  
 	%  last modified $LastChangedDate$ 
 	%  and checked into repository $URL$,  
 	%  developed on Matlab 8.3.0.532 (R2014a) 
 	%  $Id$ 
 	 

	properties 
 		 
 	end 

	methods 
        function from2014sep15(~)
            %% FROM2014SEP15 ... 
            %   
            %  Usage:  fractalDiffusion() 
            %          ^ 
            %% Version $Revision$ was created $Date$ by $Author$,  
            %% last modified $LastChangedDate$ and checked into svn repository $URL$ 
            %% Developed on Matlab 8.3.0.532 (R2014a) 
            %% $Id$ 

            dwi = NIfTI.load('dwi_default_meanvol_on_t1_default');
            t2  = NIfTI.load( 't2_default_on_t1_default');
            t2.dipmax
            dwi.dipmax
            dwi.img = dwi.img / dwi.dipmax;
            t2.img = t2.img / t2.dipmax;
            help reshape
            t2line = reshape(t2.img, [prod(t2.size) 1]);
            hist(t2line)
            tmp = t2.img .* (t2.img > .9);
            sum(sum(sum(tmp)))
            tmp = t2.img .* (t2.img == 0);
            sum(sum(sum(tmp)))
            tmp = t2.img .* (t2.img < 0);
            sum(sum(sum(tmp)))
            tmp = -0.09 ./ log(t2.img);
            t2sec = t2;
            t2sec.fileprefix = 't2sec_on_t1_default';
            t2sec.img = tmp;
            t2sec.dip_image
            t2at78msec = t2sec;
            t2at78msec.fileprefix = 't2te78_on_t1_default';
            tmp = exp(-0.078 ./t2sec.img);
            t2te78.img = tmp;
            dip_image(t2te78)
            t2te78.dipmax
            tmp = dwi.img ./ t2te78.img;
            dwi_t2corr = t2te78;
            dwi_t2corr.fileprefix = 'dwi_t2corr_on_t1_default';
            dwi_t2corr.img = tmp;
            dip_image(dwi_t2corr)
            dwi_t2corr.save
            t2sec.filename
            t2sec.save
            t2te78.save
            dwi.dipmax
            dwi_t2corr.img = dwi_t2corr.img ./ dwi_t2corr.dipmax;
            dwi_t2corr.save
            dwi_t2corr.dipmax
            dwi_t2corr.dip_image
            hbdim = dwi;
            hbdim.fileprefix = 'hbdim_on_t2_default'
            hbdim.fileprefix = 'hbdim_on_t1_default'
            hbdim.img = -log(log(dwi_t2corr.img));
            hbdim.dip_image
            hbdim.dipmin
            hbdim.save
            tmp = log(dwi_t2corr.img);
            min(min(min(tmp)))
            max(max(max(tmp)))
            hbdim.img = log(-log(dwi_t2corr.img));
            hbdim.save
            hbdim.dip_image
            dwi.dip_image
        end

  		function this = FractalIdeas(varargin) 
 			%% FRACTALIDEAS 
 			%  Usage:  this = FractalIdeas() 

 			 
 		end 
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

