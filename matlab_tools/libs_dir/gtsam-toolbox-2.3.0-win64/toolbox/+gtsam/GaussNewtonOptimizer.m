%class GaussNewtonOptimizer, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussNewtonOptimizer(NonlinearFactorGraph graph, Values initialValues)
%GaussNewtonOptimizer(NonlinearFactorGraph graph, Values initialValues, GaussNewtonParams params)
%
%-------Methods-------
%error() : returns double
%iterate() : returns void
%iterations() : returns int
%optimize() : returns gtsam::Values
%optimizeSafely() : returns gtsam::Values
%values() : returns gtsam::Values
%
classdef GaussNewtonOptimizer < gtsam.NonlinearOptimizer
  properties
    ptr_gtsamGaussNewtonOptimizer = 0
  end
  methods
    function obj = GaussNewtonOptimizer(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1075, varargin{2});
        end
        base_ptr = gtsam_wrapper(1074, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1076, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values') && isa(varargin{3},'gtsam.GaussNewtonParams')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1077, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.GaussNewtonOptimizer constructor');
      end
      obj = obj@gtsam.NonlinearOptimizer(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamGaussNewtonOptimizer = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1078, obj.ptr_gtsamGaussNewtonOptimizer);
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
        varargout{1} = gtsam_wrapper(1079, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonOptimizer.error');
      end
    end

    function varargout = iterate(this, varargin)
      % ITERATE usage: iterate() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % iterate()
      if length(varargin) == 0
        gtsam_wrapper(1080, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonOptimizer.iterate');
      end
    end

    function varargout = iterations(this, varargin)
      % ITERATIONS usage: iterations() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % iterations()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1081, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonOptimizer.iterations');
      end
    end

    function varargout = optimize(this, varargin)
      % OPTIMIZE usage: optimize() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % optimize()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1082, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonOptimizer.optimize');
      end
    end

    function varargout = optimizeSafely(this, varargin)
      % OPTIMIZESAFELY usage: optimizeSafely() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % optimizeSafely()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1083, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonOptimizer.optimizeSafely');
      end
    end

    function varargout = values(this, varargin)
      % VALUES usage: values() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % values()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1084, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussNewtonOptimizer.values');
      end
    end

  end

  methods(Static = true)
  end
end
