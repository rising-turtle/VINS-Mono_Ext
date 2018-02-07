%class GaussianBayesTreeClique, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianBayesTreeClique()
%GaussianBayesTreeClique(GaussianConditional conditional)
%
%-------Methods-------
%conditional() : returns gtsam::GaussianConditional
%deleteCachedShortcuts() : returns void
%equals(GaussianBayesTreeClique other, double tol) : returns bool
%isRoot() : returns bool
%numCachedSeparatorMarginals() : returns size_t
%permuteWithInverse(Permutation inversePermutation) : returns void
%print(string s) : returns void
%printTree() : returns void
%printTree(string indent) : returns void
%treeSize() : returns size_t
%
classdef GaussianBayesTreeClique < handle
  properties
    ptr_gtsamGaussianBayesTreeClique = 0
  end
  methods
    function obj = GaussianBayesTreeClique(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1797, varargin{2});
        end
        gtsam_wrapper(1796, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1798);
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianConditional')
        my_ptr = gtsam_wrapper(1799, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.GaussianBayesTreeClique constructor');
      end
      obj.ptr_gtsamGaussianBayesTreeClique = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1800, obj.ptr_gtsamGaussianBayesTreeClique);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = conditional(this, varargin)
      % CONDITIONAL usage: conditional() : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % conditional()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1801, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeClique.conditional');
      end
    end

    function varargout = deleteCachedShortcuts(this, varargin)
      % DELETECACHEDSHORTCUTS usage: deleteCachedShortcuts() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % deleteCachedShortcuts()
      if length(varargin) == 0
        gtsam_wrapper(1802, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeClique.deleteCachedShortcuts');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianBayesTreeClique other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(GaussianBayesTreeClique other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianBayesTreeClique') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1803, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeClique.equals');
      end
    end

    function varargout = isRoot(this, varargin)
      % ISROOT usage: isRoot() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isRoot()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1804, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeClique.isRoot');
      end
    end

    function varargout = numCachedSeparatorMarginals(this, varargin)
      % NUMCACHEDSEPARATORMARGINALS usage: numCachedSeparatorMarginals() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % numCachedSeparatorMarginals()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1805, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeClique.numCachedSeparatorMarginals');
      end
    end

    function varargout = permuteWithInverse(this, varargin)
      % PERMUTEWITHINVERSE usage: permuteWithInverse(Permutation inversePermutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteWithInverse(Permutation inversePermutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(1806, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeClique.permuteWithInverse');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1807, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeClique.print');
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
        gtsam_wrapper(1808, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1809, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeClique.printTree');
      end
    end

    function varargout = treeSize(this, varargin)
      % TREESIZE usage: treeSize() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % treeSize()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1810, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeClique.treeSize');
      end
    end

  end

  methods(Static = true)
  end
end
