%class LevenbergMarquardtParams, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%LevenbergMarquardtParams()
%
%-------Methods-------
%getAbsoluteErrorTol() : returns double
%getErrorTol() : returns double
%getMaxIterations() : returns size_t
%getRelativeErrorTol() : returns double
%getVerbosity() : returns string
%getVerbosityLM() : returns string
%getlambdaFactor() : returns double
%getlambdaInitial() : returns double
%getlambdaUpperBound() : returns double
%print(string s) : returns void
%setAbsoluteErrorTol(double value) : returns void
%setErrorTol(double value) : returns void
%setMaxIterations(size_t value) : returns void
%setRelativeErrorTol(double value) : returns void
%setVerbosity(string s) : returns void
%setVerbosityLM(string s) : returns void
%setlambdaFactor(double value) : returns void
%setlambdaInitial(double value) : returns void
%setlambdaUpperBound(double value) : returns void
%
classdef LevenbergMarquardtParams < gtsam.SuccessiveLinearizationParams
  properties
    ptr_gtsamLevenbergMarquardtParams = 0
  end
  methods
    function obj = LevenbergMarquardtParams(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1024, varargin{2});
        end
        base_ptr = gtsam_wrapper(1023, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(1025);
      else
        error('Arguments do not match any overload of gtsam.LevenbergMarquardtParams constructor');
      end
      obj = obj@gtsam.SuccessiveLinearizationParams(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamLevenbergMarquardtParams = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1026, obj.ptr_gtsamLevenbergMarquardtParams);
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
        varargout{1} = gtsam_wrapper(1027, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.getAbsoluteErrorTol');
      end
    end

    function varargout = getErrorTol(this, varargin)
      % GETERRORTOL usage: getErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getErrorTol()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1028, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.getErrorTol');
      end
    end

    function varargout = getMaxIterations(this, varargin)
      % GETMAXITERATIONS usage: getMaxIterations() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getMaxIterations()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1029, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.getMaxIterations');
      end
    end

    function varargout = getRelativeErrorTol(this, varargin)
      % GETRELATIVEERRORTOL usage: getRelativeErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getRelativeErrorTol()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1030, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.getRelativeErrorTol');
      end
    end

    function varargout = getVerbosity(this, varargin)
      % GETVERBOSITY usage: getVerbosity() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVerbosity()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1031, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.getVerbosity');
      end
    end

    function varargout = getVerbosityLM(this, varargin)
      % GETVERBOSITYLM usage: getVerbosityLM() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVerbosityLM()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1032, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.getVerbosityLM');
      end
    end

    function varargout = getlambdaFactor(this, varargin)
      % GETLAMBDAFACTOR usage: getlambdaFactor() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getlambdaFactor()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1033, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.getlambdaFactor');
      end
    end

    function varargout = getlambdaInitial(this, varargin)
      % GETLAMBDAINITIAL usage: getlambdaInitial() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getlambdaInitial()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1034, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.getlambdaInitial');
      end
    end

    function varargout = getlambdaUpperBound(this, varargin)
      % GETLAMBDAUPPERBOUND usage: getlambdaUpperBound() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getlambdaUpperBound()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1035, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.getlambdaUpperBound');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1036, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.print');
      end
    end

    function varargout = setAbsoluteErrorTol(this, varargin)
      % SETABSOLUTEERRORTOL usage: setAbsoluteErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setAbsoluteErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1037, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.setAbsoluteErrorTol');
      end
    end

    function varargout = setErrorTol(this, varargin)
      % SETERRORTOL usage: setErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1038, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.setErrorTol');
      end
    end

    function varargout = setMaxIterations(this, varargin)
      % SETMAXITERATIONS usage: setMaxIterations(size_t value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setMaxIterations(size_t value)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(1039, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.setMaxIterations');
      end
    end

    function varargout = setRelativeErrorTol(this, varargin)
      % SETRELATIVEERRORTOL usage: setRelativeErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setRelativeErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1040, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.setRelativeErrorTol');
      end
    end

    function varargout = setVerbosity(this, varargin)
      % SETVERBOSITY usage: setVerbosity(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setVerbosity(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1041, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.setVerbosity');
      end
    end

    function varargout = setVerbosityLM(this, varargin)
      % SETVERBOSITYLM usage: setVerbosityLM(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setVerbosityLM(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1042, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.setVerbosityLM');
      end
    end

    function varargout = setlambdaFactor(this, varargin)
      % SETLAMBDAFACTOR usage: setlambdaFactor(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setlambdaFactor(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1043, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.setlambdaFactor');
      end
    end

    function varargout = setlambdaInitial(this, varargin)
      % SETLAMBDAINITIAL usage: setlambdaInitial(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setlambdaInitial(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1044, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.setlambdaInitial');
      end
    end

    function varargout = setlambdaUpperBound(this, varargin)
      % SETLAMBDAUPPERBOUND usage: setlambdaUpperBound(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setlambdaUpperBound(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1045, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtParams.setlambdaUpperBound');
      end
    end

  end

  methods(Static = true)
  end
end
