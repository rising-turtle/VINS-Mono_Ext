%class GaussNewtonParams, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussNewtonParams()
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
classdef GaussNewtonParams < gtsam.SuccessiveLinearizationParams
  properties
    ptr_gtsamGaussNewtonParams = 0
  end
  methods
    function obj = GaussNewtonParams(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1009, varargin{2});
        end
        base_ptr = gtsam_wrapper(1008, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(1010);
      else
        error('Arguments do not match any overload of gtsam.GaussNewtonParams constructor');
      end
      obj = obj@gtsam.SuccessiveLinearizationParams(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamGaussNewtonParams = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1011, obj.ptr_gtsamGaussNewtonParams);
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
        varargout{1} = gtsam_wrapper(1012, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.getAbsoluteErrorTol');
      end
    end

    function varargout = getErrorTol(this, varargin)
      % GETERRORTOL usage: getErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getErrorTol()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1013, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.getErrorTol');
      end
    end

    function varargout = getMaxIterations(this, varargin)
      % GETMAXITERATIONS usage: getMaxIterations() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getMaxIterations()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1014, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.getMaxIterations');
      end
    end

    function varargout = getRelativeErrorTol(this, varargin)
      % GETRELATIVEERRORTOL usage: getRelativeErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getRelativeErrorTol()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1015, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.getRelativeErrorTol');
      end
    end

    function varargout = getVerbosity(this, varargin)
      % GETVERBOSITY usage: getVerbosity() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVerbosity()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1016, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.getVerbosity');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1017, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.print');
      end
    end

    function varargout = setAbsoluteErrorTol(this, varargin)
      % SETABSOLUTEERRORTOL usage: setAbsoluteErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setAbsoluteErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1018, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.setAbsoluteErrorTol');
      end
    end

    function varargout = setErrorTol(this, varargin)
      % SETERRORTOL usage: setErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1019, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.setErrorTol');
      end
    end

    function varargout = setMaxIterations(this, varargin)
      % SETMAXITERATIONS usage: setMaxIterations(size_t value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setMaxIterations(size_t value)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(1020, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.setMaxIterations');
      end
    end

    function varargout = setRelativeErrorTol(this, varargin)
      % SETRELATIVEERRORTOL usage: setRelativeErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setRelativeErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1021, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.setRelativeErrorTol');
      end
    end

    function varargout = setVerbosity(this, varargin)
      % SETVERBOSITY usage: setVerbosity(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setVerbosity(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1022, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonParams.setVerbosity');
      end
    end

  end

  methods(Static = true)
  end
end
