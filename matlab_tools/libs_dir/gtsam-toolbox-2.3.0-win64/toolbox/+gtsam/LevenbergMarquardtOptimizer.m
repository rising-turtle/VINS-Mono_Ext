%class LevenbergMarquardtOptimizer, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%LevenbergMarquardtOptimizer(NonlinearFactorGraph graph, Values initialValues)
%LevenbergMarquardtOptimizer(NonlinearFactorGraph graph, Values initialValues, LevenbergMarquardtParams params)
%
%-------Methods-------
%error() : returns double
%iterate() : returns void
%iterations() : returns int
%lambda() : returns double
%optimize() : returns gtsam::Values
%optimizeSafely() : returns gtsam::Values
%print(string str) : returns void
%values() : returns gtsam::Values
%
classdef LevenbergMarquardtOptimizer < gtsam.NonlinearOptimizer
  properties
    ptr_gtsamLevenbergMarquardtOptimizer = 0
  end
  methods
    function obj = LevenbergMarquardtOptimizer(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1098, varargin{2});
        end
        base_ptr = gtsam_wrapper(1097, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1099, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values') && isa(varargin{3},'gtsam.LevenbergMarquardtParams')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1100, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.LevenbergMarquardtOptimizer constructor');
      end
      obj = obj@gtsam.NonlinearOptimizer(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamLevenbergMarquardtOptimizer = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1101, obj.ptr_gtsamLevenbergMarquardtOptimizer);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = error(this, varargin)
      % ERROR usage: error() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1102, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtOptimizer.error');
      end
    end

    function varargout = iterate(this, varargin)
      % ITERATE usage: iterate() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % iterate()
      if length(varargin) == 0
        gtsam_wrapper(1103, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtOptimizer.iterate');
      end
    end

    function varargout = iterations(this, varargin)
      % ITERATIONS usage: iterations() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % iterations()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1104, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtOptimizer.iterations');
      end
    end

    function varargout = lambda(this, varargin)
      % LAMBDA usage: lambda() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % lambda()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1105, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtOptimizer.lambda');
      end
    end

    function varargout = optimize(this, varargin)
      % OPTIMIZE usage: optimize() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % optimize()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1106, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtOptimizer.optimize');
      end
    end

    function varargout = optimizeSafely(this, varargin)
      % OPTIMIZESAFELY usage: optimizeSafely() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % optimizeSafely()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1107, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtOptimizer.optimizeSafely');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string str) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string str)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1108, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtOptimizer.print');
      end
    end

    function varargout = values(this, varargin)
      % VALUES usage: values() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % values()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1109, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LevenbergMarquardtOptimizer.values');
      end
    end

  end

  methods(Static = true)
  end
end
