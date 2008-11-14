function onera_desp_lib_load(libfile,headerfile)
%***************************************************************************************************
% Copyright 2006, T.P. O'Brien
%
% This file is part of IRBEM-LIB.
%
%    IRBEM-LIB is free software: you can redistribute it and/or modify
%    it under the terms of the GNU Lesser General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    IRBEM-LIB is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU Lesser General Public License for more details.
%
%    You should have received a copy of the GNU Lesser General Public License
%    along with IRBEM-LIB.  If not, see <http://www.gnu.org/licenses/>.
%
%***************************************************************************************************
%
%function onera_desp_lib_load(libfile,@prototypefunction);
%function onera_desp_lib_load(libfile,headerfile);
% checks for the presence of the onera_desp_lib dynamic library in memory
% if not present, attempts to load it using either a prototype function
% or a headerfile
if ~libisloaded('onera_desp_lib'),
    if nargin < 2,
        if exist('onera_desp_lib_proto.m','file'),
            headerfile = @onera_desp_lib_proto; % use prototype file
        else
            headerfile = 'onera_desp_lib'; % use headerfile
        end
    end
    if nargin < 1,
        libfile = 'onera_desp_lib';
    end
    loadlibrary(libfile,headerfile,'alias','onera_desp_lib');
end
% loadlibrary('onera_desp_lib.dll','onera_desp_lib.h','alias','onera_desp_lib','mfilename','onera_desp_lib_proto.m'); disp('remember to move the proto file');
