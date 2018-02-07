%class IterativeOptimizationParameters, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%getKernel() : returns string
%getVerbosity() : returns string
%print() : returns void
%setKernel(string s) : returns void
%setVerbosity(string s) : returns void
%
classdef IterativeOptimizationParameters < handle
  properties
    ptr_gtsamIterativeOptimizationParameters = 0
  end
  methods
    function obj = IterativeOptimizationParameters(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(756, varargin{2});
        end
        gtsam_wrapper(755, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.IterativeOptimizationParameters constructor');
      end
      obj.ptr_gtsamIterativeOptimizationParameters = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(757, obj.ptr_gtsamIterativeOptimizationParameters);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getKernel(this, varargin)
      % GETKERNEL usage: getKernel() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getKernel()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(758, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IterativeOptimizationParameters.getKernel');
      end
    end

    function varargout = getVerbosity(this, varargin)
      % GETVERBOSITY usage: getVerbosity() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVerbosity()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(759, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IterativeOptimizationParameters.getVerbosity');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print()
      if length(varargin) == 0
        gtsam_wrapper(760, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IterativeOptimizationParameters.print');
      end
    end

    function varargout = setKernel(this, varargin)
      % SETKERNEL usage: setKernel(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setKernel(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(761, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IterativeOptimizationParameters.setKernel');
      end
    end

    function varargout = setVerbosity(this, varargin)
      % SETVERBOSITY usage: setVerbosity(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setVerbosity(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(762, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IterativeOptimizationParameters.setVerbosity');
      end
    end

  end

  methods(Static = true)
  end
end
