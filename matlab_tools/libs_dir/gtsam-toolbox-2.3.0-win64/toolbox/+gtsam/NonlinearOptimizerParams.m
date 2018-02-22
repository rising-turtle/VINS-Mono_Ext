%class NonlinearOptimizerParams, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%NonlinearOptimizerParams()
%
%-------Methods-------
%getAbsoluteErrorTol() : returns double
%getErrorTol() : returns double
%getMaxIterations() : returns size_t
%getRelativeErrorTol() : returns double
%getVerbosity() : returns string
%print(string s) : returns void
%setAbsoluteErrorTol(double value) : returns void
%setErrorTol(double value) : returns void
%setMaxIterations(size_t value) : returns void
%setRelativeErrorTol(double value) : returns void
%setVerbosity(string s) : returns void
%
classdef NonlinearOptimizerParams < handle
  properties
    ptr_gtsamNonlinearOptimizerParams = 0
  end
  methods
    function obj = NonlinearOptimizerParams(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(971, varargin{2});
        end
        gtsam_wrapper(970, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(972);
      else
        error('Arguments do not match any overload of gtsam.NonlinearOptimizerParams constructor');
      end
      obj.ptr_gtsamNonlinearOptimizerParams = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(973, obj.ptr_gtsamNonlinearOptimizerParams);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getAbsoluteErrorTol(this, varargin)
      % GETABSOLUTEERRORTOL usage: getAbsoluteErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getAbsoluteErrorTol()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(974, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.getAbsoluteErrorTol');
      end
    end

    function varargout = getErrorTol(this, varargin)
      % GETERRORTOL usage: getErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getErrorTol()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(975, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.getErrorTol');
      end
    end

    function varargout = getMaxIterations(this, varargin)
      % GETMAXITERATIONS usage: getMaxIterations() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getMaxIterations()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(976, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.getMaxIterations');
      end
    end

    function varargout = getRelativeErrorTol(this, varargin)
      % GETRELATIVEERRORTOL usage: getRelativeErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getRelativeErrorTol()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(977, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.getRelativeErrorTol');
      end
    end

    function varargout = getVerbosity(this, varargin)
      % GETVERBOSITY usage: getVerbosity() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVerbosity()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(978, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.getVerbosity');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(979, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.print');
      end
    end

    function varargout = setAbsoluteErrorTol(this, varargin)
      % SETABSOLUTEERRORTOL usage: setAbsoluteErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setAbsoluteErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(980, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.setAbsoluteErrorTol');
      end
    end

    function varargout = setErrorTol(this, varargin)
      % SETERRORTOL usage: setErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(981, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.setErrorTol');
      end
    end

    function varargout = setMaxIterations(this, varargin)
      % SETMAXITERATIONS usage: setMaxIterations(size_t value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setMaxIterations(size_t value)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(982, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.setMaxIterations');
      end
    end

    function varargout = setRelativeErrorTol(this, varargin)
      % SETRELATIVEERRORTOL usage: setRelativeErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setRelativeErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(983, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.setRelativeErrorTol');
      end
    end

    function varargout = setVerbosity(this, varargin)
      % SETVERBOSITY usage: setVerbosity(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setVerbosity(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(984, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizerParams.setVerbosity');
      end
    end

  end

  methods(Static = true)
  end
end
