%class ISAM2GaussNewtonParams, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2GaussNewtonParams()
%
%-------Methods-------
%getWildfireThreshold() : returns double
%print(string str) : returns void
%setWildfireThreshold(double wildfireThreshold) : returns void
%
classdef ISAM2GaussNewtonParams < handle
  properties
    ptr_gtsamISAM2GaussNewtonParams = 0
  end
  methods
    function obj = ISAM2GaussNewtonParams(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1110, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1111);
      else
        error('Arguments do not match any overload of gtsam.ISAM2GaussNewtonParams constructor');
      end
      obj.ptr_gtsamISAM2GaussNewtonParams = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1112, obj.ptr_gtsamISAM2GaussNewtonParams);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getWildfireThreshold(this, varargin)
      % GETWILDFIRETHRESHOLD usage: getWildfireThreshold() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getWildfireThreshold()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1113, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2GaussNewtonParams.getWildfireThreshold');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string str) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string str)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1114, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2GaussNewtonParams.print');
      end
    end

    function varargout = setWildfireThreshold(this, varargin)
      % SETWILDFIRETHRESHOLD usage: setWildfireThreshold(double wildfireThreshold) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setWildfireThreshold(double wildfireThreshold)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1115, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2GaussNewtonParams.setWildfireThreshold');
      end
    end

  end

  methods(Static = true)
  end
end
