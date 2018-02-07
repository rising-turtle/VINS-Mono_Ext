%class ConjugateGradientParameters, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ConjugateGradientParameters()
%
%-------Methods-------
%getEpsilon_abs() : returns double
%getEpsilon_rel() : returns double
%getKernel() : returns string
%getMaxIterations() : returns size_t
%getMinIterations() : returns size_t
%getReset() : returns size_t
%getVerbosity() : returns string
%print() : returns void
%setEpsilon_abs(double value) : returns void
%setEpsilon_rel(double value) : returns void
%setKernel(string s) : returns void
%setMaxIterations(size_t value) : returns void
%setMinIterations(size_t value) : returns void
%setReset(size_t value) : returns void
%setVerbosity(string s) : returns void
%
classdef ConjugateGradientParameters < gtsam.IterativeOptimizationParameters
  properties
    ptr_gtsamConjugateGradientParameters = 0
  end
  methods
    function obj = ConjugateGradientParameters(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(764, varargin{2});
        end
        base_ptr = gtsam_wrapper(763, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(765);
      else
        error('Arguments do not match any overload of gtsam.ConjugateGradientParameters constructor');
      end
      obj = obj@gtsam.IterativeOptimizationParameters(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamConjugateGradientParameters = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(766, obj.ptr_gtsamConjugateGradientParameters);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getEpsilon_abs(this, varargin)
      % GETEPSILON_ABS usage: getEpsilon_abs() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getEpsilon_abs()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(767, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.getEpsilon_abs');
      end
    end

    function varargout = getEpsilon_rel(this, varargin)
      % GETEPSILON_REL usage: getEpsilon_rel() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getEpsilon_rel()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(768, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.getEpsilon_rel');
      end
    end

    function varargout = getKernel(this, varargin)
      % GETKERNEL usage: getKernel() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getKernel()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(769, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.getKernel');
      end
    end

    function varargout = getMaxIterations(this, varargin)
      % GETMAXITERATIONS usage: getMaxIterations() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getMaxIterations()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(770, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.getMaxIterations');
      end
    end

    function varargout = getMinIterations(this, varargin)
      % GETMINITERATIONS usage: getMinIterations() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getMinIterations()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(771, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.getMinIterations');
      end
    end

    function varargout = getReset(this, varargin)
      % GETRESET usage: getReset() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getReset()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(772, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.getReset');
      end
    end

    function varargout = getVerbosity(this, varargin)
      % GETVERBOSITY usage: getVerbosity() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVerbosity()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(773, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.getVerbosity');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print()
      if length(varargin) == 0
        gtsam_wrapper(774, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.print');
      end
    end

    function varargout = setEpsilon_abs(this, varargin)
      % SETEPSILON_ABS usage: setEpsilon_abs(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setEpsilon_abs(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(775, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.setEpsilon_abs');
      end
    end

    function varargout = setEpsilon_rel(this, varargin)
      % SETEPSILON_REL usage: setEpsilon_rel(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setEpsilon_rel(double value)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(776, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.setEpsilon_rel');
      end
    end

    function varargout = setKernel(this, varargin)
      % SETKERNEL usage: setKernel(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setKernel(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(777, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.setKernel');
      end
    end

    function varargout = setMaxIterations(this, varargin)
      % SETMAXITERATIONS usage: setMaxIterations(size_t value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setMaxIterations(size_t value)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(778, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.setMaxIterations');
      end
    end

    function varargout = setMinIterations(this, varargin)
      % SETMINITERATIONS usage: setMinIterations(size_t value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setMinIterations(size_t value)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(779, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.setMinIterations');
      end
    end

    function varargout = setReset(this, varargin)
      % SETRESET usage: setReset(size_t value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setReset(size_t value)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(780, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.setReset');
      end
    end

    function varargout = setVerbosity(this, varargin)
      % SETVERBOSITY usage: setVerbosity(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setVerbosity(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(781, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ConjugateGradientParameters.setVerbosity');
      end
    end

  end

  methods(Static = true)
  end
end
