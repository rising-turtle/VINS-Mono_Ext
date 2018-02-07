%class SymbolicSequentialSolver, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicSequentialSolver(SymbolicFactorGraph factorGraph)
%SymbolicSequentialSolver(SymbolicFactorGraph factorGraph, VariableIndex variableIndex)
%
%-------Methods-------
%eliminate() : returns gtsam::SymbolicBayesNet
%equals(SymbolicSequentialSolver rhs, double tol) : returns bool
%marginalFactor(size_t j) : returns gtsam::IndexFactor
%print(string s) : returns void
%
classdef SymbolicSequentialSolver < handle
  properties
    ptr_gtsamSymbolicSequentialSolver = 0
  end
  methods
    function obj = SymbolicSequentialSolver(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(452, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicFactorGraph')
        my_ptr = gtsam_wrapper(453, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'gtsam.SymbolicFactorGraph') && isa(varargin{2},'gtsam.VariableIndex')
        my_ptr = gtsam_wrapper(454, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.SymbolicSequentialSolver constructor');
      end
      obj.ptr_gtsamSymbolicSequentialSolver = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(455, obj.ptr_gtsamSymbolicSequentialSolver);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = eliminate(this, varargin)
      % ELIMINATE usage: eliminate() : returns gtsam::SymbolicBayesNet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminate()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(456, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicSequentialSolver.eliminate');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SymbolicSequentialSolver rhs, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(SymbolicSequentialSolver rhs, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SymbolicSequentialSolver') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(457, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicSequentialSolver.equals');
      end
    end

    function varargout = marginalFactor(this, varargin)
      % MARGINALFACTOR usage: marginalFactor(size_t j) : returns gtsam::IndexFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalFactor(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(458, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicSequentialSolver.marginalFactor');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(459, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicSequentialSolver.print');
      end
    end

  end

  methods(Static = true)
  end
end
