%class SymbolicBayesNetBase, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%back() : returns gtsam::IndexConditional
%equals(SymbolicBayesNetBase other, double tol) : returns bool
%front() : returns gtsam::IndexConditional
%permuteWithInverse(Permutation inversePermutation) : returns void
%pop_front() : returns void
%print(string s) : returns void
%printStats(string s) : returns void
%push_back(IndexConditional conditional) : returns void
%push_back(SymbolicBayesNetBase conditional) : returns void
%push_front(IndexConditional conditional) : returns void
%push_front(SymbolicBayesNetBase conditional) : returns void
%saveGraph(string s) : returns void
%size() : returns size_t
%
classdef SymbolicBayesNetBase < handle
  properties
    ptr_gtsamSymbolicBayesNetBase = 0
  end
  methods
    function obj = SymbolicBayesNetBase(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1736, varargin{2});
        end
        gtsam_wrapper(1735, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.SymbolicBayesNetBase constructor');
      end
      obj.ptr_gtsamSymbolicBayesNetBase = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1737, obj.ptr_gtsamSymbolicBayesNetBase);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = back(this, varargin)
      % BACK usage: back() : returns gtsam::IndexConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % back()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1738, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.back');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SymbolicBayesNetBase other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(SymbolicBayesNetBase other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SymbolicBayesNetBase') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1739, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.equals');
      end
    end

    function varargout = front(this, varargin)
      % FRONT usage: front() : returns gtsam::IndexConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % front()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1740, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.front');
      end
    end

    function varargout = permuteWithInverse(this, varargin)
      % PERMUTEWITHINVERSE usage: permuteWithInverse(Permutation inversePermutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteWithInverse(Permutation inversePermutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(1741, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.permuteWithInverse');
      end
    end

    function varargout = pop_front(this, varargin)
      % POP_FRONT usage: pop_front() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % pop_front()
      if length(varargin) == 0
        gtsam_wrapper(1742, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.pop_front');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1743, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.print');
      end
    end

    function varargout = printStats(this, varargin)
      % PRINTSTATS usage: printStats(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printStats(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1744, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.printStats');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(IndexConditional conditional),  push_back(SymbolicBayesNetBase conditional) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(IndexConditional conditional)
      % push_back(SymbolicBayesNetBase conditional)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.IndexConditional')
        gtsam_wrapper(1745, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.SymbolicBayesNetBase')
        gtsam_wrapper(1746, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.push_back');
      end
    end

    function varargout = push_front(this, varargin)
      % PUSH_FRONT usage: push_front(IndexConditional conditional),  push_front(SymbolicBayesNetBase conditional) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_front(IndexConditional conditional)
      % push_front(SymbolicBayesNetBase conditional)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.IndexConditional')
        gtsam_wrapper(1747, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.SymbolicBayesNetBase')
        gtsam_wrapper(1748, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.push_front');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % saveGraph(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1749, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.saveGraph');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1750, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNetBase.size');
      end
    end

  end

  methods(Static = true)
  end
end
