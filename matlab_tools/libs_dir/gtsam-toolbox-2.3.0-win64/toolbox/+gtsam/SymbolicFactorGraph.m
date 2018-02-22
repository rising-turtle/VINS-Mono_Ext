%class SymbolicFactorGraph, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicFactorGraph()
%SymbolicFactorGraph(SymbolicBayesNet bayesNet)
%SymbolicFactorGraph(SymbolicBayesTree bayesTree)
%
%-------Methods-------
%eliminateFrontals(size_t nFrontals) : returns pair< SharedIndexConditional, gtsam::SymbolicFactorGraph >
%eliminateOne(size_t j) : returns pair< SharedIndexConditional, gtsam::SymbolicFactorGraph >
%equals(SymbolicFactorGraph rhs, double tol) : returns bool
%print(string s) : returns void
%push_back(IndexFactor factor) : returns void
%push_factor(size_t key) : returns void
%push_factor(size_t key1, size_t key2) : returns void
%push_factor(size_t key1, size_t key2, size_t key3) : returns void
%push_factor(size_t key1, size_t key2, size_t key3, size_t key4) : returns void
%size() : returns size_t
%
classdef SymbolicFactorGraph < handle
  properties
    ptr_gtsamSymbolicFactorGraph = 0
  end
  methods
    function obj = SymbolicFactorGraph(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(437, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(438);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicBayesNet')
        my_ptr = gtsam_wrapper(439, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicBayesTree')
        my_ptr = gtsam_wrapper(440, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.SymbolicFactorGraph constructor');
      end
      obj.ptr_gtsamSymbolicFactorGraph = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(441, obj.ptr_gtsamSymbolicFactorGraph);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = eliminateFrontals(this, varargin)
      % ELIMINATEFRONTALS usage: eliminateFrontals(size_t nFrontals) : returns pair< SharedIndexConditional, gtsam::SymbolicFactorGraph >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminateFrontals(size_t nFrontals)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(442, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.eliminateFrontals');
      end
    end

    function varargout = eliminateOne(this, varargin)
      % ELIMINATEONE usage: eliminateOne(size_t j) : returns pair< SharedIndexConditional, gtsam::SymbolicFactorGraph >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminateOne(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(443, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.eliminateOne');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SymbolicFactorGraph rhs, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(SymbolicFactorGraph rhs, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SymbolicFactorGraph') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(444, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.equals');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(445, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.print');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(IndexFactor factor) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(IndexFactor factor)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.IndexFactor')
        gtsam_wrapper(446, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.push_back');
      end
    end

    function varargout = push_factor(this, varargin)
      % PUSH_FACTOR usage: push_factor(size_t key),  push_factor(size_t key1, size_t key2),  push_factor(size_t key1, size_t key2, size_t key3),  push_factor(size_t key1, size_t key2, size_t key3, size_t key4) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_factor(size_t key)
      % push_factor(size_t key1, size_t key2)
      % push_factor(size_t key1, size_t key2, size_t key3)
      % push_factor(size_t key1, size_t key2, size_t key3, size_t key4)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(447, this, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        gtsam_wrapper(448, this, varargin{:});
      elseif length(varargin) == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric')
        gtsam_wrapper(449, this, varargin{:});
      elseif length(varargin) == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric')
        gtsam_wrapper(450, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.push_factor');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(451, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.size');
      end
    end

  end

  methods(Static = true)
  end
end
