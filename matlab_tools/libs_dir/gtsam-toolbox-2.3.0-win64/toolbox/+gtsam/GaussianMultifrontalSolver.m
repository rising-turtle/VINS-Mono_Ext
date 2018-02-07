%class GaussianMultifrontalSolver, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianMultifrontalSolver(GaussianFactorGraph graph, bool useQR)
%
%-------Methods-------
%eliminate() : returns gtsam::GaussianBayesTree
%marginalCovariance(size_t j) : returns Matrix
%marginalFactor(size_t j) : returns gtsam::GaussianFactor
%optimize() : returns gtsam::VectorValues
%replaceFactors(GaussianFactorGraph factorGraph) : returns void
%
classdef GaussianMultifrontalSolver < handle
  properties
    ptr_gtsamGaussianMultifrontalSolver = 0
  end
  methods
    function obj = GaussianMultifrontalSolver(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(747, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'logical')
        my_ptr = gtsam_wrapper(748, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.GaussianMultifrontalSolver constructor');
      end
      obj.ptr_gtsamGaussianMultifrontalSolver = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(749, obj.ptr_gtsamGaussianMultifrontalSolver);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = eliminate(this, varargin)
      % ELIMINATE usage: eliminate() : returns gtsam::GaussianBayesTree
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminate()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(750, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianMultifrontalSolver.eliminate');
      end
    end

    function varargout = marginalCovariance(this, varargin)
      % MARGINALCOVARIANCE usage: marginalCovariance(size_t j) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalCovariance(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(751, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianMultifrontalSolver.marginalCovariance');
      end
    end

    function varargout = marginalFactor(this, varargin)
      % MARGINALFACTOR usage: marginalFactor(size_t j) : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalFactor(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(752, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianMultifrontalSolver.marginalFactor');
      end
    end

    function varargout = optimize(this, varargin)
      % OPTIMIZE usage: optimize() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % optimize()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(753, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianMultifrontalSolver.optimize');
      end
    end

    function varargout = replaceFactors(this, varargin)
      % REPLACEFACTORS usage: replaceFactors(GaussianFactorGraph factorGraph) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % replaceFactors(GaussianFactorGraph factorGraph)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianFactorGraph')
        gtsam_wrapper(754, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianMultifrontalSolver.replaceFactors');
      end
    end

  end

  methods(Static = true)
  end
end
