%class SubgraphSolver, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SubgraphSolver(GaussianFactorGraph A, SubgraphSolverParameters parameters)
%SubgraphSolver(GaussianFactorGraph Ab1, GaussianFactorGraph Ab2, SubgraphSolverParameters parameters)
%
%-------Methods-------
%optimize() : returns gtsam::VectorValues
%
classdef SubgraphSolver < handle
  properties
    ptr_gtsamSubgraphSolver = 0
  end
  methods
    function obj = SubgraphSolver(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(791, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'gtsam.SubgraphSolverParameters')
        my_ptr = gtsam_wrapper(792, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'gtsam.GaussianFactorGraph') && isa(varargin{3},'gtsam.SubgraphSolverParameters')
        my_ptr = gtsam_wrapper(793, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.SubgraphSolver constructor');
      end
      obj.ptr_gtsamSubgraphSolver = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(794, obj.ptr_gtsamSubgraphSolver);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = optimize(this, varargin)
      % OPTIMIZE usage: optimize() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % optimize()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(795, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SubgraphSolver.optimize');
      end
    end

  end

  methods(Static = true)
  end
end
