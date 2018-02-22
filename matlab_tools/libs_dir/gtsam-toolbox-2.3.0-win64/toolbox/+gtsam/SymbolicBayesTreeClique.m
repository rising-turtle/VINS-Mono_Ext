%class SymbolicBayesTreeClique, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicBayesTreeClique()
%SymbolicBayesTreeClique(IndexConditional conditional)
%
%-------Methods-------
%conditional() : returns gtsam::IndexConditional
%deleteCachedShortcuts() : returns void
%equals(SymbolicBayesTreeClique other, double tol) : returns bool
%isRoot() : returns bool
%numCachedSeparatorMarginals() : returns size_t
%permuteWithInverse(Permutation inversePermutation) : returns void
%print(string s) : returns void
%printTree() : returns void
%printTree(string indent) : returns void
%treeSize() : returns size_t
%
classdef SymbolicBayesTreeClique < handle
  properties
    ptr_gtsamSymbolicBayesTreeClique = 0
  end
  methods
    function obj = SymbolicBayesTreeClique(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1752, varargin{2});
        end
        gtsam_wrapper(1751, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1753);
      elseif nargin == 1 && isa(varargin{1},'gtsam.IndexConditional')
        my_ptr = gtsam_wrapper(1754, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.SymbolicBayesTreeClique constructor');
      end
      obj.ptr_gtsamSymbolicBayesTreeClique = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1755, obj.ptr_gtsamSymbolicBayesTreeClique);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = conditional(this, varargin)
      % CONDITIONAL usage: conditional() : returns gtsam::IndexConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % conditional()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1756, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeClique.conditional');
      end
    end

    function varargout = deleteCachedShortcuts(this, varargin)
      % DELETECACHEDSHORTCUTS usage: deleteCachedShortcuts() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % deleteCachedShortcuts()
      if length(varargin) == 0
        gtsam_wrapper(1757, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeClique.deleteCachedShortcuts');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SymbolicBayesTreeClique other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(SymbolicBayesTreeClique other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SymbolicBayesTreeClique') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1758, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeClique.equals');
      end
    end

    function varargout = isRoot(this, varargin)
      % ISROOT usage: isRoot() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isRoot()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1759, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeClique.isRoot');
      end
    end

    function varargout = numCachedSeparatorMarginals(this, varargin)
      % NUMCACHEDSEPARATORMARGINALS usage: numCachedSeparatorMarginals() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % numCachedSeparatorMarginals()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1760, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeClique.numCachedSeparatorMarginals');
      end
    end

    function varargout = permuteWithInverse(this, varargin)
      % PERMUTEWITHINVERSE usage: permuteWithInverse(Permutation inversePermutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteWithInverse(Permutation inversePermutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(1761, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeClique.permuteWithInverse');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1762, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeClique.print');
      end
    end

    function varargout = printTree(this, varargin)
      % PRINTTREE usage: printTree(),  printTree(string indent) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printTree()
      % printTree(string indent)
      if length(varargin) == 0
        gtsam_wrapper(1763, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1764, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeClique.printTree');
      end
    end

    function varargout = treeSize(this, varargin)
      % TREESIZE usage: treeSize() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % treeSize()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1765, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeClique.treeSize');
      end
    end

  end

  methods(Static = true)
  end
end
