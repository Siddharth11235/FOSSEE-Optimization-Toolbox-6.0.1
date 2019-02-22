// Copyright (C) 2016 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Author: Pranav Deshpande and Akshay Miterani
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in

function [xopt,fopt,status,output] = cbcmpsintlinprog(varargin)
    // Sci File Wrapper for the mps_cbcintlinprog.cpp file
    
    // Number of input and output arguments
    [nOutput, nInput] = argn();
    
    // To check the number of arguments given by the user
    if (nInput<1 | nInput>2) then
        error(999, 'Check the number of input arguments!');
    end
    
    mpsFile = varargin(1);
    optval = [0,0,0,0];
    if(nInput==2) then
        options=varargin(2);
        if length(options) == 0 then
            optval = [0 0 0 0];
        else
            optval = [0 0 0 0];
            for i=1:2:length(options)
                select options(i)
                    case 'IntegerTolerance' then
                        optval(1) = options(i+1);
                    case 'MaxNodes' then
                        optval(2) = options(i+1);
                    case 'MaxTime' then
                        optval(3) = options(i+1);
                    case 'AllowableGap' then
                        optval(4) = options(i+1);
                    else
                        error(999, 'Unknown string argument passed.');
                    end
            end
        end
    end

    [xopt,fopt,status,nodes,nfpoints,L,U,niter] = mpsintlinprog(mpsFile, optval)

    output = struct("relativegap"       , [],..
                    "absolutegap"       , [],..
                    "numnodes"          , [],..
                    "numfeaspoints"     , [],..
                    "numiterations"		, [],..
                    "message"           , '');
                    
    output.numnodes = [nodes];
    output.numfeaspoints = [nfpoints];
    output.numiterations = [niter];
    output.relativegap = (U-L)/(abs(U)+1);
    output.absolutegap = (U-L);
    
    select status

    case 0 then
        output.message="Optimal Solution"
    case 1 then 
        output.message="Primal Infeasible"
    case 2 then 
        output.message="Solution Limit is reached"
    case 3 then
        output.message="Node Limit is reached"
    case 4 then 
        output.message="Numerical Difficulties"
    case 5 then 
        output.message="Time Limit Reached"
    case 6 then 
        output.message="Continuous Solution Unbounded"
    case 7 then 
        output.message="Dual Infeasible"
    else
        output.message="Invalid status returned. Notify the Toolbox authors"
        break;
    end

endfunction
