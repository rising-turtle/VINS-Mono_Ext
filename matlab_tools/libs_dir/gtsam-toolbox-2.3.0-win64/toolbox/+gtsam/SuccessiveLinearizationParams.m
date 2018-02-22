%class SuccessiveLinearizationParams, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SuccessiveLinearizationParams()
%
%-------Methods-------
%getAbsoluteErrorTol() : returns double
%getErrorTol() : returns double
%getLinearSolverType() : returns string
%getMaxIterations() : returns size_t
%getRelativeErrorTol() : returns double
%getVerbosity() : returns string
%isCG() : returns bool
%isCholmod() : returns bool
%isMultifrontal() : returns bool
%isSequential() : returns bool
%print(string s) : returns void
%setAbsoluteErrorTol(double value) : returns void
%setErrorTol(double value) : returns void
%setIterativeParams(SubgraphSolverParameters params) : returns void
%setLinearSolverType(string solver) : returns void
%setMaxIterations(size_t value) : returns void
%setOrdering(Ordering ordering) : returns void
%setRelativeErrorTol(double value) : returns void
%setVerbosity(string s) : returns void
%
classdef SuccessiveLinearizationParams < gtsam.NonlinearOptimizerParams
  properties
    ptr_gtsamSuccessiveLinearizationParams = 0
  end
  methods
    function obj = SuccessiveLinearizationParams(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(986, varargin{2});
        end
        base_ptr = gtsam_wrapper(985, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(987);
      else
        error('Arguments do not match any overload of gtsam.SuccessiveLinearizationParams constructor');
      end
      obj = obj@gtsam.NonlinearOptimizerParams(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamSuccessiveLinearizationParams = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(988, obj.ptr_gtsamSuccessiveLinearizationParams);
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
        varargout{1} = gtsam_wrapper(989, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.getAbsoluteErrorTol');
      end
    end

    function varargout = getErrorTol(this, varargin)
      % GETERRORTOL usage: getErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getErrorTol()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(990, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.getErrorTol');
      end
    end

    function varargout = getLinearSolverType(this, varargin)
      % GETLINEARSOLVERTYPE usage: getLinearSolverType() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getLinearSolverType()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(991, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.getLinearSolverType');
      end
    end

    function varargout = getMaxIterations(this, varargin)
      % GETMAXITERATIONS usage: getMaxIterations() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getMaxIterations()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(992, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.getMaxIterations');
      end
    end

    function varargout = getRelativeErrorTol(this, varargin)
      % GETRELATIVEERRORTOL usage: getRelativeErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getRelativeErrorTol()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(993, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.getRelativeErrorTol');
      end
    end

    function varargout = getVerbosity(this, varargin)
      % GETVERBOSITY usage: getVerbosity() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVerbosity()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(994, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.getVerbosity');
      end
    end

    function varargout = isCG(this, varargin)
      % ISCG usage: isCG() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isCG()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(995, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.isCG');
      end
    end

    function varargout = isCholmod(this, varargin)
      % ISCHOLMOD usage: isCholmod() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isCholmod()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(996, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.isCholmod');
      end
    end

    function varargout = isMultifrontal(this, varargin)
      % ISMULTIFRONTAL usage: isMultifrontal() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isMultifrontal()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(997, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.isMultifrontal');
      end
    end

    function varargout = isSequential(this, varargin)
      % ISSEQUENTIAL usage: isSequential() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isSequential()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(998, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.isSequential');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(999, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.print');
      end
    end

    function varargout = setAbsoluteErrorTol(this, varargin)
      % SETABSOLUTEERRORTOL usage: setAbsoluteErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setAbsoluteErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1000, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.setAbsoluteErrorTol');
      end
    end

    function varargout = setErrorTol(this, varargin)
      % SETERRORTOL usage: setErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1001, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.setErrorTol');
      end
    end

    function varargout = setIterativeParams(this, varargin)
      % SETITERATIVEPARAMS usage: setIterativeParams(SubgraphSolverParameters params) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setIterativeParams(SubgraphSolverParameters params)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.SubgraphSolverParameters')
        gtsam_wrapper(1002, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.setIterativeParams');
      end
    end

    function varargout = setLinearSolverType(this, varargin)
      % SETLINEARSOLVERTYPE usage: setLinearSolverType(string solver) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setLinearSolverType(string solver)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1003, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.setLinearSolverType');
      end
    end

    function varargout = setMaxIterations(this, varargin)
      % SETMAXITERATIONS usage: setMaxIterations(size_t value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setMaxIterations(size_t value)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(1004, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.setMaxIterations');
      end
    end

    function varargout = setOrdering(this, varargin)
      % SETORDERING usage: setOrdering(Ordering ordering) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setOrdering(Ordering ordering)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        gtsam_wrapper(1005, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.setOrdering');
      end
    end

    function varargout = setRelativeErrorTol(this, varargin)
      % SETRELATIVEERRORTOL usage: setRelativeErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setRelativeErrorTol(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1006, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.setRelativeErrorTol');
      end
    end

    function varargout = setVerbosity(this, varargin)
      % SETVERBOSITY usage: setVerbosity(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setVerbosity(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1007, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SuccessiveLinearizationParams.setVerbosity');
      end
    end

  end

  methods(Static = true)
  end
end
