%class NonlinearOptimizer, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%error() : returns double
%iterate() : returns void
%iterations() : returns int
%optimize() : returns gtsam::Values
%optimizeSafely() : returns gtsam::Values
%values() : returns gtsam::Values
%
classdef NonlinearOptimizer < handle
  properties
    ptr_gtsamNonlinearOptimizer = 0
  end
  methods
    function obj = NonlinearOptimizer(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1066, varargin{2});
        end
        gtsam_wrapper(1065, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.NonlinearOptimizer constructor');
      end
      obj.ptr_gtsamNonlinearOptimizer = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1067, obj.ptr_gtsamNonlinearOptimizer);
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
        varargout{1} = gtsam_wrapper(1068, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizer.error');
      end
    end

    function varargout = iterate(this, varargin)
      % ITERATE usage: iterate() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % iterate()
      if length(varargin) == 0
        gtsam_wrapper(1069, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizer.iterate');
      end
    end

    function varargout = iterations(this, varargin)
      % ITERATIONS usage: iterations() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % iterations()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1070, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizer.iterations');
      end
    end

    function varargout = optimize(this, varargin)
      % OPTIMIZE usage: optimize() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % optimize()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1071, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizer.optimize');
      end
    end

    function varargout = optimizeSafely(this, varargin)
      % OPTIMIZESAFELY usage: optimizeSafely() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % optimizeSafely()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1072, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizer.optimizeSafely');
      end
    end

    function varargout = values(this, varargin)
      % VALUES usage: values() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % values()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1073, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearOptimizer.values');
      end
    end

  end

  methods(Static = true)
  end
end
